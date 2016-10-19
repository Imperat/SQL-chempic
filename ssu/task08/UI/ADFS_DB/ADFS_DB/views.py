from django.shortcuts import render
from django.shortcuts import loader

from django.http import HttpResponse, HttpResponseRedirect
from django.template import RequestContext

import requests
from django.contrib.auth import authenticate, login, logout
import forms


def main(request):
    return render(request, 'index.html', {})


def cityes(request):
    template = loader.get_template('cityes.html')
    elements = requests.get('http://127.0.0.1:5000/cityes')
    context = {
        "elements": elements.json(),
    }
    return render(request, 'cityes.html', context)


def players(request):
    elements = requests.get('http://127.0.0.1:5000/players')
    context = {
        "elements": elements.json(),
    }
    return render(request, 'players.html', context)


def teams(request):
    elements = requests.get('http://127.0.0.1:5000/teams')
    context = {
        "elements": elements.json(),
    }
    return render(request, 'teams.html', context)


def stadions(request):
    elements = requests.get('http://127.0.0.1:5000/stadions')
    context = {
        "elements": elements.json(),
    }
    return render(request, 'stadions.html', context)


def leagues(request):
    elements = requests.get('http://127.0.0.1:5000/championships')
    context = {
        "elements": elements.json(),
    }
    return render(request, 'leagues.html', context)


def matches(request):
    elements = requests.get('http://127.0.0.1:5000/matches')
    context = {
        "elements": elements.json(),
    }
    return render(request, 'matches.html', context)


# Create and update objects!

def create_city(request):
    if request.method == 'GET':
        return render(request, 'form.html', {'form': forms.CityForm()})

    form = forms.CityForm(request.POST)
    if form.is_valid():
        resp = requests.post('http://127.0.0.1:5000/cityes', data=dict(request.POST))
        if not resp.json().get("error"):
            return HttpResponseRedirect('/cityes/')
        return HttpResponseRedirect('/error/')


def create_team(request):
    if request.method == 'GET':
        return render(request, 'form.html', {'form': forms.TeamForm()})
    else:
        form = forms.CityForm(request.POST)
        resp = requests.post('http://127.0.0.1:5000/teams', data=dict(request.POST))
        if not resp.json().get("error"):
            return HttpResponseRedirect('/teams/')
        return HttpResponseRedirect('/error/')


def create_stadion(request):
    if request.method == 'GET':
        return render(request, 'form.html', {'form': forms.StadionForm()})
    else:
        form = forms.CityForm(request.POST)
        resp = requests.post('http://127.0.0.1:5000/stadions', data=dict(request.POST))
        if not resp.json().get("error"):
            return HttpResponseRedirect('/stadions/')
        return HttpResponseRedirect('/error/')


def create_match(request):
    if request.method == 'GET':
        return render(request, 'form.html', {'form': forms.MatchForm()})
    else:
        form = forms.CityForm(request.POST)
        resp = requests.post('http://127.0.0.1:5000/matches', data=dict(request.POST))
        if not resp.json().get("error"):
            return HttpResponseRedirect('/matches/')
        return HttpResponseRedirect('/error/')


def create_league(request):
    if request.method == 'GET':
        return render(request, 'form.html', {'form': forms.LeagueForm()})
    else:
        form = forms.CityForm(request.POST)
        resp = requests.post('http://127.0.0.1:5000/championships', data=dict(request.POST))
        if not resp.json().get("error"):
            return HttpResponseRedirect('/leagues/')
        return HttpResponseRedirect('/error/')


def create_player(request):
    if request.method == 'GET':
        return render(request, 'form.html', {'form': forms.PlayerForm()})
    else:
        form = forms.CityForm(request.POST)
        resp = requests.post('http://127.0.0.1:5000/players', data=dict(request.POST))
        if not resp.json().get("error"):
            return HttpResponseRedirect('/players/')
        return HttpResponseRedirect('/error/')


def error(request):
    return render(request, 'error.html', {})


def login_view(request):
    if request.method == 'GET':
        return render(request, 'form.html', {'form': forms.LoginForm()})
    else:
        try:
            username = request.POST['username']
            password = request.POST['password']
            user = authenticate(username=username, password=password)
            login(request, user)
            return render(request, 'login.html', {})
        except Exception:
            return render(request, 'form.html', {'form': forms.LoginForm()})


def logout_view(request):
    logout(request)
    return render(request, 'form.html', {'form': forms.LoginForm()})


# Update views
def edit_city(request, id):
    if request.method == 'GET':
        element = requests.get('http://127.0.0.1:5000/cityes/%s' % id)
        form = forms.CityForm(initial={'name': element.json()['city']['name']})
        return render(request, 'form.html', {'form': form})
    else:
        resp = requests.post('http://127.0.0.1:5000/cityes/%s' % id, data=dict(request.POST))
        if not resp.json().get("error"):
            return HttpResponseRedirect('/cityes/')
        return HttpResponseRedirect('/error/')


