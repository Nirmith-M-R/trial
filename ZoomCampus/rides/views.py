# from django.http import HttpResponse
# from django.shortcuts import render
# from django.template import loader
# from models import SignUP

# # Create your views here.
# def signup(request):
#     mail = request.POST.get('mail')
#     passw = request.POST.get('pass')
#     name = request.POST.get('name')
#     phNo = request.POST.get('phno')
#     gender = request.POST.get('gender')
#     prog = request.POST.get('program')
#     route = request.POST.get('route')

#     print("SignUP Done.")
#     singnup = SignUP(mail=mail, password=passw, name=name, phNo=phNo, gender=gender, program=prog, route=route)
#     signup.save()


from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from .models import SignUP
import json

@csrf_exempt
def signup(request):
    if request.method == 'POST':
        try:
            # Parse the incoming JSON data
            data = json.loads(request.body)

            # Extract user details
            mail = data.get('mail')
            password = data.get('password')
            name = data.get('name')
            phNo = data.get('phNo')
            gender = data.get('gender')
            program = data.get('program')
            route = data.get('route', [])  # Default to an empty list if not provided

            # Validate mandatory fields
            if not (mail and password and name and phNo and gender and program):
                return JsonResponse({'error': 'All fields except route are required.'}, status=400)

            # Create the user
            user = SignUP.objects.create(
                mail=mail,
                password=password,
                name=name,
                phNo=phNo,
                gender=gender,
                program=program,
                route=route
            )

            # Return success response
            return JsonResponse({'success': f'User {user.name} added successfully!'}, status=201)

        except Exception as e:
            # Handle errors
            return JsonResponse({'error': str(e)}, status=500)

    # If the method is not POST
    return JsonResponse({'error': 'Only POST requests are allowed.'}, status=405)