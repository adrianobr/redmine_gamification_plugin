get 'gamification' => 'gamification#index'

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
get 'gamification/destroy' => 'gamification#destroy'
get 'gamification/error' => 'gamification#error'
get 'gamification/entry' => 'gamification#entry'
get 'gamification/total' => 'gamification#total'
#get 'gamification/:id', :to => 'gamification#index'
#get 'gamification/create' => 'gamification#create'


get 'gamification/list_premia' => 'gamification#list_premia'
put 'gamification/redeem/:id' => 'gamification#redeem', as: 'gamification_redeem'

resources :gamification_premia

