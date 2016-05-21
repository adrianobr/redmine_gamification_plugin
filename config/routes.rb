# OSB: A ordem das rotas podem causar bug nos links

##Participar da Gamificação
get 'gamification/entry' => 'gamification#entry'
get 'gamification/create', :to => 'gamification#create'
##Sair da Gamificação
get 'gamification/destroy' => 'gamification#destroy'

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
get 'gamification/error' => 'gamification#error'
get 'gamification/total' => 'gamification#total'
##Premiação Lista e Resgatar
get 'gamification/list_premia' => 'gamification#list_premia'
put 'gamification/redeem/:id' => 'gamification#redeem', as: 'gamification_redeem'

get 'gamification/:id', :to => 'gamification#index'
get 'gamification' => 'gamification#index'



##Cadastro de Prêmios
resources :gamification_premia

