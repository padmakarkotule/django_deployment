from django.urls import path
from . import views

# urls or common or mostly used components within application.
# Following urls add based on application requirement.
# path('accounts/login/', views.login, name='login')
# path('accounts/logout/', views.logout, name='logout')
# path('home/', views.home, name='home')
# path('', views.home, name='home')  # Default landing page
# path('docs/', views.docs, name='docs')
# path('support/', views.support, name='support')
# path('dashboard/', views.dashboard, name='dashboard')
# path('report/', views.report, name='report')

urlpatterns = [
    path('', views.homepage, name='home'),
]