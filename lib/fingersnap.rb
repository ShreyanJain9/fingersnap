# frozen_string_literal: true

require_relative "fingersnap/version"
require "httparty"
require "json"

module Fingersnap
  def webfinger_resource(username)
    profile_components = username.split("@")
    profile_domain = profile_components[2]
    profile_name = profile_components[1]
    "https://#{profile_domain}/.well-known/webfinger?resource=acct:#{profile_name}@#{profile_domain}"
  end

  def get_webfinger_resource(username)
    JSON.parse(HTTParty.get(webfinger_resource(username)).body)
  end

  def nip05_resource(username)
    profile_components = username.split("@")
    profile_domain = profile_components[1]
    profile_name = profile_components[0]
    "https://#{profile_domain}/.well-known/nostr.json?name=#{profile_name}"
  end

  def get_nip05_resource(username)
    JSON.parse(HTTParty.get(nip05_resource(username)).body)
  end

  def nip05_to_pubkey(username)
    profile_components = username.split("@")
    profile_name = profile_components[0]
    get_nip05_resource(username)["names"][profile_name]
  end

  module_function :webfinger_resource, :get_webfinger_resource, :nip05_resource, :get_nip05_resource, :nip05_to_pubkey

  class Error < StandardError; end
end
