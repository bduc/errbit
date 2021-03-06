class Api::V1::NoticesController < ApplicationController
  respond_to :json, :xml

  authorize_actions_for Notice

  def index
    fields = %w{created_at message error_class}
    notices = Notice.select(fields)

    if params.key?(:start_date) && params.key?(:end_date)
      start_date = Time.parse(params[:start_date]).utc
      end_date = Time.parse(params[:end_date]).utc
      notices = notices.created_between(start_date, end_date)
    end

    results = benchmark("[api/v1/notices_controller] query time") { notices.to_a }

    respond_to do |format|
      format.any(:html, :json) { render :json => Yajl.dump(results) } # render JSON if no extension specified on path
      format.xml  { render :xml  => results }
    end
  end

end
