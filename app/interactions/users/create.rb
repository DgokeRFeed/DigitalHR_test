module Users
  class Create < ActiveInteraction::Base
    string :name, :surname, :patronymic, :email,
      :nationality, :country, :gender, :skills
    integer :age
    array :interests

    validates(
      :name,
      :surname,
      :patronymic,
      :email,
      :age,
      :gender,
      :country,
      :nationality,
      :interests,
      :skills,
      presence: true
    )

    validates :gender, inclusion: { in: %w[male female] }
    validates :age, comparison: { greater_than: 0, less_than_or_equal_to: 90 }

    def execute
      full_name = [surname, name, patronymic].map(&:downcase).join(' ')

      user_params = {
        name:,
        surname:,
        patronymic:,
        full_name:,
        email:,
        age:,
        gender:,
        country:,
        nationality:
      }

      user = User.new(user_params)

      user.interests = Interest.where(name: interests)

      user_skills = skills.split(',')
      user.skills = Skill.where(name: user_skills)

      unless user.save
        errors.merge!(user.errors)
      end

      user
    end
  end
end
