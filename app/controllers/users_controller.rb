class UsersController < SecuredController
  def update_subscription
    if @user.update(subscription: params[:subscription].to_i)
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
