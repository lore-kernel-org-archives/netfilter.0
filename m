From: Andreas Hoefler <andreas.hoefler@hitachi-powergrids.com>
Subject: NFTables: Can not add logs
Date: Tue, 29 Sep 2020 10:00:17 +0000
Message-ID: <VI1PR06MB4639FCC3DB3457BD9B067E82C5320@VI1PR06MB4639.eurprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hitachi-powergrids.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a6Qe800wSlFGreOfYuIqbmRYhfbBbis3EJs13OWwPcI=;
 b=UEWwqRSQgk2TDcIJoRorRi/8znazr/ZCOTCg7oGwFADW5XEGo+hHyCERzr5X6l8HiGY/J23aRqUMtL/E1V8tXYSGYWqG6XSdDUivCINi5P9EOm/e6cdOvHtULaUH93WwqXKXyWpxPWGJhcI6W4YIQ05ZP1HzDNl4LDz1M9CD1Hs=
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi=20

I am trying to figure out why I sometimes lose connection during some test =
activites.
Therefore I would like to use the logging option to see what has been dropp=
ed.

But I get:
nft add rule x y log
Error: Could not process rule: No such file or directory
add rule x y log
^^^^^^^^^^^^^^^^^

My config looks like this:
root@cpm:/lib/modules/5.4.58-rt35-gec079e118e# cat /proc/config.gz | gunzip=
 | grep NFT
# CONFIG_NFT_NUMGEN is not set
CONFIG_NFT_CT=3Dy
# CONFIG_NFT_FLOW_OFFLOAD is not set
CONFIG_NFT_COUNTER=3Dy
# CONFIG_NFT_CONNLIMIT is not set
CONFIG_NFT_LOG=3Dy
CONFIG_NFT_LIMIT=3Dy
# CONFIG_NFT_MASQ is not set
# CONFIG_NFT_REDIR is not set
CONFIG_NFT_NAT=3Dy
# CONFIG_NFT_TUNNEL is not set
# CONFIG_NFT_OBJREF is not set
# CONFIG_NFT_QUOTA is not set
# CONFIG_NFT_REJECT is not set
# CONFIG_NFT_COMPAT is not set
CONFIG_NFT_HASH=3Dy
# CONFIG_NFT_XFRM is not set
# CONFIG_NFT_SOCKET is not set
# CONFIG_NFT_OSF is not set
# CONFIG_NFT_TPROXY is not set
# CONFIG_NFT_SYNPROXY is not set
# CONFIG_NFT_DUP_NETDEV is not set
# CONFIG_NFT_FWD_NETDEV is not set
# CONFIG_NFT_DUP_IPV4 is not set
# CONFIG_NFT_FIB_IPV4 is not set
# CONFIG_NFT_DUP_IPV6 is not set
# CONFIG_NFT_FIB_IPV6 is not set
# CONFIG_NFT_BRIDGE_META is not set
# CONFIG_NFTL is not set
# CONFIG_INFTL is not set

Is there anything I am missing or should the above work?

Thx
Andy
