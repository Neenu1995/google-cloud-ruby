# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/channel/v1/subscriber_event.proto

require 'google/protobuf'

require 'google/api/resource_pb'
require 'google/api/annotations_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/cloud/channel/v1/subscriber_event.proto", :syntax => :proto3) do
    add_message "google.cloud.channel.v1.CustomerEvent" do
      optional :customer, :string, 1
      optional :event_type, :enum, 2, "google.cloud.channel.v1.CustomerEvent.Type"
    end
    add_enum "google.cloud.channel.v1.CustomerEvent.Type" do
      value :TYPE_UNSPECIFIED, 0
    end
    add_message "google.cloud.channel.v1.EntitlementEvent" do
      optional :entitlement, :string, 1
      optional :event_type, :enum, 2, "google.cloud.channel.v1.EntitlementEvent.Type"
    end
    add_enum "google.cloud.channel.v1.EntitlementEvent.Type" do
      value :TYPE_UNSPECIFIED, 0
      value :CREATED, 1
      value :PRICE_PLAN_SWITCHED, 3
      value :COMMITMENT_CHANGED, 4
      value :RENEWED, 5
      value :SUSPENDED, 6
      value :ACTIVATED, 7
      value :CANCELLED, 8
      value :SKU_CHANGED, 9
      value :RENEWAL_SETTING_CHANGED, 10
      value :PAID_SERVICE_STARTED, 11
      value :LICENSE_ASSIGNMENT_CHANGED, 12
    end
    add_message "google.cloud.channel.v1.SubscriberEvent" do
      oneof :event do
        optional :customer_event, :message, 1, "google.cloud.channel.v1.CustomerEvent"
        optional :entitlement_event, :message, 2, "google.cloud.channel.v1.EntitlementEvent"
      end
    end
  end
end

module Google
  module Cloud
    module Channel
      module V1
        CustomerEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.channel.v1.CustomerEvent").msgclass
        CustomerEvent::Type = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.channel.v1.CustomerEvent.Type").enummodule
        EntitlementEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.channel.v1.EntitlementEvent").msgclass
        EntitlementEvent::Type = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.channel.v1.EntitlementEvent.Type").enummodule
        SubscriberEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.channel.v1.SubscriberEvent").msgclass
      end
    end
  end
end
