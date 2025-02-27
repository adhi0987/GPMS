from django.http import HttpResponse,HttpRequest
from django.template import loader
from django.shortcuts import render,redirect
import psycopg2
from django.contrib import messages
from django.contrib.auth.hashers import make_password
import logging

# Configure logging
logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger(__name__)


def home(request):
    request.session['flag'] = 0
    template = loader.get_template("home.html")
    context = {'flag' : request.session['flag']}
    return HttpResponse(template.render(context,request))
def get_db_connection():
    logger.debug("Attempting to establish a database connection...")
    return psycopg2.connect(
        dbname="22CS10009",
        user="22CS10009",
        password="22CS10009",
        host="10.5.18.69",
        port="5432"
    )

# Signup View
def signup(request):
    logger.debug("Received a request for signup.")
    
    if request.method == "POST":
        username = request.POST.get("username")
        password = request.POST.get("password")
        confirm_password = request.POST.get("confirmPassword")
        user_type = request.POST.get("userType")
        user_id = request.POST.get("userId")

        logger.debug(f"Form data received - Username: {username}, UserType: {user_type}, UserID: {user_id}")

        if password != confirm_password:
            messages.error(request, "Passwords do not match!")
            logger.warning("Signup failed: Passwords do not match.")
            return render(request, "signup.html")

        # Hash the password before storing it
        hashed_password = make_password(password)
        print(len(hashed_password))
        logger.debug("Password hashed successfully.")

        try:
            conn = get_db_connection()
            cur = conn.cursor()
            logger.debug("Database connection established.")

            # Check if user_id exists in the user_type table
            check_user_query = f"SELECT * FROM {user_type} WHERE ID = %s;"
            cur.execute(check_user_query, (user_id,))
            existing_user = cur.fetchone()

            if not existing_user:
                messages.error(request, "User ID not found in the selected user type!")
                logger.warning(f"User ID {user_id} not found in table {user_type}.")
                cur.close()
                conn.close()
                return render(request, "signup.html")

            # Check if username is already taken within the same user_type table
            check_username_query = f"SELECT * FROM {user_type} WHERE username = %s;"
            cur.execute(check_username_query, (username,))
            username_exists = cur.fetchone()

            if username_exists:
                messages.error(request, "Username already taken for this user type!")
                logger.warning(f"Username '{username}' already exists in table {user_type}.")
                cur.close()
                conn.close()
                return render(request, "signup.html")

            # Update username and password in the existing record
            update_query = f"UPDATE {user_type} SET username = %s, passwd = %s WHERE ID = %s;"
            cur.execute(update_query, (username, hashed_password, user_id))
            conn.commit()
            logger.debug(f"User {username} successfully updated in table {user_type}.")

            cur.close()
            conn.close()

            messages.success(request, "Signup successful! Your username and password have been updated.")
            return redirect("home")  # Redirect to home page

        except psycopg2.Error as e:
            messages.error(request, f"Database error: {e}")
            logger.error(f"Database error: {e}")
            return render(request, "signup.html")

    logger.debug("Rendering signup page.")
    return render(request, "signup.html")