# frozen_string_literal: true

require "spec_helper"

RSpec.describe Ntfy::Configuration do
  subject(:config) { Ntfy.configuration }

  after do
    Ntfy.configuration = described_class.new
  end

  context "when no protocol is specified" do
    it "defaults to https" do
      expect(config.protocol).to eq("https")
    end
  end

  context "when no base_url is specified" do
    it "defaults to ntfy.sh" do
      expect(config.base_url).to eq("ntfy.sh")
    end
  end

  context "when protocol is specified" do
    let(:new_protocol) { "http" }

    before do
      Ntfy.configure { |c| c.protocol = new_protocol }
    end

    it "returns the specified protocol" do
      expect(Ntfy.configuration.protocol).to eq(new_protocol)
    end
  end

  context "when base_url is specified" do
    let(:server_url) { "custom-server.ntfy.sh" }

    before do
      Ntfy.configure { |c| c.base_url = server_url }
    end

    it "returns the specified base_url" do
      expect(Ntfy.configuration.base_url).to eq(server_url)
    end
  end
end
