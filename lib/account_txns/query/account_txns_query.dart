const ACCOUNT_TXNS_QUERY = r'''
  query TxQuery($before: String, $publicKey: PublicKey!) {
    blocks(last: 10, before: $before, filter: {relatedTo: $publicKey}) {
      nodes {
        protocolState {
          blockchainState {
            date
          }
        }
        transactions {
          userCommands {
            hash
            memo
            fee
            to
            amount
            from
            nonce
            isDelegation
          }
          coinbase
          coinbaseReceiverAccount {
            publicKey
          }
          feeTransfer {
            recipient
            fee
          }
        }
      }
      pageInfo {
        hasNextPage
        lastCursor
      }
      totalCount
    }

    pooledUserCommands(publicKey: $publicKey) {
      to
      from
      amount
      fee
      memo
      isDelegation
      hash
      nonce
    }
  }
''';