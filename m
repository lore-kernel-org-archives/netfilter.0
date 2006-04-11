From: Maurice Volaski <mvolaski@aecom.yu.edu>
Subject: Re: iptables is complaining with bogus unknown error
 18446744073709551615
Date: Tue, 11 Apr 2006 15:13:12 -0400
Message-ID: <a0623090fc061ab3f1f8e@[129.98.90.227]>
References: <200604111452.k3BEpxdo019103@mailgw.aecom.yu.edu>	
	<a06230909c06193cea962@129.98.90.227>
	<876ef97a0604111146m742d75f0gb8240e82ba7426f1@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <876ef97a0604111146m742d75f0gb8240e82ba7426f1@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Toby DiPasquale <codeslinger@gmail.com>
Cc: netfilter@lists.netfilter.org

Thank you for your reply.

>On 4/11/06, Maurice Volaski <mvolaski@aecom.yu.edu> wrote:
>>  I just incorporated kernel 2.6.16.1 into my Gentoo system.
>>
>>  The firewall script no longer functions properly. Standard iptables
>>  calls return
>>  iptables: unknown error 18446744073709551615
>>
>>  Posted in bugzilla as
>  > https://bugzilla.netfilter.org/bugzilla/show_bug.cgi?id=467
>
>Lemme guess: AMD64, right? 18446744073709551615 is -1 being cast as an
>unsigned long on a 64-bit platform.

Correct.

>We can't really assist you however if you don't provide some
>information on the firewall rules used, modules loaded, kernel
>configuration, etc. Thanks.
>

Examples of rules that give the error are

1) iptables -A INPUT -i bond0 -s 129.98.90.0/24 -p tcp --dport 548 -j ACCEPT
2) iptables -A INPUT -i bond0 -s 129.98.90.101/32 -p tcp --dport 497 -j ACCEPT
3) iptables -A INPUT -i bond0 -s 129.98.90.227/32 -p tcp --dport 22 -j ACCEPT

Example of a rule that does not give the error:
1) iptables -A INPUT -i bond0 -p ICMP --icmp-type echo-request -s 
129.98.90.13/32 -j ACCEPT

The computer is using IPv4 and not IPv6, which has not been compiled into the
kernel.

iptables is version 1.3.5.

Kernel configuration related to iptables follows:

CONFIG_IP_NF_CONNTRACK=m
CONFIG_IP_NF_CT_ACCT=y
CONFIG_IP_NF_CONNTRACK_MARK=y
CONFIG_IP_NF_CONNTRACK_EVENTS=y
CONFIG_IP_NF_CONNTRACK_NETLINK=m
# CONFIG_IP_NF_CT_PROTO_SCTP is not set
CONFIG_IP_NF_FTP=m
# CONFIG_IP_NF_IRC is not set
# CONFIG_IP_NF_NETBIOS_NS is not set
# CONFIG_IP_NF_TFTP is not set
# CONFIG_IP_NF_AMANDA is not set
# CONFIG_IP_NF_PPTP is not set
# CONFIG_IP_NF_QUEUE is not set
CONFIG_IP_NF_IPTABLES=m
CONFIG_IP_NF_MATCH_IPRANGE=m
CONFIG_IP_NF_MATCH_MULTIPORT=m
CONFIG_IP_NF_MATCH_TOS=m
CONFIG_IP_NF_MATCH_RECENT=m
CONFIG_IP_NF_MATCH_ECN=m
CONFIG_IP_NF_MATCH_DSCP=m
CONFIG_IP_NF_MATCH_AH_ESP=m
CONFIG_IP_NF_MATCH_TTL=m
CONFIG_IP_NF_MATCH_OWNER=m
CONFIG_IP_NF_MATCH_ADDRTYPE=m
CONFIG_IP_NF_MATCH_HASHLIMIT=m
CONFIG_IP_NF_FILTER=m
# CONFIG_IP_NF_TARGET_REJECT is not set
CONFIG_IP_NF_TARGET_LOG=m
CONFIG_IP_NF_TARGET_ULOG=m
CONFIG_IP_NF_TARGET_TCPMSS=m
# CONFIG_IP_NF_NAT is not set
CONFIG_IP_NF_MANGLE=m
# CONFIG_IP_NF_TARGET_TOS is not set
# CONFIG_IP_NF_TARGET_ECN is not set
# CONFIG_IP_NF_TARGET_DSCP is not set
# CONFIG_IP_NF_TARGET_TTL is not set
# CONFIG_IP_NF_TARGET_CLUSTERIP is not set
# CONFIG_IP_NF_RAW is not set
CONFIG_IP_NF_ARPTABLES=m
# CONFIG_IP_NF_ARPFILTER is not set
# CONFIG_IP_NF_ARP_MANGLE is not set

CONFIG_NETFILTER_XT_TARGET_CLASSIFY=m
# CONFIG_NETFILTER_XT_TARGET_CONNMARK is not set
CONFIG_NETFILTER_XT_TARGET_MARK=m
CONFIG_NETFILTER_XT_TARGET_NFQUEUE=m
CONFIG_NETFILTER_XT_MATCH_COMMENT=m
CONFIG_NETFILTER_XT_MATCH_CONNBYTES=m
CONFIG_NETFILTER_XT_MATCH_CONNMARK=m
CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
CONFIG_NETFILTER_XT_MATCH_DCCP=m
CONFIG_NETFILTER_XT_MATCH_HELPER=m
CONFIG_NETFILTER_XT_MATCH_LENGTH=m
CONFIG_NETFILTER_XT_MATCH_LIMIT=m
CONFIG_NETFILTER_XT_MATCH_MAC=m
CONFIG_NETFILTER_XT_MATCH_MARK=m
CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m
CONFIG_NETFILTER_XT_MATCH_REALM=m
CONFIG_NETFILTER_XT_MATCH_SCTP=m
CONFIG_NETFILTER_XT_MATCH_STATE=m
CONFIG_NETFILTER_XT_MATCH_STRING=m
CONFIG_NETFILTER_XT_MATCH_TCPMSS=m

lsmod shows
xt_state                4480  0
ipt_LOG                 8512  0
ip_conntrack_ftp        9424  0
ip_conntrack           52412  2 xt_state,ip_conntrack_ftp
nfnetlink               7624  1 ip_conntrack
iptable_filter          5120  0
ip_tables              13720  1 iptable_filter
x_tables               13704  3 xt_state,ipt_LOG,ip_tables

-- 

Maurice Volaski, mvolaski@aecom.yu.edu
Computing Support, Rose F. Kennedy Center
Albert Einstein College of Medicine of Yeshiva University

