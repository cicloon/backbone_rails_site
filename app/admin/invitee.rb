ActiveAdmin.register Invitee do
  belongs_to :user

  index do
    column :name
    column :coming
    column :can_be_child
    column :adult_menu
    default_actions                   
  end

  form do |f|                         
    f.inputs "Invitado" do
      f.input :name
      f.input :coming 
      f.input :can_be_child
      f.input :adult_menu
    end                               
    f.actions                         
  end  

end