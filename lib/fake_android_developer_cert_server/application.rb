# coding: utf-8
require 'sinatra'
require 'awesome_print'

module FakeAndroidDeveloperCertServer
  class Application < Sinatra::Base
    # { userId: “”, userEmail: “”, examType: “”, assessmentId: “”, assessmentVariantId: “”, examLanuage: "java" }
    # examType AAD, PAD
    # examLanguage java, kotlin
    # returns variant Id

    post "/users/v1/register" do
      payload = params
      payload = JSON.parse(request.body.read, symbolize_names: true) unless params[:path]

      if %i(userId userEmail examType assessmentId examLanguage).any?{ |x| payload[x].nil? }
        halt(500, {"error": "missing required params"}.to_json)
      end

      unless %w(AAD PAD).include?(payload[:examType])
        halt(500, {"error": "examType should be AAD or PAD, got: #{payload[:examType].inspect}"}.to_json)
      end

      unless %w(JAVA KOTLIN).include?(payload[:examLanguage])
        halt(500, {"error": "examLanguage should be JAVA or KOTLIN, got: #{payload[:examLanguage].inspect}"}.to_json)
      end

      name = ["av1", "av2"].shuffle.first
      { "variantName" => name }.to_json
    end

    get "/exam/v1/build/:id" do
      id = params[:id].to_i
      { "status" => true }.to_json
    end

    # blob signing
    # v1/{{PROJECT_NAME}}:signBlob
    post "/v1/:verb" do
      project_name, action = params[:verb].split(":")
      { "signature" => "abcdefg" }.to_json
    end

    # override auth_uri in the auth creds hash
    post "/o/oauth2/auth" do
      { "token" => "hijklmnop" }.to_json
    end

    # override token_uri
    post "/o/oauth2/token" do
      { "token" => "hijklmnop" }.to_json
    end

    post "/oauth2/v4/token" do
      {"id_token" => "hijklmnop"}.to_json
    end
  end
end
