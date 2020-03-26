class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
<<<<<<< HEAD
      @properties = Property.all
      end

=======
      @properties = Property.first(3)
  end
>>>>>>> 3096ed0413cf2135a6fddb432cf611fbca27a58c
end
