From: "Steve Arentz" <arentz@ameritech.net>
Subject: RE: icmp type error message
Date: Sat, 24 Apr 2004 22:37:30 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <KHEPIJJDEJGPDCBOMGKAGEJDCDAA.arentz@ameritech.net>
References: <200404241831.01573.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404241831.01573.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org


On Saturday 24 April 2004 11:52 am, Steve Arentz wrote:

> I upgraded my Redhat based linux firewall (netfilter) system from
> iptables v1.2.8, kernel v2.4.23 to iptables v1.2.9, kernel v2.4.25.
> (Trustix v2.0 to Trustix v2.1 just in case its important.)
>
> Using the same rule set, all my icmp rules now get the following error =
-
> iptables v1.2.9: Unknown arg =91--icmp-type=92
>
> A simple command line rule entry like the following gets the same error=
 -
> iptables -A INPUT -p ICMP -s 0/0 --icmp-type 8 -j ACCEPT

On Saturday 24 April 2004 5:52 pm, Antony Stone wrote:

> What do you get in response to "iptables -p icmp -h"?   Does it tell yo=
u
what
> type names are supported?

Output of "iptables -p icmp -h" from iptables v1.2.8 lists many valid ICM=
P
types.
Output from iptables v1.2.9 doesn't list any valid ICMP types.

> Do you get the same error if you specify the ICMP type by name instead =
of
> number (ie: 'echo-request' instead of '8')?

Get the same error message.

Here's a listing of the iptables v1.2.8 modules
(/etc/sysconfig/iptables-modules-ipv4)  loaded by the startup script
(/etc/init.d/iptables).
arp_tables
arptable_filter
ip_conntrack
ip_conntrack_ftp
ip_conntrack_irc
ip_conntrack_pptp
ip_conntrack_proto_gre
ip_nat_ftp
ip_nat_irc
ip_nat_pptp
ip_nat_proto_gre
ip_nat_snmp_basic
ip_queue
ip_tables
ipt_DSCP
ipt_ECN
ipt_LOG
ipt_MARK
ipt_MASQUERADE
ipt_MIRROR
ipt_REDIRECT
ipt_REJECT
ipt_TCPMSS
ipt_TOS
ipt_ULOG
ipt_ah
ipt_conntrack
ipt_dscp
ipt_ecn
ipt_esp
ipt_helper
ipt_length
ipt_limit
ipt_mac
ipt_mark
ipt_multiport
ipt_owner
ipt_pkttype
ipt_state
ipt_tcpmss
ipt_tos
ipt_ttl
ipt_unclean
iptable_filter
iptable_mangle
iptable_nat

The iptables v1.2.9 module listing is the same.

Thanks again for your help,
Steve


