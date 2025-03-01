from django.urls import path
from . import views

urlpatterns = [
     path('', views.home, name='home'),
     path('signup.html',views.signup,name='signup'),
     path('login',views.login,name='login'),
     path('villagedashboard',views.village_dashboard,name='villagedashboard'),
     path('citizens',views.citizens,name='citizens'),
     path('citizens/tax_payments',views.citizenTaxes,name = 'citizenTaxes'),
     path('citizens/mycertificates',views.mycertificates,name = 'mycertificates'),
     path('panchayat_employees',views.panemp,name='panchayat_employees'),
     path('citizens/paymentPage/',views.citizenPayments,name='citizenPayments'),
     path('citizens/previousTransactions/',views.previousTransactions,name='previousTransactions'),
     path('citizens/land_records', views.land_records, name = 'land_records'),
     path('citizens/myschemes',views.citizenschemes,name = 'citizenschemes'),
     path('citizens/profile',views.citizensProfile,name = 'citizensProfile'),
     path('citizens/editprofile',views.editCitizenProfile,name = 'editCitizenProfile'),
     path('govt_monitors',views.govt_monitors,name='govt_monitors'),
     path('logout',views.logout,name = 'logout'),

     path('addcitizen',views.addcitizen,name="addcitizen"),
     path('addland',views.addland,name="addland"),
     path('issuecertificate',views.issuecertificate,name="issuecertificate"),
     path('enrolltoschemes',views.enrolltoschemes,name="enrolltoschemes"),
     path('addschemes',views.addschemes,name="addschemes"),
     path('Admin', views.Admin, name = 'Admin'),
     path('Admin/addGovtMonitor_admin', views.addGovtMonitor_admin, name = 'addGovtMonitor_admin'),
     path('Admin/addemployee_admin', views.addemployee_admin, name = 'addemployee_admin'),  
     path('addassets',views.addassets,name="addassets"),
     path('addhousehold',views.addhousehold,name="addhousehold"),
     path('updateCitizen/',views.updateCitizen,name="updateCitizen"),
]
