

class SignatureConnector < ApplicationRecord
  belongs_to :signature
  after_initialize :set_default_connection_type

  def connection_type
    enum signature_type: {
      walmart: 0,
      aws: 1
    }, _prefix: true
    if :signature_type == 'walmart'
      'walmart'
    else
      'aws'
    end
  end
end

def set_default_connection_type
  self.connection_type ||= :walmart
end



