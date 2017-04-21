module AuthFeaturesHelper

  def login_as(user)
    visit(user_url())
  end
end
