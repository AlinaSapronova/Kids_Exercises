class ChildPolicy < ApplicationPolicy

  def show?
    record.user == user
  end
  
  def new?
    true
  end
  
  def profile?
   true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

 
end
