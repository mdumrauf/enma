class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_filter :create

  def create
    @client = Github.new(:login => "mdumrauf", :password => "matiiar50zx0o", :org => "dds-utn")
    @teams  = @client.organizations.teams.list("dds-utn")
    @teams.each { |e| logger.info e }
  end

  def add_user(team_name, user)
    team = @teams.find { |e| e['name'] == team_name }
    if team != nil
      begin
        @client.organizations.teams.add_member(team.id, user) unless user.strip.length == 0
      rescue Exception => e
        $logger.error e.message
        $logger.error e.backtrace.inspect
      end
    else
      logger.error "Team: #{team_name} is invalid"
    end
  end

  def github

    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?

      logger.info "=========== TRUE =============="
      group_code = Group.find_by(id: @user.group_id).code
      course_code = Course.find_by(id: @user.course_id).code
      team_name = "2015-#{course_code}-group-#{group_code}"

      add_user(team_name, @user.nickname)

      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Github") if is_navigational_format?
    else
      logger.info "=========== FALSE =============="
      session["devise.github_data"] = request.env["omniauth.auth"].except("extra").merge(password: @user.password)
      redirect_to new_user_registration_url
    end
  end

end
