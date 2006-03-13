From: "Moritz Gartenmeister" <moritz@uplink-verein.ch>
Subject: TRACE
Date: Mon, 13 Mar 2006 19:14:38 +0100
Message-ID: <db42965c0603131014q22b06ae6r432af6a71a95ba53@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

hi

i ran in some trouble with the TRACE-target.
i'm using
kernel: 2.6.14.7
iptables: 1.3.5
and the patch-o-magic from 12 march

the patch doesn't apply (depends on raw), although the raw table exists alr=
eady.
iptables seems to know the TRACE target, but i found no kernel modul.
forcing patch-o-magic doesn't help (ipt_TRACE.c exists now in the
kernel tree, but the module isn't able to compile, i deleted the
"depends" entry...).

i have some troubles with mark, connection tracking and i think it
would be useful to use TRACE for troubleshooting.

is there an known issue about the TRACE target? or does anyone have a
working setup (kernel version, iptables version,
patch-o-magic-version)?

iptables prints this error:
sudo /usr/local/sbin/iptables -t raw -A PREROUTING -j TRACE
iptables: Unknown error 4294967295

regards
moritz

.config
#
# IP: Virtual Server Configuration
#
# CONFIG_IP_VS is not set
CONFIG_IPV6=3Dy
CONFIG_IPV6_PRIVACY=3Dy
CONFIG_INET6_AH=3Dm
CONFIG_INET6_ESP=3Dm
CONFIG_INET6_IPCOMP=3Dm
CONFIG_INET6_TUNNEL=3Dm
CONFIG_IPV6_TUNNEL=3Dm
CONFIG_NETFILTER=3Dy
# CONFIG_NETFILTER_DEBUG is not set
CONFIG_BRIDGE_NETFILTER=3Dy
CONFIG_NETFILTER_NETLINK=3Dm
CONFIG_NETFILTER_NETLINK_QUEUE=3Dm
CONFIG_NETFILTER_NETLINK_LOG=3Dm

