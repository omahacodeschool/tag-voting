include ObfuscateId

ActiveAdmin.register Member do
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
end
