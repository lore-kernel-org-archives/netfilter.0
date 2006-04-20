From: Yasuyuki KOZAKAI <yasuyuki.kozakai@toshiba.co.jp>
Subject: Re: connection tracking of ipv6
Date: Thu, 20 Apr 2006 17:27:33 +0900 (JST)
Message-ID: <200604200827.k3K8RY3g019153@toshiba.co.jp>
References: <20060418205811.70fa7908@pluto.priv.schuetter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060418205811.70fa7908@pluto.priv.schuetter.org>
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
Content-Type: Text/Plain; charset="iso-8859-1"
To: netfilter@schuetter.org
Cc: netfilter@lists.netfilter.org


From: J=F6rg Sch=FCtter <netfilter@schuetter.org>
Date: Tue, 18 Apr 2006 20:58:11 +0200

> I'm still having problems with connection tracking of ipv6. It
> looks like none of the packets is detected as a port of a
> established connection.
> Can someone please show me what I'm doing wrong.
> =

> lsmod | grep -E '(ip6_|ip_|xp_|ip_|x_|iptable|ip6table)'
> ip6table_filter         1984  1
> ip6_tables              9880  1 ip6table_filter
> iptable_filter          2112  1
> ip_tables               8792  1 iptable_filter
> ip_conntrack           39352  2 xt_state,xt_conntrack
> nfnetlink               4440  1 ip_conntrack
> x_tables                8388  6 ipt_REJECT,xt_tcpudp,ip6_tables,ip_ta=
bles,xt_state,xt_conntrack

Please build and use nf_conntrack and nf_conntrack_ipv6 instead of
ip_conntrack. You need to say n on IP_NF_CONNTRACK and say y or m
on NF_CONNTRACK and NF_CONNTRACK_IPV6.

And please note that nf_conntrack has not supported IPv4 NAT yet, thoug=
h.

-- Yasuyuki Kozakai

