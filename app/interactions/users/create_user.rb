module Users
  class Create < ActiveInteraction::Base
    hash :params do
      string :name, :patronymic, :email,
        :nationality, :country, :gender

      integer :age

      array :interests, :skills

      validates(
        :name,
        :patronymic,
        :email,
        :nationality,
        :country,
        :gender,
        :age,
        presence: true
      )

      validates :age, compartion: { greater_than: 0, less_than_or_equal_to: 90 }
      validates :gender, inclusion: { in: %w[male female] }
    end

    def execute
      return if User.where(email: params['email'])

      user_full_name = "#{params['surname']} #{params['name']} #{params['patronymic']}"
      user_params = params.except(:interests)
      user = User.create(user_params.merge(user_full_name))

      # синтаксическая ошибка: было Intereset, нужно Interest
      # N+1 ошибка
      user.interests = Interest.where(name: params['interests'])
      user.save!

      user_skills = []
      params['skills'].split(',').each do |skil|
        skil = Skil.find(name: skil)
        user_skills =  user_skills + [skil]
      end
      user.skills = user_skills
      user.save
    end
  end
end