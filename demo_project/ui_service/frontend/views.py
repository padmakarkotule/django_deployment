from django.shortcuts import render, redirect, get_object_or_404
from django.utils import timezone

# Create your views here.

def homepage(request):
    return render(request, 'home/home.html')