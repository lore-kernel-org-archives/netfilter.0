From: "Ali Ozaltin" <ali@yenibasaran.com>
Subject: RE: Iptables Modules
Date: Mon, 11 Dec 2006 14:38:12 +0200
Message-ID: <14139.3481907018$1165840716@news.gmane.org>
References: <1538.193.173.119.247.1165839243.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1538.193.173.119.247.1165839243.squirrel@webmail.sterenborg.info>
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
Content-Type: text/plain; charset="iso-8859-1"
To: 'Rob Sterenborg' <rob@sterenborg.info>, netfilter@lists.netfilter.org

Rob,

[root@websrv1 log]# ls
/lib/modules/2.6.18-1.2798.fc6xen/kernel/net/ipv4/netfilter
arptable_filter.ko          ip_conntrack_proto_sctp.ko  ip_nat_tftp.ko
ipt_DSCP.ko        ipt_REJECT.ko
arp_tables.ko               ip_conntrack_sip.ko         ip_queue.ko
ipt_ecn.ko         ipt_SAME.ko
arpt_mangle.ko              ip_conntrack_tftp.ko        =
iptable_filter.ko
ipt_ECN.ko         ipt_TCPMSS.ko
ip_conntrack_amanda.ko      ip_nat_amanda.ko            =
iptable_mangle.ko
ipt_hashlimit.ko   ipt_tos.ko
ip_conntrack_ftp.ko         ip_nat_ftp.ko               iptable_nat.ko
ipt_iprange.ko     ipt_TOS.ko
ip_conntrack_h323.ko        ip_nat_h323.ko              iptable_raw.ko
ipt_LOG.ko         ipt_ttl.ko
ip_conntrack_irc.ko         ip_nat_irc.ko               ip_tables.ko
ipt_MASQUERADE.ko  ipt_TTL.ko
ip_conntrack.ko             ip_nat.ko                   ipt_addrtype.ko
ipt_NETMAP.ko      ipt_ULOG.ko
ip_conntrack_netbios_ns.ko  ip_nat_pptp.ko              ipt_ah.ko
ipt_owner.ko
ip_conntrack_netlink.ko     ip_nat_sip.ko               ipt_CLUSTERIP.ko
ipt_recent.ko
ip_conntrack_pptp.ko        ip_nat_snmp_basic.ko        ipt_dscp.ko
ipt_REDIRECT.ko
[root@websrv1 log]# modprobe ipt_hashlimit.ko
FATAL: Module ipt_hashlimit.ko not found.
[root@websrv1 log]# modprobe ipt_iprange.ko
FATAL: Module ipt_iprange.ko not found.
[root@websrv1 log]#




I cant start modprobe can you pls advise ?

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Rob =
Sterenborg
Sent: Monday, December 11, 2006 2:14 PM
To: netfilter@lists.netfilter.org
Subject: Re: Iptables Modules

On Mon, December 11, 2006 13:01, Ali Ozaltin wrote:
>
> Hello,
>
>
> When I use "lsmod" command i can see three enables module for =
iptables.
How
> can I enable other modules ? Can you pls help ?
>
> ip_tables  17669=EF=BF=BD 3 iptable_nat,iptable_mangle,iptable_filter

iptables -A ... -p <proto> ...

or

iptables -A ... -m <module> ...

(See: man iptables)

or

modprobe <iptables_module>

(See: man modprobe)

You can find the netfilter modules that you have installed in:

/lib/modules/`uname -r`/kernel/net/ipv4/netfilter


Grts,
Rob



