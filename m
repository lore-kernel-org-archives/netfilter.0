From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: NAT ICMP
Date: Wed, 23 Jun 2004 09:36:13 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002b01c458f6$33f99410$fb00010a@adm.mc.local>
References: <D4EF10CCEB2CE742BEEA9838C590B0E8022590B0@ftrdmel2.rd.francetelecom.fr>
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

> Hi, Does someone know how to NAT ICMP from a
>private Network to the internet.
>
> I tried to add a NAT Rule on my firewall but it seems
> that NAT is available only for UDP/TCP??

Uh ?

How about :

$IPT -A FORWARD -i <if_in> -o <if_out> -s <net_lan> -p icmp -j ACCEPT

$IPT -t nat -A POSTROUTING -o <if_out> -s <net_lan> -p icmp -j SNAT
<ip_inet>
or
$IPT -t nat -A POSTROUTING -o <if_out> -s <net_lan> -p icmp -j MASQUERADE


Gr,
Rob


