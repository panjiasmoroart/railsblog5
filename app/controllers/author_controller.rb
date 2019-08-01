class AuthorController < ApplicationController
  #agar user yg sudah login yg bisa membuat post
  before_action :authenticate_author!

end
