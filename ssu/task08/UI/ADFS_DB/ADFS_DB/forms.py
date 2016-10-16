# -*- coding: utf-8 -*-

from django import forms

class CityForm(forms.Form):
	name = forms.CharField(label='Название города',
		                   max_length=100)


class TeamForm(forms.Form):
	name = forms.CharField(label='Название команды')
	city = forms.CharField(label='Город прописки команды')
	birth_day = forms.CharField(label='Дата основания команды')
	budget = forms.IntegerField(label='Бюджет')


class StadionForm(forms.Form):
	name = forms.CharField(label='Название стадиона')
	city = forms.CharField(label='Название города стадиона')


class LeagueForm(forms.Form):
	name = forms.CharField(label='Название чемпионата')
	start_date = forms.DateField(label='Дата начала чемпионата')
	end_date = forms.DateField(label='Дата окончания чемпионата')


class PlayerForm(forms.Form):
	first_name = forms.CharField(label='Имя игрока')
	last_name = forms.CharField(label='Фамилия игрока')
	position = forms.CharField(label='Игровая позиция')
	birth_day = forms.DateField(label='День рождения')
	salary = forms.IntegerField(label='Зарплата')


class MatchForm(forms.Form):
	league = forms.CharField(label='Чемпионат')
	home_team = forms.CharField(label='Хозяева')
	away_team = forms.CharField(label='Гости')
	home_goals = forms.IntegerField(label='Голы хозяев')
	away_goals = forms.IntegerField(label='Голы гостей')
	stadion = forms.CharField(label='Стадион')
	date = forms.DateTimeField(label='Дата и время проведения')
