from django.contrib import admin
from django.urls import path, include
from rest_framework import routers
from instaClone.views import PostViewSet, ProfileViewSet, CommentViewSet, UserLikeCommentViewSet, UserLikePostViewSet
from django.conf.urls.static import static
from django.conf import settings

# Routers provide an easy way of automatically determining the URL conf.

router = routers.DefaultRouter(trailing_slash=False)
router.register(r'posts', PostViewSet)
router.register(r'profiles', ProfileViewSet, basename='profiles')
router.register(r'comments', CommentViewSet)
router.register(r'user_comments', UserLikeCommentViewSet)
router.register(r'user_posts', UserLikePostViewSet)


urlpatterns = [
    path('api/', include(router.urls)),
    path('api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    path('api/auth/', include('djoser.urls.authtoken')),
    path('admin/', admin.site.urls),
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)