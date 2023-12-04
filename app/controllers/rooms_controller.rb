class RoomsController < ApplicationController
  before_action :set_room

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    Rails.logger.debug("@room: #{@room.inspect}")
  end

  def reset
    @room.members.update_all(estimation: nil)
    broadcast_members
  end

  # def reveal
  #   @room.update!(revealed: true)
  #   broadcast_members
  #   head :no_content
  # end

  def reveal
    Turbo::StreamsChannel.broadcast_to(
      @room,
      action: :reveal
    )
  
    head :no_content
  end

  private

  def set_room
    @room = Room.find_by(id: params[:id])
  end

  def broadcast_members
    Turbo::StreamsChannel.broadcast_replace_to(
      @room,
      target: 'members',
      partial: 'members/member',
      collection: @room.members,
      as: 'member'
    )
  end
end
