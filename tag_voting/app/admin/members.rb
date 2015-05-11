
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
  
  members_array = []
  batch_action :email do |members|
    members.each do |member|  
      members_array << Member.find_by_id(member.to_i)
        members_array.each do |member_object|
          MemberMailer.ballot_email(member_object).deliver
        end
        redirect_to collection_path, alert: "The Email(s) were successfully sent"
    end
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
  
end
