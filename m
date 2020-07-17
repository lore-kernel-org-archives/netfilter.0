From: Andreas Hoefler <andreas.hoefler@hitachi-powergrids.com>
Subject: not able to set ct state rule
Date: Fri, 17 Jul 2020 11:22:26 +0000
Message-ID: <VI1PR06MB4639985A43150F379C316E14C57C0@VI1PR06MB4639.eurprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hitachi-powergrids.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3C4nwNe4qjoX8n9wMm0MtgfnmDtw2qlc4YCHXA3QnrI=;
 b=R+sfc4bvk6zIKaaLSLp99YGaY8zGxisviKVk3EiTYBPmGfWuzVSK5SX/jQrJg3RYMGqkM5HPe806OUNivIqd8uTRo0XzsDK2caKNoFaxyAarcs4e/ROd5Q2vyBBH26VChXZkJB2U5kkYMCo2aOgiO/X1L05grjHTNOcSK5V8swE=
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi

I am trying to set up a basic connection tracking rule:
#nft list ruleset
table ip filter {
        chain input {
                type filter hook input priority 0; policy accept;
        }
}
# nft add rule filter input ct state established accept
Error: Could not process rule: No such file or directory
add rule filter input ct state established accept
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

cat /proc/config.gz | gunzip | grep NFT
# CONFIG_NFT_NUMGEN is not set
CONFIG_NFT_CT=3Dm
# CONFIG_NFT_FLOW_OFFLOAD is not set
CONFIG_NFT_COUNTER=3Dy
# CONFIG_NFT_CONNLIMIT is not set
CONFIG_NFT_LOG=3Dy
CONFIG_NFT_LIMIT=3Dy
# CONFIG_NFT_MASQ is not set
# CONFIG_NFT_REDIR is not set
CONFIG_NFT_NAT=3Dm
# CONFIG_NFT_TUNNEL is not set
# CONFIG_NFT_OBJREF is not set
# CONFIG_NFT_QUOTA is not set
# CONFIG_NFT_REJECT is not set
# CONFIG_NFT_COMPAT is not set
CONFIG_NFT_HASH=3Dy
# CONFIG_NFT_SOCKET is not set
# CONFIG_NFT_OSF is not set
# CONFIG_NFT_TPROXY is not set
# CONFIG_NFT_DUP_NETDEV is not set
# CONFIG_NFT_FWD_NETDEV is not set
CONFIG_NFT_CHAIN_ROUTE_IPV4=3Dy
# CONFIG_NFT_DUP_IPV4 is not set
# CONFIG_NFT_FIB_IPV4 is not set
CONFIG_NFT_CHAIN_NAT_IPV4=3Dm
# CONFIG_NFT_CHAIN_ROUTE_IPV6 is not set
# CONFIG_NFT_DUP_IPV6 is not set
# CONFIG_NFT_FIB_IPV6 is not set
# CONFIG_NFTL is not set
# CONFIG_INFTL is not set

What am I missing here?

Thx
Andy
