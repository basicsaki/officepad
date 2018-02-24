class Ability
  include CanCan::Ability

    def initialize(user)
    user ||= User.new # guest user
    
    if user.check_roles.include? :admin
      can :manage, :all
    else
      can :read, :all
      can :create, Answer
      can :update, Answer do |answer|
        answer.try(:owner) == user
      end
      can :delete, Answer do |answer|
        answer.try(:owner) == user
      end
      can :create, Question
      can :update, Question do |question|
        question.try(:owner) == user
      end
      can :delete, Question do |answer|
        answer.try(:owner) == user
      end

      can :create, NoticeBoard
      can :update, NoticeBoard do |notice|
        notice.try(:owner) == user
      end


      can :create, Suggestion
      can :update, Suggestion do |suggestion|
        suggestion.try(:owner) == user
      end
      can :delete, Suggestion do |suggestion|
        suggestion.try(:owner) == user
      end

      can :create, Comment
      can :update, Comment do |comment|
        comment.try(:owner) == user
      end
      can :delete, Comment do |comment|
        comment.try(:owner) == user
      end

    end
end

end
