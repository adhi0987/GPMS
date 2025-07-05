from django.urls import path
from . import views

urlpatterns = [
     path('', views.home, name='home'),
     path('signup.html',views.signup,name='signup'),
     path('login',views.login,name='login'),
     path('logout',views.logout,name = 'logout'),

     path('villagedashboard/',views.village_dashboard,name='villagedashboard'),


     path('citizens/',views.citizens,name='citizens'),

     path('citizens/profile/',views.citizensProfile,name = 'citizensProfile'),
     path('citizens/profile/editprofile/',views.editCitizenProfile,name = 'editCitizenProfile'),

     path('citizens/mycertificates/',views.mycertificates,name = 'mycertificates'),

     path('citizens/myschemes/',views.citizenschemes,name = 'citizenschemes'),

     path('citizens/tax_payments/',views.citizenTaxes,name = 'citizenTaxes'),
     path('citizens/tax_payments/paymentPage/',views.citizenPayments,name='citizenPayments'),
     path('citizens/tax_payments/previousTransactions/',views.previousTransactions,name='previousTransactions'),
     
     path('citizens/land_records/', views.land_records, name = 'land_records'),
     path('citizens/land_records/crop_history/', views.crop_history, name='crop_history'),
     path('citizens/land_records/updateLandRecord/', views.updateLandRecord, name='updateLandRecord'),

     path('citizens/addcomplaints',views.addcomplaints,name='addcomplaints'),

     path('panchayat_employees/',views.panemp,name='panchayat_employees'),
     path('panchayat_employees/addcitizen/',views.addcitizen,name="addcitizen"),
     path('panchayat_employees/updateCitizen/',views.updateCitizen,name="updateCitizen"),

     path('panchayat_employees/addland/',views.addland,name="addland"),
     path('panchayat_employees/updateLand/',views.updateLand,name="updateLand"),
     path('panchayat_employees/previousOwners/',views.previousOwners,name="previousOwners"),

     path('panchayat_employees/issuecertificate/',views.issuecertificate,name="issuecertificate"),

     path('panchayat_employees/paymentPage',views.citizenPayments,name="panchayat_taxpay"),
     path('panchayat_employees/enroll_eligible_members/', views.enroll_eligible_members, name='enroll_eligible_members'),
     path('panchayat_employees/enrolltoschemes/',views.enrolltoschemes,name="enrolltoschemes"),
     
     path('panchayat_employees/viewscheme/',views.viewscheme,name="viewscheme"),
     path("panchayat_employees/delete_scheme/<int:scheme_id>/", views.delete_scheme, name="delete_scheme"),
     path('panchayat_employees/addschemes/',views.addschemes,name="addschemes"),
     
     path('panchayat_employees/edit_asset/', views.edit_asset, name="edit_asset"),
     path("panchayat_employees/delete_asset/<int:asset_id>/", views.delete_asset, name="delete_asset"),
     path('panchayat_employees/addassets/',views.addassets,name="addassets"),
     
     path('panchayat_employees/addhousehold/',views.addhousehold,name="addhousehold"),
     
     path('panchayat_employees/addNotification/',views.addNotification,name="addNotification"),

     path('govt_monitors',views.govt_monitors,name='govt_monitors'),
     path('Admin', views.Admin, name = 'Admin'),
     path('Admin/addGovtMonitor_admin', views.addGovtMonitor_admin, name = 'addGovtMonitor_admin'),
     path('Admin/addemployee_admin', views.addemployee_admin, name = 'addemployee_admin'),  
     path('Admin/deleteGM/',views.inactiveGM,name = 'inactiveGM'),
     path('Admin/deletePE/',views.inactivePE,name = 'inactivePE'),
     path('update_all_taxes/', views.update_all_taxes, name='update_all_taxes'),

]
