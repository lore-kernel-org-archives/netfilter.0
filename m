From: =?ISO-8859-1?Q?Eduardo_Fern=E1ndez?= <efgonzalez@gmail.com>
Subject: Weird ARP traffic closing the link?
Date: Fri, 26 Nov 2004 18:11:40 +0100
Message-ID: <fedfc260411260911eee0369@mail.gmail.com>
Reply-To: =?ISO-8859-1?Q?Eduardo_Fern=E1ndez?= <efgonzalez@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,

Sorry if this is rather offtopic, but here it goes.

I admin a +150 computers switched network at an univ. dorm. Lots of
p2p traffic, udp traffic  caused by viruses, etc. There's LMDS
internet access through NAT. The router is a debian with kernel 2.6.9
+ qnet patches (http://kem.p.lodz.pl/~peter/qnet/). We use l7
filtering and
HTB+SFQ QoS. The NICs are 2 fairly expensive Intel Server 100 and a
Intel 82540EM gigabit.

Recently we needed more IP's, so I moved the network to a /16. More or
less since then (I'm not really sure), the propietary device which
connects to the antenna and to which the router's public interface is
connected hangs. I also noticed with iptraf some weird traffic from
ff:ff:ff:ff:ff:ff in the router's private interface. That traffic also
appears in the public interface when the device hangs, but only when
it hangs. When I reset the device the arp traffic disappears and the
internet comes back. tcpdump shows this in the private interface:

router:~# tcpdump  -i eth2 ether host ff:ff:ff:ff:ff:ff
17:30:50.350369 arp who-has 10.1.15.66 tell 10.1.7.165
17:30:50.350851 arp who-has 10.1.88.114 tell 10.1.7.165
17:30:50.350858 arp who-has 10.1.193.83 tell 10.1.7.165
17:30:50.351335 arp who-has 10.1.209.247 tell 10.1.7.165
17:30:50.352303 arp who-has 10.1.88.28 tell 10.1.7.241
17:30:50.352787 arp who-has 10.1.38.179 tell 10.1.7.138
17:30:50.352796 arp who-has 10.1.32.238 tell 10.1.7.241
17:30:50.353272 arp who-has 10.1.204.142 tell 10.1.7.241
17:30:50.353756 arp who-has 10.1.240.193 tell 10.1.7.241
17:30:50.357674 arp who-has 10.1.12.153 tell 10.1.14.255
17:30:50.360052 arp who-has 10.1.32.86 tell 10.1.14.255

and so on. The IP's after the "tell" are always the same two or three
IP's. Maybe that's viruses forging their IP's?

Also, when the device is working correctly the link is autonegotiated
100FD, but when the device hangs it falls to non-auto 100HD.

Is there any relation between the arp traffic and the device hanging?
What can I do?

Thank you very much in advance. Best regards,

Eduardo

