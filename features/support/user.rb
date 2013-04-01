module UserHelpers
  def userWithName(username)
    begin
      User.find_by_name!(username)
    rescue Object => e
      raise "Can't find a user with name \"#{username}\"."
    end
  end
end
World(UserHelpers)
