= Gamification

Gamification is the use of game mechanics, dynamics (e.g., competitive behaviour) and emotions (e.g., anticipation) in order to engage players employees in updating their issues on Redmine

This plugin gives the project team a way to motivate given levels, badges and ranking.

This plugin was originally develop by Kazuto Horita (http://github.com/kzth/redmine_gamification_plugin) and then translated by GuruM (http://github.com/GuruOnNet/redmine_gamification_plugin)

= Installation

Redmine version support: 3.0.x, 2.6.x, 2.5.x

To install the plugin, execute the following commands from the root of your Redmine directory:

cd plugins  

git clone git://github.com/mauricio-camayo/redmine_gamification_plugin

bundle install  

rake redmine:plugins:migrate RAILS_ENV=production


More information on installing Redmine plugins can be found at redmine.org.

After the plugin is installed you will need to restart Redmine for the plugin to be available.
