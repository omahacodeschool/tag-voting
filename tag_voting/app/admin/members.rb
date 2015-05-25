
ActiveAdmin.register Member do
  index do
    selectable_column
    column :member_identification
    column :name
    column :email
    column :voted
    column :created_at
    column :updated_at
    actions
  end
  
  filter :name  
  filter :email
  filter :voted
  
  batch_action :email do |members|
    members_array = Member.where(id: members)
    
    members_array.each do |member_object|
      if !member_object.email.blank?
        MemberMailer.ballot_email(member_object).deliver
      end
    end
    
    redirect_to collection_path, alert: "The email(s) were successfully sent."
  end
  
  show do
    attributes_table do
      row :member_identification
      row :name
      row :email
      row :voted
      row :created_at
      row :updated_at
    end
  end
  
  form do |f|
    f.inputs "Member Details" do
      f.input :name
      f.input :email
    end
    f.actions
  end
  
end
