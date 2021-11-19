ActiveAdmin.register Challenge do
  permit_params :starting_time, :ending_time, :challenge_name, :challenge_image,
                :removal_policy, :new_user_policy, :penalty_policy, :workout_perday_policy, :workout_criteria, :prize_policy, :challenge_handle, :number_of_teams

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
