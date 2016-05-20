# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

get 'gamification/tutorial' => 'gamification#tutorial'

post 'gamification/regist_rating' => 'gamification#regist_rating'
put 'gamification/upload_image' => 'gamification#upload_image'
get 'gamification/remove_image' => 'gamification#remove_image'
get 'gamification/get_image/:id' => 'gamification#get_image'
get 'gamification/upload_image' => 'gamification#upload_image'
get 'gamification/ranking' => 'gamification#ranking'
get 'gamification/rating' => 'gamification#rating'
get 'gamification/badges' => 'gamification#badges'
get 'projects/:project_id/gamification' => 'gamification#project'
get 'gamification/project' => 'gamification#project'
get 'gamification/create' => 'gamification#create'
get 'gamification/destroy' => 'gamification#destroy'
get 'gamification/error' => 'gamification#error'
get 'gamification/entry' => 'gamification#entry'
get 'gamification/total' => 'gamification#total'
get 'gamification', :to => 'gamification#index'
get 'gamification/:id', :to => 'gamification#index'

get 'gamification_premium/premium' => 'gamification_premium#premium'
get 'gamification_premium' => 'gamification_premium#index'
