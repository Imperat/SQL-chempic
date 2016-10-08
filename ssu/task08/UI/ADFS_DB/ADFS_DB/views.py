from django.shortcuts import render
from django.shortcuts import loader

from django.http import HttpResponse
from django.template import RequestContext

import requests


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
