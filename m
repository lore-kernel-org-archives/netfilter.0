From: Graham Murray <graham@gmurray.org.uk>
Subject: Re: Problem with state match for ip6tables
Date: Sat, 04 Feb 2006 10:20:26 +0000
Message-ID: <87d5i3bf2t.fsf@newton.gmurray.org.uk>
References: <20060202133857.5bded5b8@localhost.localdomain>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/simple; d=gmurray.org.uk; s=in200507;
	t=1139048427; h=Received:X-Authentication-Warning:From:To:Subject:
	References:X-Hashcash:Date:In-Reply-To:Message-ID:User-Agent:
	MIME-Version:Content-Type; b=Aqkl1XpaoJs86Aha7KiKa9vKGbDnSCDy4gcGcw
	dmgk+eRf1oow+g7F9qzLd0FkDeVhBd0wZLW3LfcEEq872gZA==
In-Reply-To: <20060202133857.5bded5b8@localhost.localdomain> (Frederic Beck's
	message of "Thu, 2 Feb 2006 13:38:57 +0100")
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Frederic Beck <frederic.beck@loria.fr> writes:

> root@trunks:~/firewalling/iptables
> % ip6tables -A FORWARD  -m state --state ESTABLISHED -j ACCEPT
> ip6tables: Unknown error 4294967295

I see the same problem with gentoo kernel 2.6.15-r2 and iptables
1.3.5, except that I also add the protocol 

# ip6tables -I INPUT 1 -p tcp -m state --state NEW,ESTABLISHED -j ACCEPT
ip6tables: Unknown error 4294967295

strace shows this prior to the error

socket(PF_INET6, SOCK_RAW, IPPROTO_RAW) = 3
getsockopt(3, SOL_IPV6, 0x40 /* IPV6_??? */, "filter\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., [84]) = 0
getsockopt(3, SOL_IPV6, 0x41 /* IPV6_??? */, "filter\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., [2328]) = 0
setsockopt(3, SOL_IPV6, 0x40 /* IPV6_??? */, "filter\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 2620) = -1 ENOENT (No such file or directory)
write(2, "ip6tables: Unknown error 4294967"..., 36ip6tables: Unknown error 4294967295
) = 36


I have connection tracking turned on in the kernel

CONFIG_NETFILTER_NETLINK=y
CONFIG_NETFILTER_NETLINK_QUEUE=y
CONFIG_NETFILTER_NETLINK_LOG=y
CONFIG_NF_CONNTRACK=y
# CONFIG_NF_CT_ACCT is not set
# CONFIG_NF_CONNTRACK_MARK is not set
CONFIG_NF_CONNTRACK_EVENTS=y
# CONFIG_NF_CT_PROTO_SCTP is not set
# CONFIG_NF_CONNTRACK_FTP is not set

CONFIG_NF_CONNTRACK_IPV6=y
# CONFIG_IP6_NF_QUEUE is not set
CONFIG_IP6_NF_IPTABLES=y
CONFIG_IP6_NF_MATCH_LIMIT=y
CONFIG_IP6_NF_MATCH_MAC=y
CONFIG_IP6_NF_MATCH_RT=y
CONFIG_IP6_NF_MATCH_OPTS=y
CONFIG_IP6_NF_MATCH_FRAG=y
CONFIG_IP6_NF_MATCH_HL=y
CONFIG_IP6_NF_MATCH_MULTIPORT=y
CONFIG_IP6_NF_MATCH_OWNER=y
CONFIG_IP6_NF_MATCH_MARK=y
CONFIG_IP6_NF_MATCH_IPV6HEADER=y
CONFIG_IP6_NF_MATCH_AHESP=y
CONFIG_IP6_NF_MATCH_LENGTH=y
CONFIG_IP6_NF_MATCH_EUI64=y
CONFIG_IP6_NF_FILTER=y
CONFIG_IP6_NF_TARGET_LOG=y
CONFIG_IP6_NF_TARGET_REJECT=y
CONFIG_IP6_NF_TARGET_NFQUEUE=y
CONFIG_IP6_NF_MANGLE=y
CONFIG_IP6_NF_TARGET_MARK=y
CONFIG_IP6_NF_TARGET_HL=y
CONFIG_IP6_NF_RAW=y

