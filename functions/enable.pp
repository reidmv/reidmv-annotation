function annotation::enable() {
  # Load the metaparam on the master
  annotation::internal::load_annotation_metaparam()

  # Ensure the metaparam is loaded on the agent
  anchor { 'ensure-annotation-metaparam-loaded':
    name => Deferred('annotation::internal::load_annotation_metaparam', []),
  }
}
