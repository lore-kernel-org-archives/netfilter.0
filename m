From: =?ISO-8859-15?Q?J=F6rg_Sch=FCtter?= <netfilter@schuetter.org>
Subject: connection tracking of ipv6
Date: Tue, 18 Apr 2006 20:58:11 +0200
Message-ID: <20060418205811.70fa7908@pluto.priv.schuetter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Hi

I'm still having problems with connection tracking of ipv6. It
looks like none of the packets is detected as a port of a
established connection.
Can someone please show me what I'm doing wrong.

lsmod | grep -E '(ip6_|ip_|xp_|ip_|x_|iptable|ip6table)'
ip6table_filter         1984  1
ip6_tables              9880  1 ip6table_filter
iptable_filter          2112  1
ip_tables               8792  1 iptable_filter
ip_conntrack           39352  2 xt_state,xt_conntrack
nfnetlink               4440  1 ip_conntrack
x_tables                8388  6 ipt_REJECT,xt_tcpudp,ip6_tables,ip_tables,x=
t_state,xt_conntrack

ip6tables -L INPUT -v -n
Chain INPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion=20
    4   596 ACCEPT     all      lo     *       ::/0                 ::/0=20
    0     0 ACCEPT     icmpv6   sixxs  *       ::/0                 ::/0=20
    0     0 ACCEPT     all      *      *       ::/0                 ::/0   =
     state RELATED,ESTABLISHED
    0     0 DROP       tcp      sixxs  *       ::/0                 ::/0   =
     tcp dpts:1:1024
   78 42071 ACCEPT     tcp      sixxs  *       ::/0                 ::/0   =
     tcp dpts:1025:65535
    3   384 ACCEPT     all      eth2   *       ::/0                 ::/0

uname -a
Linux pluto 2.6.16.7-0 #1 Tue Apr 18 15:49:36 CEST 2006 i686 GNU/Linux

J=F6rg

--=20
J=F6rg Sch=FCtter                      http://www.schuetter.org/joerg
joerg@schuetter.org                http://www.lug-untermain.de/

