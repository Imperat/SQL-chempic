from django.shortcuts import render
from django.shortcuts import loader

from django.http import HttpResponse
from django.template import RequestContext

import requests

# Create your views here.
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