class ErrorsController < ApplicationController
  layout false

  skip_before_action :authenticate_user!

  def not_found
    redirect_to root_path, notice: "O que você estava buscando não foi encontrado."
  end

  def server_error
    redirect_to root_path, notice: "Parece que algo errado não está certo, tente novamente depois."
  end
end
