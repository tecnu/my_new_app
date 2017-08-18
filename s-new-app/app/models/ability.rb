class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all?
      can :manage, [Comment, Product]
    else
      can :create, Comment
      can :read, [Comment, Product]
      can :manage, User, id: user.id
    end
  end

end