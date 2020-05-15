Puppet::Functions.create_function(:metadata, Puppet::Functions::InternalFunction) do
  dispatch :metadata do
    scope_param
    required_param 'String', :string
  end

  def metadata(scope, string)
    scope.resource[:metadata] ||= string
  end
end
