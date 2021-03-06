# frozen_string_literal: true

# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!


module Google
  module Cloud
    module DocumentAI
      module V1beta3
        # Request message for the process document method.
        # @!attribute [rw] name
        #   @return [::String]
        #     Required. The processor resource name.
        # @!attribute [rw] document
        #   @return [::Google::Cloud::DocumentAI::V1beta3::Document]
        #     The document payload, the [content] and [mime_type] fields must be set.
        # @!attribute [rw] skip_human_review
        #   @return [::Boolean]
        #     Whether Human Review feature should be skipped for this request. Default to
        #     false.
        class ProcessRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Response message for the process document method.
        # @!attribute [rw] document
        #   @return [::Google::Cloud::DocumentAI::V1beta3::Document]
        #     The document payload, will populate fields based on the processor's
        #     behavior.
        # @!attribute [rw] human_review_operation
        #   @return [::String]
        #     The name of the operation triggered by the processed document. If the human
        #     review process is not triggered, this field will be empty. It has the same
        #     response type and metadata as the long running operation returned by
        #     ReviewDocument method.
        class ProcessResponse
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Request message for batch process document method.
        # @!attribute [rw] name
        #   @return [::String]
        #     Required. The processor resource name.
        # @!attribute [rw] input_configs
        #   @return [::Array<::Google::Cloud::DocumentAI::V1beta3::BatchProcessRequest::BatchInputConfig>]
        #     The input config for each single document in the batch process.
        # @!attribute [rw] output_config
        #   @return [::Google::Cloud::DocumentAI::V1beta3::BatchProcessRequest::BatchOutputConfig]
        #     The overall output config for batch process.
        class BatchProcessRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # The message for input config in batch process.
          # @!attribute [rw] gcs_source
          #   @return [::String]
          #     The Cloud Storage location as the source of the document.
          # @!attribute [rw] mime_type
          #   @return [::String]
          #     Mimetype of the input. If the input is a raw document, the supported
          #     mimetypes are application/pdf, image/tiff, and image/gif.
          #     If the input is a [Document] proto, the type should be application/json.
          class BatchInputConfig
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # The message for output config in batch process.
          # @!attribute [rw] gcs_destination
          #   @return [::String]
          #     The output Cloud Storage directory to put the processed documents.
          class BatchOutputConfig
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end
        end

        # Response message for batch process document method.
        class BatchProcessResponse
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # The long running operation metadata for batch process method.
        # @!attribute [rw] state
        #   @return [::Google::Cloud::DocumentAI::V1beta3::BatchProcessMetadata::State]
        #     The state of the current batch processing.
        # @!attribute [rw] state_message
        #   @return [::String]
        #     A message providing more details about the current state of processing.
        #     For example, the error message if the operation is failed.
        # @!attribute [rw] create_time
        #   @return [::Google::Protobuf::Timestamp]
        #     The creation time of the operation.
        # @!attribute [rw] update_time
        #   @return [::Google::Protobuf::Timestamp]
        #     The last update time of the operation.
        # @!attribute [rw] individual_process_statuses
        #   @return [::Array<::Google::Cloud::DocumentAI::V1beta3::BatchProcessMetadata::IndividualProcessStatus>]
        #     The list of response details of each document.
        class BatchProcessMetadata
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # The status of a each individual document in the batch process.
          # @!attribute [rw] input_gcs_source
          #   @return [::String]
          #     The source of the document, same as the [input_gcs_source] field in the
          #     request when the batch process started. The batch process is started by
          #     take snapshot of that document, since a user can move or change that
          #     document during the process.
          # @!attribute [rw] status
          #   @return [::Google::Rpc::Status]
          #     The status of the processing of the document.
          # @!attribute [rw] output_gcs_destination
          #   @return [::String]
          #     The output_gcs_destination (in the request as 'output_gcs_destination')
          #     of the processed document if it was successful, otherwise empty.
          # @!attribute [rw] human_review_operation
          #   @return [::String]
          #     The name of the operation triggered by the processed document. If the
          #     human review process is not triggered, this field will be empty. It has
          #     the same response type and metadata as the long running operation
          #     returned by ReviewDocument method.
          class IndividualProcessStatus
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # Possible states of the batch processing operation.
          module State
            # The default value. This value is used if the state is omitted.
            STATE_UNSPECIFIED = 0

            # Request operation is waiting for scheduling.
            WAITING = 1

            # Request is being processed.
            RUNNING = 2

            # The batch processing completed successfully.
            SUCCEEDED = 3

            # The batch processing was being cancelled.
            CANCELLING = 4

            # The batch processing was cancelled.
            CANCELLED = 5

            # The batch processing has failed.
            FAILED = 6
          end
        end

        # Request message for review document method.
        # @!attribute [rw] human_review_config
        #   @return [::String]
        #     Required. The resource name of the HumanReviewConfig that the document will be
        #     reviewed with.
        # @!attribute [rw] document
        #   @return [::Google::Cloud::DocumentAI::V1beta3::Document]
        #     The document that needs human review.
        class ReviewDocumentRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Response message for review document method.
        # @!attribute [rw] gcs_destination
        #   @return [::String]
        #     The Cloud Storage uri for the human reviewed document.
        class ReviewDocumentResponse
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # The long running operation metadata for review document method.
        # @!attribute [rw] state
        #   @return [::Google::Cloud::DocumentAI::V1beta3::ReviewDocumentOperationMetadata::State]
        #     Used only when Operation.done is false.
        # @!attribute [rw] state_message
        #   @return [::String]
        #     A message providing more details about the current state of processing.
        #     For example, the error message if the operation is failed.
        # @!attribute [rw] create_time
        #   @return [::Google::Protobuf::Timestamp]
        #     The creation time of the operation.
        # @!attribute [rw] update_time
        #   @return [::Google::Protobuf::Timestamp]
        #     The last update time of the operation.
        class ReviewDocumentOperationMetadata
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # State of the longrunning operation.
          module State
            # Unspecified state.
            STATE_UNSPECIFIED = 0

            # Operation is still running.
            RUNNING = 1

            # Operation is being cancelled.
            CANCELLING = 2

            # Operation succeeded.
            SUCCEEDED = 3

            # Operation failed.
            FAILED = 4

            # Operation is cancelled.
            CANCELLED = 5
          end
        end
      end
    end
  end
end
