"""ParliamentElections URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from elections.views import *


urlpatterns = [
    url(r'^adminofdjango/', admin.site.urls),

    url(r'^adminlogin/', adminlogin, name='adminlogin'),
    url(r'^logout_admin/', logout_admin, name='logout_admin'),
    url(r'^admindisplay/', admindisplay, name='admindisplay'),
    url(r'^createsession/', create_election_session, name='create_election_session'),
    url(r'^startvoting/', startvoting, name='startvoting'),
    url(r'^endvoting/', endvoting, name='endvoting'),
    url(r'^result/', result, name='result'),
    url(r'^verifyresult/', verifyresult, name='verifyresult'),
    url(r'^displayresultchoice/', displayresultchoice, name='displayresultchoice'),
    url(r'^showresults/', showresults, name='showresults'),

    url(r'^register/', register, name='register'),
    url(r'^login/', login_user, name='login_user'),
    url(r'^logout/', logout_user, name='logout_user'),
    url(r'^dashboard/', dashboard, name='dashboard'),
    url(r'^voter_register/', voter_register, name='voter_register'),
    url(r'^candidate_register/', candidate_register, name='candidate_register'),
    url(r'^updateprofile/', updateprofile, name='updateprofile'),
    url(r'^verifycandi/', verifycandi, name='verifycandi'),
    url(r'^vote_cast/', vote_cast, name='vote_cast'),

]
