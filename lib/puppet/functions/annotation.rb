Puppet::Functions.create_function(:annotation, Puppet::Functions::InternalFunction) do
  dispatch :annotation do
    scope_param
    required_param 'String', :string
  end

  def annotation(scope, string)
    scope.resource[:annotation] ||= string
  end
end
