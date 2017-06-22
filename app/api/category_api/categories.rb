module CategoryApi
  class Categories < Grape::API
    prefix :api
    version 'v1', using: :accept_version_header

    resource :categories do

      before do
        authenticated!
      end

      # => /api/v1/users/
      desc 'create new category' #, entity: Entities::UserEntities::Users
      params do
        requires :category, type: Hash do
          requires :name, type: String, desc: 'Category Namer'
        end
      end
      post '/' do
        @category = @current_member.bar.categories.create!(name: params[:category][:name])
        return_message(I18n.t('success'), CategorySerializer.new(@category))
      end
    end
  end
end
