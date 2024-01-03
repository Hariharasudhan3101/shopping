from django.http import JsonResponse
from django.shortcuts import render,redirect
from firstapp.form import CustomUserForm
from . models import *
from django.contrib import messages
from django.contrib.auth import authenticate,login,logout
import json
# Create your views here.

def run(request):
    data=product.objects.filter(trending=1)
    return render(request,'firstapp/index.html',{"products":data})

def favviewpage(request):
  if request.user.is_authenticated:
    fav=Favourite.objects.filter(user=request.user)
    return render(request,"firstapp/fav.html",{"fav":fav})
  else:
    return redirect("/")

def remove_fav(request,fid):
  item=Favourite.objects.get(id=fid)
  item.delete()
  return redirect("/favviewpage")


def cart_page(request):
  if request.user.is_authenticated:
    cart=Cart.objects.filter(user=request.user)
    return render(request,"firstapp/cart.html",{"cart":cart})
  else:
    return redirect("/")

def remove_cart(request,cid):
  cartitem=Cart.objects.get(id=cid)
  cartitem.delete()
  return redirect("/cart")


def fav_page(request):
   if request.headers.get('x-requested-with')=='XMLHttpRequest':
    if request.user.is_authenticated:
      data=json.load(request)
      product_id=data['pid']
      product_status=product.objects.get(id=product_id)
      if product_status:
         if Favourite.objects.filter(user=request.user.id,product_id=product_id):
          return JsonResponse({'status':'Product Already in Favourite'}, status=200)
         else:
          Favourite.objects.create(user=request.user,product_id=product_id)
          return JsonResponse({'status':'Product Added to Favourite'}, status=200)
    else:
      return JsonResponse({'status':'Login to Add Favourite'}, status=200)
   else:
    return JsonResponse({'status':'Invalid Access'}, status=200)

def add_to_cart(request):
    if request.headers.get('X-requested-with')=='XMLHTTpRequest':
      if request.user.is_authenticated:
            data=json.load(request)
            product_qty=data['product_qty']
            product_id=data['pid']
            #print(request.user.id)
            product_status=product.objects.get(id=product_id)
            if product_status:
                if Cart.objects.filter(user=request.user.id,product_id=product_id):
                    return JsonResponse({'status':'Product Already In Cart'}, status=200) 
                else:
                    if product_status.quantity>=product_qty:
                        Cart.objects.create(user=request.user,product_id=product_id,product_qty=product_qty)
                        return JsonResponse({'status':'Product Added to Cart'}, status=200)
                    else:
                        return JsonResponse({'status':'Product Stock Not Available'}, status=200)   
      else:
       return JsonResponse({'status':'Login to Add Cart'}, status=200)   
    else:
     return JsonResponse({'status':'Invalied Access'}, status=200)

def logout_page(request):
  if request.user.is_authenticated:
    logout(request)
    messages.success(request,"Logged out Successfully")
  return redirect("/")


def login_page(request):
    if request.user.is_authenticated:
        return redirect("/")
    else:
        if request.method=='POST':
            name=request.POST.get('username')
            pwd=request.POST.get('password')
            user=authenticate(request,username=name,password=pwd)
            if user is not None:
                login(request,user)
                messages.success(request,"Logged in successfully")
                return redirect("/")
            else:
                messages.error(request,"Invalied User Name Or Password")
                return redirect("/login")
        return render(request,'firstapp/login.html')
        
def reg(request):
  form=CustomUserForm()
  if request.method=='POST':
    form=CustomUserForm(request.POST)
    if form.is_valid():
      form.save()
      messages.success(request,"Registration Success You can Login Now..!")
      return redirect('login')
  return render(request,"firstapp/reg.html",{'form':form})
 
def collections(request):
    mydata=catagory.objects.all()
    return render(request,'firstapp/collections.html',{'item':mydata})
    
def collectionsview(request,name):
  if(catagory.objects.filter(name=name)):
      data=product.objects.filter(category__name=name)
      return render(request,"firstapp/products/index.html",{"products":data,"catagory_name":name})
  else:
    messages.warning(request,"No Such Catagory Found")
    return redirect('collections')
 
def product_details(request,cname,pname):
    if(catagory.objects.filter(name=cname)):
        if(product.objects.filter(name=pname)):
            data=product.objects.filter(name=pname).first()
            return render(request,"firstapp/products/product_details.html",{"products":data})
        else:
            messages.error(request,"No Such Product Found")
            return redirect('collections')
    else:
        messages.error(request,"No Such Catagory Found")
        return redirect('collections')


    
    

    