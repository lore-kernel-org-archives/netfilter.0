From: Taner Halicioglu <taner@taner.net>
Subject: Re: Bug?  ICMPs sent by REJECT are not getting SNAT'd...
Date: Fri, 11 Apr 2003 12:08:05 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030411190805.GJ5912@boom.net>
References: <20030411164801.GF5912@boom.net> <Pine.LNX.4.33.0304112051311.528-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0304112051311.528-100000@blackhole.kfki.hu>
Resent-To: netfilter@lists.netfilter.org
Resent-Message-Id: <20030411190924.C95158516F@abort.boom.net>
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
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>

On Fri, Apr 11, 2003 at 08:58:00PM +0200, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu> wrote:

> > No, the problem is that when the firewall machine REJECTs any packets in a
> > FORWARD chain (ie, anything I am blocking that is destined to the network
> > behind it), the source IP of the ICMP UNREACH (or evn the RST packets) is
> > that of the *outside* interface - the unroutable address.  It seems the
> > POSTROUTING is not performed on the ICMPs that are created by the actual
> > host.
> 
> If this is a problem of the forwarded packets, then it has nothing to do
> with the connections initiated from/targeted to the firewall itself.

What?  Of course it does!

I have a rule like:

 iptables -A Firewall -p tcp --dport 1434 -j REJECT

where 'Firewall' is

 iptables -A FORWARD -i eth1 -j Firewall

The above rule will generate an ICMPUNREACH if it tries to forward a packet
coming in eth1 that is destined for port 1434 to anything behind the firewall
machine.

This UNREACH is generated with a source IP of my firewalls *outside*
interface, which is the unrouteable address (and is filtered by my ISP).  I
need this ICMP to be generated with a source IP of my *inside* interface,
instead.

> But if the packets created by the REJECT target contain the address of the
> firewall, then the packet they are rejecting was targeted to the firewall.

No, see above.

> Show me the tcpdump of both the packets rejected and the reject packets
> generated.

12:05:31.037765 66.220.X.Y.38487 > 67.122.A.B.ms-sql-m: S 2857026105:2857026105(0) win 5840 <mss 1460,sackOK,timestamp 406253139 0,nop,wscale 0> (DF) [tos 0x10]
12:05:31.037805 10.0.0.1 > 66.220.X.Y: icmp: 67.122.196.121 tcp port ms-sql-m unreachable [tos 0xd0]

Notice how the source address on the ICMP unreach is the unroutable IP.  I
need it to be an address on the 67.122.n.n address block (my inside
interface).

Refer to my original email w/ diagram again, if you need to :)

	-Taner

