class AddInitialAdminUser < ActiveRecord::Migration
  def up
    FactoryGirl.create(:admin_user, :email => "admin@example.com")
  end

  def down
    user = User.find_by_email("admin@example.com")
    user.destroy
  end
end
