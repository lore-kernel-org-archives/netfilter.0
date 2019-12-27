From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: [nft 0.9.2] cannot get sets to work - Error: Could not process rule:
 Not supported
Date: Fri, 27 Dec 2019 19:17:16 +0000
Message-ID: <6aa06206-7b72-c828-0090-b94d046e01cc@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1577474236;
        bh=Bi5Lmr4zBmvM9y2JlBOF8agYRGusJ5AeZrL0EddZLyM=;
        h=X-UI-Sender-Class:Reply-To:To:From:Subject:Date;
        b=TawmCI7VgwUsERK+fg+/NHLfaXTTqgq4CEd4gcBN9+nR/rRp1qCqq65BORapFSBNr
         OkCpof5bnNB1W1seChw39xBR00YxRWLuLotDklOZretSneX7zhcGUaubDryixPPFYK
         ySkmRnWc8BwQotjb3RLbeOdAt1RLQZk2s9MtYqOA=
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

kernel 4.19.91 | nftables 0.9.2 | libnftnl 1.1.4 | libxtables-nft 1.8.3
_____

# nft flush ruleset
# nft add table filter
# nft add chain filter input { type filter hook input priority 0\; }
# nft add set filter myset { type ipv4_addr\; }

produces

 > Error: Could not process rule: Not supported

Looked up=20
https://wiki.nftables.org/wiki-nftables/index.php/Troubleshooting but=20
that error is not documented. A web search did not produce any relevant=20
results either.

A bit at loss here - why would a rule processing be reported as not=20
supported whilst this being being set instead? How to get it work?

______
kernel NFT modules conf

CONFIG_NFT_NUMGEN=3Dm
CONFIG_NFT_CT=3Dm
CONFIG_NFT_FLOW_OFFLOAD=3Dm
CONFIG_NFT_COUNTER=3Dm
# CONFIG_NFT_CONNLIMIT is not set
CONFIG_NFT_LOG=3Dm
CONFIG_NFT_LIMIT=3Dm
CONFIG_NFT_MASQ=3Dm
CONFIG_NFT_REDIR=3Dm
CONFIG_NFT_NAT=3Dm
# CONFIG_NFT_TUNNEL is not set
CONFIG_NFT_OBJREF=3Dm
CONFIG_NFT_QUEUE=3Dm
CONFIG_NFT_QUOTA=3Dm
CONFIG_NFT_REJECT=3Dm
CONFIG_NFT_REJECT_INET=3Dm
CONFIG_NFT_COMPAT=3Dm
CONFIG_NFT_HASH=3Dm
CONFIG_NFT_FIB=3Dm
CONFIG_NFT_FIB_INET=3Dm
# CONFIG_NFT_SOCKET is not set
# CONFIG_NFT_OSF is not set
# CONFIG_NFT_TPROXY is not set
CONFIG_NFT_DUP_NETDEV=3Dm
CONFIG_NFT_FWD_NETDEV=3Dm
# CONFIG_NFT_FIB_NETDEV is not set
CONFIG_NFT_CHAIN_ROUTE_IPV4=3Dm
CONFIG_NFT_REJECT_IPV4=3Dm
CONFIG_NFT_DUP_IPV4=3Dm
CONFIG_NFT_FIB_IPV4=3Dm
CONFIG_NFT_CHAIN_NAT_IPV4=3Dm
CONFIG_NFT_MASQ_IPV4=3Dm
CONFIG_NFT_REDIR_IPV4=3Dm
CONFIG_NFT_CHAIN_ROUTE_IPV6=3Dm
CONFIG_NFT_CHAIN_NAT_IPV6=3Dm
CONFIG_NFT_MASQ_IPV6=3Dm
CONFIG_NFT_REDIR_IPV6=3Dm
CONFIG_NFT_REJECT_IPV6=3Dm
CONFIG_NFT_DUP_IPV6=3Dm
CONFIG_NFT_FIB_IPV6=3Dm
CONFIG_NFT_BRIDGE_REJECT=3Dm
# CONFIG_NFTL is not set
# CONFIG_INFTL is not set


