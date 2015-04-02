
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
     
     para "**First things first! Click the 'Voting Period' tab and create a new 
     voting period(season). Do this at the start of every new season to ensure that the 
     awards, productions, and ballots are stored separately year to year."
     
     para "**Next click on the 'Productions' tab and add all of the productions 
     for the current voting period. As more voting periods accrue please ensure
     that new productions are being stored under the proper voting period. This
     will make sorting by voting period a breeze!"
     
     para "**All of the awards from last year have been pre-populated, but click 
     on the 'Awards' tab if you need to create or delete any awards."

     para "**Now click on the 'Member' tab and add all of the TAG members. 
     Be sure to include a valid E-mail address for all of your members otherwise
     they won't receive their ballot! Once that's finished select them all and 
     click 'Batch Options'. Click 'E-mail Selected' and that's it! Ballots have
     been sent to every selected TAG member. You can also select individual
     member if you ever need to resend a ballot to a particular member."
     
     para "**Finally to view submitted ballots, click the 'Ballots' tab. You can
     click each individual ballot to see the member's nominations and the 
     productions they've seen. To export ballots in handy excel format simply
     select the desired ballots and click 'Batch Actions' followed by 'Excel
     Selected'. An excel file will be automatically downloaded to your computer."
     
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
