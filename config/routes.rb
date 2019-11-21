Rails.application.routes.draw do

  match("/sign_up", {:controller => "users", :action => "registration_form", :via => "get" })

  match("/sign_in", {:controller => "users", :action => "session_form", :via => "get" })

  match("/verify_credentials", {:controller => "users", :action => "add_cookie", :via => "post" })

  match("/sign_out", {:controller => "users", :action => "remove_cookie", :via => "get" })

  match("/", { :controller => "users", :action => "index", :via => "get" })

  # User routes

  # CREATE
  match("/insert_user_record", {:controller => "users", :action => "create", :via => "post"})

  # READ
  match("/users", {:controller => "users", :action => "index", :via => "get"})
  match("/users/:the_username", {:controller => "users", :action => "show", :via => "get"})
  match("/users/:the_username/own_photos", {:controller => "users", :action => "own_photos", :via => "get"})
  match("/users/:the_username/liked_photos", {:controller => "users", :action => "liked_photos", :via => "get"})
  match("/users/:the_username/feed", {:controller => "users", :action => "feed", :via => "get"})
  match("/users/:the_username/discover", {:controller => "users", :action => "discover", :via => "get"})


  # UPDATE
  match("/update_user/:the_user_id", {:controller => "users", :action => "update", :via => "post"})

  # DELETE
  match("/delete_user/:the_user_id", {:controller => "users", :action => "destroy", :via => "get"})



  # Photo routes

  # CREATE
  match("/insert_photo_record", { :controller => "photos", :action => "create", :via => "post"})

  # READ
  match("/photos", { :controller => "photos", :action => "index", :via => "get"})

  match("/photos/:the_photo_id", { :controller => "photos", :action => "show", :via => "get"})

  match("/photos/:the_photo_id/comments", { :controller => "photos", :action => "comments", :via => "get"})
  match("/photos/:the_photo_id/likes", { :controller => "photos", :action => "likes", :via => "get"})
  match("/photos/:the_photo_id/fans", { :controller => "photos", :action => "fans", :via => "get"})

  # UPDATE
  match("/update_photo/:the_photo_id", { :controller => "photos", :action => "update", :via => "post"})

  # DELETE
  match("/delete_photo/:the_photo_id", { :controller => "photos", :action => "destroy", :via => "get"})


  # Like routes

  # CREATE
  match("/insert_like_record", {:controller => "likes", :action => "create", :via => "post"})

  # READ
  match("/likes", {:controller => "likes", :action => "index", :via => "get"})
  match("/likes/:the_like_id", {:controller => "likes", :action => "show", :via => "get"})

  # UPDATE
  match("/update_like/:the_like_id", {:controller => "likes", :action => "update", :via => "get"})

  # DELETE
  match("/delete_like/:the_like_id", {:controller => "likes", :action => "destroy", :via => "get"})

  # Comment routes

  # CREATE
  match("/insert_comment_record", { :controller => "comments", :action => "create", :via => "post"})

  # READ
  match("/comments", { :controller => "comments", :action => "index", :via => "get"})
  match("/comments/:the_comment_id", { :controller => "comments", :action => "show", :via => "get"})

  # UPDATE
  match("/update_comment/:the_comment_id", { :controller => "comments", :action => "update", :via => "get"})

  # DELETE

  match("/delete_comment/:the_comment_id", { :controller => "comments", :action => "destroy", :via => "get"})

  # ===============Route for Admin Dashboard========================
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
