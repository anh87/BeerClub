module API
  module Entities
    class Users < Grape::Entity
      user = FactoryGirl.build :user, email: Faker::Internet.email, role: Role.find_or_create_by(name: 'Admin')

      expose :id, documentation: { type: 'integer', values: [Faker::Number.digit] }
      expose :name, documentation: { type: 'string', values: [user.name] }
      expose  :email, documentation: { type: 'string', values: [user.email] }
      expose  :passport, using: API::Entities::Passports
      # expose  :password, documentation: { type: 'string', values: [user.password] }
      # expose  :password_confirmation, documentation: { type: 'string', values: [user.password] }
    end

    class UsersLogin < Users
      expose  :token, documentation: { type: 'string', values:  ['$2a$10$ET5AkauJoYJKUuplJlIf/eiyhyPFELGMbtqJg7Buvdyy5Buw0JzIq']}
      expose  :client, documentation: { type: 'string', values:  ['CBo21SyKATc3VX00ABuCOQ']}
    end
  end
end
