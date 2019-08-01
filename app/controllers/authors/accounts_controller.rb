module Authors 
  
  class AccountsController < AuthorController

    def edit
    end

    def update_info
      #binding.pry
      # email must be formatted correctly
      # name is required on update
      if current_author.update(author_info_params)
        flash[:success] = 'Successfully saved info'
      else
        #  binding.pry 
        #  display_error_messages custom dari application_record
        flash[:danger]  = current_author.display_error_messages
      end
      redirect_to authors_account_path 
      #if current_author.update(author_info_params)
      #  flash[:success] = 'Successfully saved info'
      #else
      #  flash[:danger]  = current_author.display_error_messages
      #end
    end

    def change_password
      # render plain: 'change password'
      # binding.pry
      # jika password yang dimasukan atau di input sama dengan yang sudah maka lakukan update 

      author = current_author   
      if author.valid_password?(author_password_params[:current_password])
         #if author.update(
         #   password: author_password_params[:new_password],
         #   password_confirmation: author_password_params[:new_password_confirmation]
         #)
         # change_password_update custom dari model author 
         if author.change_password_update(author_password_params)
            sign_in(author, bypass: true)
            flash[:success] = 'Successfully changed password'
         else
            flash[:danger]  = author.display_error_messages
         end  
      else
        flash[:danger] = 'Current password was incorrect'
      end
      redirect_to authors_account_path

      # original password is wrong 
      # password or confirmation are blank 
      # password or confirmation don't match
    end

    private

    def author_info_params 
      params.require(:author).permit(:name, :email, :bio)  
    end

    def author_password_params
      params.require(:author).permit(:current_password, :new_password, :new_password_confirmation)
    end

  end 

end
