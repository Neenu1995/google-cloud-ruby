require "yaml"

def init
  @object = options.item
  @methods = @object.children.select { |child| child.type == :method }
  @references = @object.children.reject { |child| child.type == :method }
  @object_text = ERB.new(File.read"#{__dir__}/_object.erb").result(binding)

  @method_text = "\n" + @methods.map { |method|
    ERB.new(File.read"#{__dir__}/_method.erb").result_with_hash :method => method
  }.join("\n")

  if @references.empty?
    @reference_text = "[]"
  else
    @reference_text = "\n" + @references.map { |reference|
      ERB.new(File.read "#{__dir__}/_reference.erb").result_with_hash :reference => reference
    }.join("\n")
  end

  sections :layout
end


# def index
#   objects = Registry.all(:class, :module).sort_by {|o| o.name.to_s }
#   objects = run_verifier(objects)
#   # objects.each {|o| (@objects_by_letter[o.name.to_s[0, 1].upcase] ||= []) << o }
#   @objects = objects.map { |o| o.name.to_s }
#   @objects.reject! { |o| o.strip.empty? }
#   erb(:index)
# end