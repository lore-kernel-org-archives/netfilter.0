From: "Mike" <mikeeo@msn.com>
Subject: Re: sub interface filtering
Date: Thu, 3 Apr 2003 10:49:32 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001e01c2f9f8$9f53f380$8b01a8c0@win2k.com>
References: <000b01c2f947$feb84a80$8b01a8c0@win2k.com> <200304021556.00113.netfilter@newkirk.us>
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
To: netfilter@newkirk.us, netfilter@lists.netfilter.org

Joel,
        I tried forwarding ALL connections  and then filtering by the
forward chain but no luck. Once it reaches the PREROUTING chain and makes
its descision does it pass anymore chains? Or is that it. I have always read
you don't want to filter in the NAT table and PREROUTING doesn't have a
filter table just a NAT & MANGLE. Any ideas?

-Mike
----- Original Message -----
From: "Joel Newkirk" <netfilter@newkirk.us>
To: "Mike" <mikeeo@msn.com>; <netfilter@lists.netfilter.org>
Sent: Wednesday, April 02, 2003 3:56 PM
Subject: Re: sub interface filtering


On Wednesday 02 April 2003 01:45 pm, Mike wrote:
> Hi guys I have the following setup and rules. And I cant seem to get
> the filtering to work.

> iptables -t nat -A PREROUTING -p tcp <routeable internetIP/28> --dport
> 80 -j DNAT --to 192.168.1.197
>
> iptables -t nat -A PREROUTING -p tcp <routeable internetIP/28> --dport
> 443 -j DNAT --to 192.168.1.197
> iptables -t nat -A POSTROUTING -o eth2 -s 192.168.1.197 -j SNAT --to
> <routeable internetIP/28

> but when I scan eth2:1 or eth2:2 from an outside machine I can see ALL
> the local services (ssh, ptptp,dns etc..) Is connection not passing
> the forwading chain?

You are DNATting dport 80 and dport 443, but the remainder of the ports
are not being DNATted, so they still target the firewall box.  You'd
need to DNAT all connections to the specified IP, then DROP all except
ports 80 and 443 in FORWARD to avoid this.

Of course, this also shows that you are letting lots of (all?!?) ports
through the INPUT chain to the box itself from outside, which you should
lock down as well...  A DROP policy on INPUT is called for, then ACCEPT
required ports from eth2 for externally-accessed services (if any) and
ACCEPT required (or all if desired) ports from the LAN machines.

j




