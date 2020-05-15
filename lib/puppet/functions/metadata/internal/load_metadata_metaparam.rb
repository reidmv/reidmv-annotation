Puppet::Functions.create_function(:'metadata::internal::load_metadata_metaparam') do
  dispatch :load do
    # No parameters
    return_type 'String'
  end

  def load
    unless Puppet::Type.metaparam?(:metadata)
      Puppet::Type.newmetaparam(:metadata) do
        desc "A user-supplied metadata about this resource. The metadata
          is non-operative, but will be visible in the node's catalog and can
          be queried for reporting purposes."
      end
    end

    'Loaded'
  end
end
