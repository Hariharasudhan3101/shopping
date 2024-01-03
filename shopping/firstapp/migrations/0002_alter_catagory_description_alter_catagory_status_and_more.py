# Generated by Django 4.2.7 on 2023-11-22 01:30

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('firstapp', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='catagory',
            name='description',
            field=models.TextField(max_length=1000),
        ),
        migrations.AlterField(
            model_name='catagory',
            name='status',
            field=models.BooleanField(default=False, help_text='0-show,1-Hidden'),
        ),
        migrations.CreateModel(
            name='Cart',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('product_qty', models.IntegerField()),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='firstapp.product')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
