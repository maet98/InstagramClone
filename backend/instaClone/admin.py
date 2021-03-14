from django.contrib import admin
from .models import Profile, Post


# Register your models here.
class ProfileAdmin(admin.ModelAdmin):
    pass


class PostAdmin(admin.ModelAdmin):
    pass


admin.site.register(Profile, ProfileAdmin)
admin.site.register(Post, PostAdmin)
