function metadata::enable() {
  # Load the metaparam on the master
  metadata::internal::load_metadata_metaparam()

  # Ensure the metaparam is loaded on the agent
  anchor { 'ensure-metadata-metaparam-loaded':
    name => Deferred('metadata::internal::load_metadata_metaparam', []),
  }
}
