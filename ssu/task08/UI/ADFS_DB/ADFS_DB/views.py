from django.shortcuts import render
from django.shortcuts import loader

from django.http import HttpResponse, HttpResponseRedirect
from django.template import RequestContext

import requests

import forms

def main(request):
    template = loader.get_template('index.html')
    context = RequestContext(request, {

    })
    return HttpResponse(template.render(context))


def cityes(request):
    template = loader.get_template('cityes.html')
    elements = requests.get('http://127.0.0.1:5000/cityes')
    context = {
        "elements": elements.json(),
    }   
    return HttpResponse(template.render(context))


def players(request):
    template = loader.get_template('players.html')
    elements = requests.get('http://127.0.0.1:5000/players')
    context = {
        "elements": elements.json(),
    }
    return HttpResponse(template.render(context))


def teams(request):
    template = loader.get_template('teams.html')
    elements = requests.get('http://127.0.0.1:5000/teams')
    context = {
        "elements": elements.json(),
    }
    return HttpResponse(template.render(context))


def stadions(request):
    template = loader.get_template('stadions.html')
    elements = requests.get('http://127.0.0.1:5000/stadions')
    context = {
        "elements": elements.json(),
    }
    return HttpResponse(template.render(context))


def leagues(request):
    template = loader.get_template('leagues.html')
    elements = requests.get('http://127.0.0.1:5000/championships')
    context = {
        "elements": elements.json(),
    }
    return HttpResponse(template.render(context))


def matches(request):
    template = loader.get_template('matches.html')
    elements = requests.get('http://127.0.0.1:5000/matches')
    context = {
        "elements": elements.json(),
    }
    return HttpResponse(template.render(context))


# Create and update objects!

def create_city(request):
    if request.method == 'GET':
        return render(request, 'form.html', {'form': forms.CityForm()})

    form = forms.CityForm(request.POST)
    if form.is_valid():
        requests.post('http://127.0.0.1:5000/cityes', data=dict(request.POST))
        return HttpResponseRedirect('/cityes/')


def create_team(request):
    if request.method == 'GET':
        return render(request, 'form.html', {'form': forms.TeamForm()})
    else:
        form = forms.CityForm(request.POST)
        requests.post('http://127.0.0.1:5000/teams', data=dict(request.POST))
        return HttpResponseRedirect('/teams/')


def create_stadion(request):
    if request.method == 'GET':
        return render(request, 'form.html', {'form': forms.StadionForm()})
    else:
        form = forms.CityForm(request.POST)
        requests.post('http://127.0.0.1:5000/stadions', data=dict(request.POST))
        return HttpResponseRedirect('/stadions/')


def create_match(request):
    if request.method == 'GET':
        return render(request, 'form.html', {'form': forms.MatchForm()})
    else:
        form = forms.CityForm(request.POST)
        requests.post('http://127.0.0.1:5000/matches', data=dict(request.POST))
        return HttpResponseRedirect('/matches/')


def create_league(request):
    if request.method == 'GET':
        return render(request, 'form.html', {'form': forms.LeagueForm()})
    else:
        form = forms.CityForm(request.POST)
        requests.post('http://127.0.0.1:5000/championships', data=dict(request.POST))
        return HttpResponseRedirect('/leagues/')


def create_player(request):
    if request.method == 'GET':
        return render(request, 'form.html', {'form': forms.PlayerForm()})
    else:
        form = forms.CityForm(request.POST)
        requests.post('http://127.0.0.1:5000/players', data=dict(request.POST))
        return HttpResponseRedirect('/players/')
