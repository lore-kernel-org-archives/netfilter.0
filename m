From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Kernel IPSec, routing, iptables and ebtables.
Date: Thu, 17 Jun 2004 08:52:08 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406170852.08831.gdh@acentral.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Hello :)

First let me apologise for having to post this here, because it covers several 
different topic areas. My first port of call for this problem was the 
ebtables list, but haven't had any success so far, so I hoped the pool of 
knowledge here might have encountered a similar problem.

OK, we have 2 sites, each with a near-identical firewall setup. For nearly a 
year, both sites have used bridging-firewalls (device br0) kernel 2.4.20 with 
FreeS/WAN 1.96, and a magic 'ebtables' command to force traffic destined for 
the remote LAN to be funnelled into the ipsec0 device:

/usr/local/bin/ebtables -t nat -A PREROUTING -i eth1 -p ipv4 --ip-dst 
213.2.4.32/27 -j dnat --to-dst 00:02:B3:0A:27:B4 --dnat-target ACCEPT

Yesterday I upgraded one of the boxes to kernel 2.6.6, and this end of the 
IPsec link is now using the kernel-native stack rather than KLIPS, and whilst 
the normal firewall rules work OK (after I converted them to '-m physdev' 
syntax), the ebtables rule causes all data from one LAN to the other to be 
lost. The same happens if I try to insert the MAC address of eth0 instead of 
eth1.

If I remove the ebtables rule altogether, then both sides can talk to each 
other, but the data is only encrypted one way (from the 'far side' still on 
2.4.20 to the new 2.6.6 machine)

My local routing table is simple:

fw-ws:~# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
213.2.4.32      194.200.209.254 255.255.255.224 UG    0      0        0 br0
194.200.209.0   0.0.0.0         255.255.255.0   U     0      0        0 br0
0.0.0.0         194.200.209.254 0.0.0.0         UG    0      0        0 br0

I'm a little out of my depth here - the 'black majik' that's worked for months 
has run out of steam, and a need a new incantation! :)

Any takers?

Cheers,
Gavin,




