class MembersController < ApplicationController

  def new
    @room = Room.find(params[:room_id])
    @member = Member.new(room_id: @room.id)
  end


  def create
    @member = Member.create!(member_params)
    session[:member_id] = @member.id    

    Turbo::StreamsChannel.broadcast_append_to(
      @room,
      target: @member.room,
      partial: 'members/member',
      locals: { member: @member }
    )

    redirect_to @member.room
  end

  private

  def member_params
    params.require(:member).permit(:name, :room_id)
  end
end
