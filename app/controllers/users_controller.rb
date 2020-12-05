class UsersController < SecuredController
  def create
  end

  def update
  end

  def update_subscription
    if @user.update(subscription: params[:subscription])
      render json: {
        user: @user,
        status: "updated"
      }
    else
      render json: {
         message: "Validation failed", 
         errors: @user.errors 
      }, status: 400
    end
  end
end
