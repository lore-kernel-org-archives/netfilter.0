From: "Jeremy" <jeremy@paradise.net.nz>
Subject: invalid argument / 2.4.21 kernel / iptables 1.2.6a (help please!)
Date: Wed, 9 Jul 2003 09:31:32 +1200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <024901c34598$4d6e84e0$3964a8c0@comsol.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi Everyone.

I run a debian box with the kernel/iptables version as per the subject, I
have also applied P-O-M patch pptp-conntrack-nat and re-compiled
succesfully.

Just wondering if anyone knows why, when I try and execute the following, I
get an invalid argument from iptables.

IPTABLES -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 202.0.35.*
(inet_ip)

is this in incompatability thing, i.e. i need to upgrade iptables to 1.2.7a
? or something i may have corrupted in the kernel source? The networking
options in my config are as follows:

#   IP: Netfilter Configuration
#
CONFIG_IP_NF_CONNTRACK=y
CONFIG_IP_NF_FTP=y
# CONFIG_IP_NF_AMANDA is not set
# CONFIG_IP_NF_TFTP is not set
# CONFIG_IP_NF_IRC is not set
CONFIG_IP_NF_CT_PROTO_GRE=y
CONFIG_IP_NF_PPTP=y
CONFIG_IP_NF_IPTABLES=y
CONFIG_IP_NF_MATCH_LIMIT=y
# CONFIG_IP_NF_MATCH_MAC is not set
# CONFIG_IP_NF_MATCH_PKTTYPE is not set
# CONFIG_IP_NF_MATCH_MARK is not set
CONFIG_IP_NF_MATCH_MULTIPORT=y
CONFIG_IP_NF_MATCH_TOS=y
# CONFIG_IP_NF_MATCH_ECN is not set
# CONFIG_IP_NF_MATCH_DSCP is not set
# CONFIG_IP_NF_MATCH_AH_ESP is not set
# CONFIG_IP_NF_MATCH_LENGTH is not set
# CONFIG_IP_NF_MATCH_TTL is not set
# CONFIG_IP_NF_MATCH_TCPMSS is not set
# CONFIG_IP_NF_MATCH_HELPER is not set
CONFIG_IP_NF_MATCH_STATE=y
# CONFIG_IP_NF_MATCH_CONNTRACK is not set
CONFIG_IP_NF_FILTER=y
CONFIG_IP_NF_TARGET_REJECT=y
CONFIG_IP_NF_NAT=y
CONFIG_IP_NF_NAT_NEEDED=y
CONFIG_IP_NF_TARGET_MASQUERADE=y
CONFIG_IP_NF_TARGET_REDIRECT=y
CONFIG_IP_NF_NAT_PPTP=y
CONFIG_IP_NF_NAT_PROTO_GRE=y
# CONFIG_IP_NF_NAT_LOCAL is not set
CONFIG_IP_NF_NAT_FTP=y
CONFIG_IP_NF_MANGLE=y
CONFIG_IP_NF_TARGET_TOS=y
# CONFIG_IP_NF_TARGET_ECN is not set
# CONFIG_IP_NF_TARGET_DSCP is not set
# CONFIG_IP_NF_TARGET_MARK is not set
CONFIG_IP_NF_TARGET_LOG=y
# CONFIG_IP_NF_TARGET_ULOG is not set
CONFIG_IP_NF_TARGET_TCPMSS=y
# CONFIG_IP_NF_ARPTABLES is not set
# CONFIG_VLAN_8021Q is not set
# CONFIG_IPX is not set
# CONFIG_ATALK is not set

thanks for any help
much appreciated

Jeremy




