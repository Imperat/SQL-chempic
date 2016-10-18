"""ADFS_DB URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
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

from ADFS_DB import views

urlpatterns = [
    url(r'^admin/$', admin.site.urls),
    url(r'^main/$', views.main),
    url(r'^cityes/$', views.cityes),
    url(r'^teams/$', views.teams),
    url(r'^championships/$', views.leagues),
    url(r'^stadions/$', views.stadions),
    url(r'^players/$', views.players),
    url(r'^matches/$', views.matches),
    url(r'^cityes/add/$', views.create_city),
    url(r'^teams/add/$', views.create_team),
    url(r'^championships/add/$', views.create_league),
    url(r'^stadions/add/$', views.create_stadion),
    url(r'^players/add/$', views.create_player),
    url(r'^matches/add/$', views.create_match),
    url(r'^error/$', views.error),
    url(r'^login/$', views.login_view),
    url(r'^logout/$', views.logout_view),
    # for editable forms:
    url(r'^cityes/(?P<id>[0-9]+)/edit$', views.edit_city),
    url(r'^teams/(?P<id>[0-9]+)/edit$', views.edit_team),
    url(r'^championships/(?P<id>[0-9]+)/edit$', views.edit_league),
    url(r'^stadions/(?P<id>[0-9]+)/edit$', views.edit_stadion),
    url(r'^players/(?P<id>[0-9]+)/edit$', views.edit_player),
    url(r'^matches/(?P<id>[0-9]+)/edit$', views.edit_match),

]
