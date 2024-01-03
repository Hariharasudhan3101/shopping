from django.contrib import admin
from .models import *

# Register your models here.
class catagoryAdmin(admin.ModelAdmin):
    list_display = ('name','image','description')
class ProductAdmin(admin.ModelAdmin):
    list_display = ('name','description')


admin.site.register(catagory,catagoryAdmin)
admin.site.register(product,ProductAdmin)


