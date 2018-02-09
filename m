From: "Andreas Koller" <kollergefahr@gmx.de>
Subject: ENOENT when adding conntrack rule
Date: Fri, 9 Feb 2018 13:47:44 +0100
Message-ID: <trinity-11d633c5-2d36-4425-857e-b629141f910d-1518180464419@3c-app-gmx-bs51>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi,
 
I'm trying to add the following rule:
nft add rule filter input ct state established,related accept
but continue getting ENOENT (no such file or directory)
 
Both the table and the chain are existing:

table inet filter {
        chain input {
                type filter hook input priority 0; policy accept;
        }
}
 
 
My kernel is 4.1.15 and I have the following modules compiled in.
Am I still missing an additional kernel module or what else could have gone wrong?

$ cat .config |grep -E "CONFIG_NFT|CONNTRACK"
CONFIG_NF_CONNTRACK=y
CONFIG_NF_CONNTRACK_MARK=y
CONFIG_NF_CONNTRACK_PROCFS=y
CONFIG_NF_CONNTRACK_EVENTS=y
CONFIG_NF_CONNTRACK_TIMEOUT=y
CONFIG_NF_CONNTRACK_TIMESTAMP=y
CONFIG_NF_CONNTRACK_AMANDA=y
CONFIG_NF_CONNTRACK_FTP=y
CONFIG_NF_CONNTRACK_H323=y
CONFIG_NF_CONNTRACK_IRC=y
CONFIG_NF_CONNTRACK_BROADCAST=y
CONFIG_NF_CONNTRACK_NETBIOS_NS=y
CONFIG_NF_CONNTRACK_SNMP=y
CONFIG_NF_CONNTRACK_PPTP=y
CONFIG_NF_CONNTRACK_SANE=y
CONFIG_NF_CONNTRACK_SIP=y
CONFIG_NF_CONNTRACK_TFTP=y
CONFIG_NFT_EXTHDR=y
CONFIG_NFT_META=y
CONFIG_NFT_CT=y
CONFIG_NFT_RBTREE=y
CONFIG_NFT_HASH=y
CONFIG_NFT_COUNTER=y
CONFIG_NFT_LOG=y
CONFIG_NFT_LIMIT=y
# CONFIG_NFT_MASQ is not set
# CONFIG_NFT_REDIR is not set
CONFIG_NFT_NAT=y
CONFIG_NFT_REJECT=y
CONFIG_NFT_REJECT_INET=y
CONFIG_NF_CONNTRACK_IPV4=y
CONFIG_NF_CONNTRACK_PROC_COMPAT=y
CONFIG_NFT_CHAIN_ROUTE_IPV4=y
CONFIG_NFT_REJECT_IPV4=y
CONFIG_NF_CONNTRACK_IPV6=y
# CONFIG_NFT_CHAIN_ROUTE_IPV6 is not set
CONFIG_NFT_REJECT_IPV6=y
# CONFIG_NFTL is not set

--

