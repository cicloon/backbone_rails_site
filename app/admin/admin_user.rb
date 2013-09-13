ActiveAdmin.register AdminUser do     
  index do
    column :user_name                            
    column :email                     
    column :current_sign_in_at        
    column :last_sign_in_at           
    column :sign_in_count             
    default_actions                   
  end                                 

  filter :user_name                       

  form do |f|                         
    f.inputs "Detalles del Administrador" do
      f.input :user_name
      f.input :email                  
      f.input :password               
      f.input :password_confirmation  
    end                               
    f.actions                         
  end                                 
end                                   
