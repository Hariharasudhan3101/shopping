from django.db import models
from django.contrib.auth.models import User
import datetime
import os

# Create your models here.

def getFileName(request,fileName):
    now_time=datetime.datetime.now().strftime("%y%m%d%H:%M:%S")
    new_fileName="%s%s"%(now_time,fileName)
    return os.path.join('update/',new_fileName)



class catagory(models.Model):
    name=models.CharField(max_length=150,null=False,blank=False)
    image=models.ImageField(upload_to=getFileName,null=True,blank=True)
    description=models.TextField(max_length=1000,null=False,blank=False)
    status=models.BooleanField(default=False,help_text="0-show,1-Hidden")
    created_at=models.DateTimeField(auto_now_add=True)



def __self__(self):
    return self.name


class product(models.Model):
    category=models.ForeignKey(catagory,on_delete=models.CASCADE)
    name=models.CharField(max_length=150,null=False,blank=False)
    vendor=models.CharField(max_length=150,null=False,blank=False)
    product_image=models.ImageField(upload_to=getFileName,null=True,blank=True)
    quantity=models.IntegerField(null=False,blank=False)
    original_price=models.FloatField(null=False,blank=False)
    selling_price=models.FloatField(null=False,blank=False)
    description=models.TextField(max_length=500,null=False,blank=False)
    status=models.BooleanField(default=False,help_text="0-default,1-Hidden")
    trending=models.BooleanField(default=False,help_text="0-default,1-trending")
    created_at=models.DateTimeField(auto_now_add=True)


def __self__(self):
    return self.name

class Cart(models.Model):
  user=models.ForeignKey(User,on_delete=models.CASCADE)
  product=models.ForeignKey(product,on_delete=models.CASCADE)
  product_qty=models.IntegerField(null=False,blank=False)
  created_at=models.DateTimeField(auto_now_add=True)


  @property
  def total_cost(self):
    return self.product_qty*self.product.selling_price

class Favourite(models.Model):
	user=models.ForeignKey(User,on_delete=models.CASCADE)
	product=models.ForeignKey(product,on_delete=models.CASCADE)
	created_at=models.DateTimeField(auto_now_add=True)
 