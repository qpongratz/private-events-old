# frozen_string_literal: true

class InvitationsController < ApplicationController

  def create
    invitation = Invitation.new(invitation_params)

    if invitation.save
      redirect_to invitation.private_event
      flash[:notice] = 'Guest Invited.'
    else
      flash[:alert] = 'Uh oh'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    invitation = Invitation.find_by invitee_id: invitation_params[:invitee_id], private_event_id: invitation_params[:private_event_id]
    invitation.delete
    flash[:notice] = 'Guest has been uninvited.'
    redirect_back(fallback_location: root_path)
  end

  private

  def invitation_params
    params.require(:invitation).permit(:invitee_id, :private_event_id)
  end
end
