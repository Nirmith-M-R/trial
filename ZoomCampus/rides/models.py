from django.db import models

# Create your models here.

class SignUP(models.Model):
    mail = models.CharField(max_length=30)
    password = models.CharField(max_length=10)
    name = models.CharField(max_length=30)
    phNo = models.CharField(max_length=10)
    gender = models.CharField(max_length=6)
    program = models.CharField(max_length=20)
    route = models.JSONField()

