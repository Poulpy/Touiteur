# Uncomment the line below and point it to your private key
# PGCrypto.keys[:private] = {:path => 'path/to/private/keyfile'}

# You can also specify the file contents directly:
# PGCrypto.keys[:private] = ENV['PRIVATE_KEY']
PGCrypto.keys[:private] = { path: '~/.keys/private.key' }
PGCrypto.keys[:public] = { path: '~/.keys/public.key' }
