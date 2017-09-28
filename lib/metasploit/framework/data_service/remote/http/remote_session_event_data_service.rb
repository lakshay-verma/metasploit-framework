require 'metasploit/framework/data_service/remote/http/response_data_helper'

module RemoteSessionEventDataService
  include ResponseDataHelper

  SESSION_EVENT_PATH = '/api/1/msf/session_event'
  SESSION_EVENT_SEARCH_PATH = SESSION_EVENT_PATH + "/search"

  def report_session_event(opts)
    self.post_data_async(SESSION_EVENT_PATH, opts)
  end
end