def edit_team(request, id):
    if request.method == 'GET':
        element = requests.get('http://127.0.0.1:5000/teams/%s' % id)
        form = forms.TeamForm(initial={'name': element.json()['team']['name'],
                                       'city': element.json()['team']['city_name'],
                                       'birth_day': element.json()['team']['making'],
                                       'budget': element.json()['team']['budget']
        })
        return render(request, 'form.html', {'form': form})
    else:
        resp = requests.post('http://127.0.0.1:5000/teams/%s' % id, data=dict(request.POST))
        if not resp.json().get("error"):
            return HttpResponseRedirect('/teams/')
        return HttpResponseRedirect('/error/')


def edit_league(request, id):
    if request.method == 'GET':
        element = requests.get('http://127.0.0.1:5000/championships/%s' % id)
        form = forms.LeagueForm(initial={
            'name': element.json()['shampionship']['name'],
            'start_date': element.json()['shampionship']['start_date'],
            'end_date': element.json()['shampionship']['end_date']
        })
        return render(request, 'form.html', {'form': form})
    else:
        resp = requests.post('http://127.0.0.1:5000/championships/%s' % id, data=dict(request.POST))
        if not resp.json().get("error"):
            return HttpResponseRedirect('/championships/')
        return HttpResponseRedirect('/error/')


def edit_stadion(request, id):
    if request.method == 'GET':
        element = requests.get('http://127.0.0.1:5000/stadions/%s' % id)
        form = forms.StadionForm(initial={
            'name': element.json()['stadion']['name'],
            'city': element.json()['stadion']['city_name']
        })
        return render(request, 'form.html', {'form': form})
    else:
        resp = requests.post('http://127.0.0.1:5000/stadions/%s' % id, data=dict(request.POST))
        if not resp.json().get("error"):
            return HttpResponseRedirect('/stadions/')
        return HttpResponseRedirect('/error/')


def edit_player(request, id):
    if request.method == 'GET':
        element = requests.get('http://127.0.0.1:5000/players/%s' % id)
        form = forms.PlayerForm(initial={
            'first_name': element.json()['player']['first_name'],
            'last_name': element.json()['player']['last_name'],
            'birth_day':element.json()['player']['birth_day'],
            'position':element.json()['player']['position_name'],
            'salary':element.json()['player']['salary']
        })
        return render(request, 'form.html', {'form': form})
    else:
        resp = requests.post('http://127.0.0.1:5000/players/%s' % id, data=dict(request.POST))
        if not resp.json().get("error"):
            return HttpResponseRedirect('/players/')
        return HttpResponseRedirect('/error/')


def edit_match(request, id):
    if request.method == 'GET':
        element = requests.get('http://127.0.0.1:5000/matches/%s' % id)
        form = forms.MatchForm(initial={
            'league': element.json()['match']['league_name'],
            'home_team': element.json()['match']['home_team_name'],
            'away_team': element.json()['match']['away_team_name'],
            'home_goals':element.json()['match']['home_goals'],
            'away_goals':element.json()['match']['away_goals'],
            'stadion':element.json()['match']['stadion_name'],
            'date': element.json()['match']['date']
        })
        return render(request, 'form.html', {'form': form})
    else:
        resp = requests.post('http://127.0.0.1:5000/matches/%s' % id, data=dict(request.POST))
        if not resp.json().get("error"):
            return HttpResponseRedirect('/matches/')
        return HttpResponseRedirect('/error/')

def delete_city(request, id):
    resp = requests.delete('http://127.0.0.1:5000/cityes/%s' % id)
    if not resp.json().get("error"):
        return HttpResponseRedirect('/main/')
    return HttpResponseRedirect('/error/')

def delete_team(request, id):
    resp = requests.delete('http://127.0.0.1:5000/teams/%s' % id)
    if not resp.json().get("error"):
        return HttpResponseRedirect('/main/')
    return HttpResponseRedirect('/error/')

def delete_league(request, id):
    resp = requests.delete('http://127.0.0.1:5000/championships/%s' % id)
    if not resp.json().get("error"):
        return HttpResponseRedirect('/main/')
    return HttpResponseRedirect('/error/')

def delete_stadion(request, id):
    resp = requests.delete('http://127.0.0.1:5000/stadions/%s' % id)
    if not resp.json().get("error"):
        return HttpResponseRedirect('/main/')
    return HttpResponseRedirect('/error/')

def delete_player(request, id):
    resp = requests.delete('http://127.0.0.1:5000/players/%s' % id)
    if not resp.json().get("error"):
        return HttpResponseRedirect('/main/')
    return HttpResponseRedirect('/error/')

def delete_match(request, id):
    resp = requests.delete('http://127.0.0.1:5000/matches/%s' % id)
    if not resp.json().get("error"):
        return HttpResponseRedirect('/main/')
    return HttpResponseRedirect('/error/')