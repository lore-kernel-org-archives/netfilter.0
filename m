From: Simon Lodal <simonl@parknet.dk>
Subject: Re: DNAT hiding routers behind it
Date: Sat, 07 Aug 2004 04:51:36 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <411443B8.8090202@parknet.dk>
References: <4113BEF9.5090706@parknet.dk> <16659.52594.461489.174741@saint.heaven.net> <4113F33C.7060601@parknet.dk> <200408062356.16206.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200408062356.16206.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> My guess is that you have a MASQUERADE rule with no interface specified - so 
> packets get the source address of the firewall whether they're going out or 
> coming in?
> 
> Make sure you specify "-o eth0" or "-o ppp0" or whatever your external 
> interface is called.
> 
> If not that, post your ruleset so we can have a further think...

Testcase, as simple as possible:
pc has 10.44.252.2
fw has 10.44.252.1 on inside (vmnet2), 10.44.8.10 on outside (eth0).

On outside of fw there is a chain of routers; 10.44.8.1 => 192.168.44.1, 
which is again connected to both 192.168.1.11 and 192.168.2.11 which 
I'll use below.

masquerading or snat (tried both, no difference):
root@fw # iptables -t nat -A POSTROUTING -o eth0 -s 10.44.252.2 -j SNAT 
--to-source 10.44.8.10

No other iptables rules are defined yet.

simonl@pc $ traceroute -q1 -I 192.168.1.11
traceroute to 192.168.1.11 (192.168.1.11), 30 hops max, 38 byte packets
  1  10.44.252.1 (10.44.252.1)  4.297 ms
  2  10.44.8.1 (10.44.8.1)  3.892 ms
  3  192.168.44.1 (192.168.44.1)  4.826 ms
  4  192.168.1.11 (192.168.1.11)  5.095 ms

All good. Now for the fun (dnat to another host at similar distance):
root@fw # iptables -t nat -A PREROUTING -i vmnet2 -s 10.44.252.2 -d 
192.168.1.11 -j DNAT --to-destination 192.168.2.11

simonl@pc $ traceroute -q1 -I 192.168.1.11
traceroute to 192.168.1.11 (192.168.1.11), 30 hops max, 38 byte packets
  1  10.44.252.1 (10.44.252.1)  1.854 ms
  2  192.168.1.11 (192.168.1.11)  9.378 ms
  3  192.168.1.11 (192.168.1.11)  17.237 ms
  4  192.168.1.11 (192.168.1.11)  3.783 ms

See?

I tried dnat'ing without snat on a real network, same problem.
So snat/masquerade has no influence (it is just needed for my setup).


Simon


