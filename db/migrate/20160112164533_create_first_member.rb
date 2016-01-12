class CreateFirstMember < ActiveRecord::Migration
  def up
    unless Member.any? 
      Member.create(name: 'Admin', email: 'admin@example.com', password: '123456', password_confirmation: '123456')
    end
  end

  def down
  end
end
