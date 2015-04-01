ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  # content :title => proc{ I18n.t("active_admin.dashboard") } do
 #    div :class => "blank_slate_container", :id => "dashboard_default_message" do
 #      span :class => "blank_slate" do
 #        span I18n.t("active_admin.dashboard_welcome.welcome")
 #        small I18n.t("active_admin.dashboard_welcome.call_to_action")
 #      end
 #    end
 ActiveAdmin.register_page "Dashboard" do
   content do
     para "Welcome to the Tag Voting Admin Site!"
     
     para "Click on the tabs above to view each section."
     
     para "**To generate a new email and resend a ballot to a member, 
     go to the Members tab and select the Member ID. Then click on batch actions.
     Then select 'Email Selected'. "
     
     para "**To View/Print Member voting, go to the Nominations page.
     At the bottom, click on the CSV link to export."
     
   end
 end

  # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
    # content
# end
end
