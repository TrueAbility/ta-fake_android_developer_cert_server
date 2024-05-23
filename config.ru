# config.ru

require_relative "lib/fake_android_developer_cert_server/application"

run FakeAndroidDeveloperCertServer::Application
