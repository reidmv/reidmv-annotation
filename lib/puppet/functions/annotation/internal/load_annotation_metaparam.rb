Puppet::Functions.create_function(:'annotation::internal::load_annotation_metaparam') do
  dispatch :load do
    # No parameters
    return_type 'String'
  end

  def load
    unless Puppet::Type.metaparam?(:annotation)
      Puppet::Type.newmetaparam(:annotation) do
         desc "A user-supplied annotation about this resource. The annotation
           is non-operative, but will be visible in the node's catalog and can
           be queried for reporting purposes."
      end
    end

    'Loaded'
  end
end
