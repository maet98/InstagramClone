# Generated by Django 3.1.7 on 2021-03-13 02:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('instaClone', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='myuser',
            name='profile_picture',
            field=models.CharField(max_length=2000),
        ),
    ]
