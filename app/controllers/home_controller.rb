  def index
  end

  #an example custom action that will remove all of the associations between Users and Albums, effectively resetting album ownership
  def reset_button
    User.all.each do |user|
      user.forget_albums
    end
    puts 'Boom!'
    redirect_to root_path
  end