# frozen_string_literal: true
# include Helpers::ModuleHelper

def init
  options.serializer = Serializers::FileSystemSerializer.new :extension => "yaml"
  # sections :index, :full_list
  options.objects.each do |object|
    begin
      next if object.root?
      # require "pry"
      # binding.pry
      # n = 28
      # if object.name == options.objects[n].name
      #   puts options.objects[n+1].name.to_s
      #   require "pry"
      #   binding.pry
      #   exit!
      # end
      serialize(object)
    rescue => e
      path = options.serializer.serialized_path(object)
      log.error "Exception occurred while generating '#{path}'"
      # require "pry"
      # binding.pry
      log.backtrace(e)
    end
  end
  serialize_index options
end

def serialize(object)
  # if object.path.to_s == "Google::Cloud::Vision::V1::ImageAnnotator::Client"
  #   require "pry"
  #   binding.pry
  # end

  # if object.files.size > 1
  #   require "pry"
  #   binding.pry
  # end
  # if object.children.any? { |child| child.type == :method }
  #   require "pry"
  #   binding.pry
  # end
  # if object.path == "Google::Cloud::Vision::V1::ImageAnnotator::Client"
  #   require "pry"
  #   binding.pry
  # end

  file_name = "#{object.path.gsub "::", "-"}.yaml"
  # file_name.gsub "::", "-"

  Templates::Engine.with_serializer(file_name, options.serializer) do
    T('layout').run(options.merge(:item => object))
  end
end

def serialize_index(options)
  return
  Templates::Engine.with_serializer('index.yaml', options.serializer) do
    T('layout').run(options.merge(:index => true))
  end
end