#
# IP: Netfilter Configuration
#
CONFIG_IP_NF_CONNTRACK=3Dm
CONFIG_IP_NF_CT_ACCT=3Dy
CONFIG_IP_NF_CONNTRACK_MARK=3Dy
# CONFIG_IP_NF_CONNTRACK_EVENTS is not set
CONFIG_IP_NF_CONNTRACK_NETLINK=3Dm
# CONFIG_IP_NF_CT_PROTO_SCTP is not set
CONFIG_IP_NF_FTP=3Dm
CONFIG_IP_NF_IRC=3Dm
# CONFIG_IP_NF_NETBIOS_NS is not set
CONFIG_IP_NF_TFTP=3Dm
# CONFIG_IP_NF_AMANDA is not set
# CONFIG_IP_NF_PPTP is not set
CONFIG_IP_NF_QUEUE=3Dm
CONFIG_IP_NF_IPTABLES=3Dm
CONFIG_IP_NF_MATCH_LIMIT=3Dm
CONFIG_IP_NF_MATCH_IPRANGE=3Dm
CONFIG_IP_NF_MATCH_MAC=3Dm
CONFIG_IP_NF_MATCH_LAYER7=3Dm
# CONFIG_IP_NF_MATCH_LAYER7_DEBUG is not set
CONFIG_IP_NF_MATCH_PKTTYPE=3Dm
CONFIG_IP_NF_MATCH_MARK=3Dm
CONFIG_IP_NF_MATCH_MULTIPORT=3Dm
CONFIG_IP_NF_MATCH_TOS=3Dm
CONFIG_IP_NF_MATCH_RECENT=3Dm
CONFIG_IP_NF_MATCH_ECN=3Dm
CONFIG_IP_NF_MATCH_DSCP=3Dm
CONFIG_IP_NF_MATCH_AH_ESP=3Dm
CONFIG_IP_NF_MATCH_LENGTH=3Dm
CONFIG_IP_NF_MATCH_TTL=3Dm
CONFIG_IP_NF_MATCH_TCPMSS=3Dm
CONFIG_IP_NF_MATCH_HELPER=3Dm
CONFIG_IP_NF_MATCH_STATE=3Dm
CONFIG_IP_NF_MATCH_CONNTRACK=3Dm
CONFIG_IP_NF_MATCH_OWNER=3Dm
CONFIG_IP_NF_MATCH_PHYSDEV=3Dm
# CONFIG_IP_NF_MATCH_ADDRTYPE is not set
# CONFIG_IP_NF_MATCH_REALM is not set
# CONFIG_IP_NF_MATCH_SCTP is not set
# CONFIG_IP_NF_MATCH_DCCP is not set
# CONFIG_IP_NF_MATCH_COMMENT is not set
CONFIG_IP_NF_MATCH_CONNMARK=3Dm
CONFIG_IP_NF_MATCH_CONNBYTES=3Dm
CONFIG_IP_NF_MATCH_HASHLIMIT=3Dm
# CONFIG_IP_NF_MATCH_STRING is not set
CONFIG_IP_NF_FILTER=3Dm
CONFIG_IP_NF_TARGET_REJECT=3Dm
CONFIG_IP_NF_TARGET_LOG=3Dm
CONFIG_IP_NF_TARGET_ULOG=3Dm
# CONFIG_IP_NF_TARGET_TCPMSS is not set
CONFIG_IP_NF_TARGET_NFQUEUE=3Dm
CONFIG_IP_NF_NAT=3Dm
CONFIG_IP_NF_NAT_NEEDED=3Dy
CONFIG_IP_NF_TARGET_MASQUERADE=3Dm
CONFIG_IP_NF_TARGET_REDIRECT=3Dm
CONFIG_IP_NF_TARGET_NETMAP=3Dm
CONFIG_IP_NF_TARGET_SAME=3Dm
# CONFIG_IP_NF_NAT_SNMP_BASIC is not set
CONFIG_IP_NF_NAT_IRC=3Dm
CONFIG_IP_NF_NAT_FTP=3Dm
CONFIG_IP_NF_NAT_TFTP=3Dm
CONFIG_IP_NF_MANGLE=3Dm
CONFIG_IP_NF_TARGET_TOS=3Dm
# CONFIG_IP_NF_TARGET_ECN is not set
# CONFIG_IP_NF_TARGET_DSCP is not set
CONFIG_IP_NF_TARGET_MARK=3Dm
CONFIG_IP_NF_TARGET_CLASSIFY=3Dm
CONFIG_IP_NF_TARGET_TTL=3Dm
CONFIG_IP_NF_TARGET_CONNMARK=3Dm
CONFIG_IP_NF_TARGET_CLUSTERIP=3Dm
CONFIG_IP_NF_RAW=3Dm
CONFIG_IP_NF_TARGET_NOTRACK=3Dm
CONFIG_IP_NF_ARPTABLES=3Dm
CONFIG_IP_NF_ARPFILTER=3Dm
CONFIG_IP_NF_ARP_MANGLE=3Dm
CONFIG_IP_NF_TARGET_IPV4OPTSSTRIP=3Dm
CONFIG_IP_NF_MATCH_CONNLIMIT=3Dm
# CONFIG_IP_NF_MATCH_EXPIRE is not set
# CONFIG_IP_NF_MATCH_PSD is not set
CONFIG_IP_NF_MATCH_QUOTA=3Dm
# CONFIG_IP_NF_SET is not set
CONFIG_IP_NF_TARGET_IPMARK=3Dm
CONFIG_IP_NF_TARGET_ROUTE=3Dm
CONFIG_IP_NF_TARGET_TARPIT=3Dm
CONFIG_IP_NF_MATCH_IPP2P=3Dm
CONFIG_IP_NF_TARGET_TRACE=3Dm

