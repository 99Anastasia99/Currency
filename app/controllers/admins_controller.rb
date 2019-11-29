# frozen_string_literal: true

class AdminsController < ApplicationController
  PERMIT_KEY = :admin
  PERMITTED_PARAMS = %i[
    name
    surname
    email
  ].freeze

  def show
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def activate
    admin = Admin.inactive.find(params[:id])
    if (current_admin != admin) && admin.activate!
      flash[:notice] = "Admin has been activated."
    else
      flash[:alert] = "Admin has not been activated."
    end
    redirect_to action: :index
  end

  def deactivate
    admin = Admin.active.find(params[:id])
    if (current_admin != admin) && admin.deactivate!
      flash[:notice] = "Admin has been deactivated."
    else
      flash[:alert] = "Admin has not been deactivated."
    end
    redirect_to action: :index
  end

  def destroy
    @admin = Admin.find(params[:id])
    if current_admin != @admin && @admin.destroy
      flash[:notice] = "Admin was successfully removed."
    else
      flash[:alert] = "Admin can not be removed."
    end
    redirect_to action: :index
  end

  def index
    @q = Admin.ransack(params[:q])
    @q.sorts = "email asc" if @q.sorts.empty?
    @admins = @q.result.page(params[:page])
    @day = Day.first
  end

  def update
    @admin = Admin.find(params.fetch(:id))
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to(@admin, notice: 'Admin was successfully updated.') }
        format.json { respond_with_bip(@admin) }
      else
        format.html { render action: :edit }
        format.json do
          respond_with_bip(@admin)
        end
      end
    end
  end

  private

  def admin_params
    params.require(PERMIT_KEY).permit(PERMITTED_PARAMS)
  end
end
