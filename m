From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: vpn masquerading
Date: Thu, 19 Jan 2006 19:05:06 +0100
Message-ID: <000901c61d22$e14cfb10$0101000a@sterenborg.info>
References: <NHBBLNDNFKDMKNNKGOMMAEABOCAA.gregoriandres@yahoo.com.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <NHBBLNDNFKDMKNNKGOMMAEABOCAA.gregoriandres@yahoo.com.ar>
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

> outch !!

Yes, well.. When I wrote this I was at work and unable to test.
Now I'm back home and tested this. I have all modules loaded
(ip_nat_pptp, ip_nat_proto_gre, ip_conntrack_pptp and
ip_conntrack_proto_gre) and that is the only way I can connect multiple
machines to a pptp server.
So, my info was incorrect : keep those modules loaded.

> -> Still, we don't know what you rule have so far concerning pptp...
> -> It's a little hard to give advice this way.
> 
> 
> I only have a "MASQUERADE" rule in POSTROTING nat table.
> That's all.
> 
> I need a specific rule to masquerade VPN ?

Apparently that works (I have never used MASQUERADE on linux-2.4+), but
the prefered way is to use SNAT. Maybe that will also solve your
problem.

Try something like :

$ipt -P FORWARD DROP

$ipt -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

$ipt -A FORWARD -m state --state NEW -i <if_lan> -o <if_inet> \
  -s <net_lan> -p gre -j ACCEPT

$ipt -A FORWARD -m state --state NEW -i <if_lan> -o <if_inet> \
  -s <net_lan> -p tcp --dport 1723 -j ACCEPT

$ipt -t nat -A POSTROUTING -o <if_out> -s <net_lan> \
  -j SNAT --to <inet_ip>


Gr,
Rob


