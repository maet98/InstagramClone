from .models import Profile, Post, Comment, user_like_comment, user_like_post
from django import forms
from django.contrib.auth.models import User
from rest_framework import serializers


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'username', 'email', 'password']
        extra_kwargs = {'password': {'write_only': True}}


class CommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comment
        fields = '__all__'


class PostSerializer(serializers.ModelSerializer):
    comments = CommentSerializer(many=True)
    like = serializers.IntegerField(read_only=True, source='likes.count')

    class Meta:
        model = Post
        fields = ['photo', 'caption', 'user', 'comments', 'like']


class ProfileSerializer(serializers.ModelSerializer):
    user = UserSerializer(read_only=True)
    posts = PostSerializer(many=True)

    class Meta:
        model = Profile
        fields = ["profile_picture", "bio", "user", "posts"]

    # def create(self, validated_data):
    #     print(validated_data)
    #     user_data = validated_data.pop('user')
    #     user = UserSerializer.create(UserSerializer(), validated_data=user_data)
    #     profile, created = Profile.objects.update_or_create(user=user, profile_picture=validated_data.pop('profile_picture'), bio=validated_data.pop('bio'))
    #     return profile



class UserLikeCommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = user_like_comment
        fields = '__all__'


class UserLikePostSerializer(serializers.ModelSerializer):
    class Meta:
        model = user_like_post
        fields = '__all__'
