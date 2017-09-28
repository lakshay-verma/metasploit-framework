module SessionEventServlet

  def self.api_path
    '/api/1/msf/session_event'
  end

  def self.registered(app)
    app.get SessionEventServlet.api_path, &get_session_event
    app.post SessionEventServlet.api_path, &report_session_event
  end

  #######
  private
  #######

  def self.get_session_event
    lambda {
      begin
        opts = parse_json_request(request, false)
        data = get_db().session_events(opts)
        set_json_response(data)
      rescue Exception => e
        set_error_on_response(e)
      end
    }
  end

  def self.report_session_event
    lambda {
      job = lambda { |opts| get_db().report_session_event(opts) }
      exec_report_job(request, &job)
    }
  end
end