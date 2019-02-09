
from django.conf.urls import url
from django.contrib import admin
from django.urls import path
from django.conf.urls import include, url

from CRUD_Mysql.views import posts, add_post, update_post, delete_post

urlpatterns = [
    #...........
    url(r'^posts/list/$', posts,  name='list_posts'), #listado
    url(r'^posts/add/$', add_post, name='add_post'), #formulario para añadir
    url(r'^posts/(?P<postid>\d+)/$', update_post, name='update_post'), #formulario para editar
    url(r'^posts/(?P<postid>\d+)/delete/$', delete_post, name='delete_post'), #ruta para eliminar

]