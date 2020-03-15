require 'rails_helper'

# describe ApiConstraints do
RSpec.describe ApiConstraints do
  let(:api_constraints_v1) { ApiConstraints.new(version: 1) }
  let(:api_constraints_v2) { ApiConstraints.new(version: 2, default: true) }

  describe "matches?" do
    # kalau versionnya tidak default maka harus menggunakan header untuk menerima versi 1
    it "returns true when the version matches the 'Accept' header" do
      request = double(host: 'api.marketplace.dev',
                       headers: {"Accept" => "application/vnd.marketplace.v1"})
      api_constraints_v1.matches?(request).should be_truthy
    end

    # kalau versionnya default maka TIDAK harus menggunakan header
    it "returns the default version when 'default' option is specified" do
      request = double(host: 'api.marketplace.dev')
      api_constraints_v2.matches?(request).should be_truthy
    end
  end
end