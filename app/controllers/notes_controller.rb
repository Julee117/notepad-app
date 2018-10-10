class NotesController < ApplicationController
  def index
    @notes = Note.where(user_id: current_user)
  end

  def show
  end

  def new
    @note = current_user.notes.build
  end
  
  private

  def find_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content, :user_id)
  end
end
