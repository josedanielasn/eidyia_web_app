module ControllerMacros
<<<<<<< HEAD
    def login_user
        before(:each) do
          @request.env["devise.mapping"] = Devise.mappings[:user]
          user = FactoryBot.create(:user)
          sign_in user
        end
    end
=======
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      admin = FactoryBot.create(:user, :admin)
      sign_in admin
    end
  end
>>>>>>> d2f6c51... Added helper for log_in in devise for testings
end
