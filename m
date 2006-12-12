From: "Matt" <Matt@PlumSoftware.co.uk>
Subject: Routing & NAT Problem take #2
Date: Tue, 12 Dec 2006 10:29:39 -0000
Message-ID: <117F5E7DA31C17478948DC39E01B948B400F58@frost.PlumSoftwareLtd.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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



Related problem to the earlier one, I'm afraid. Current network layout:


                Internet                 =20
                   |                     =20
         ----100.100.251.217----          =20
        /      (router)        \                  Internet
       |                        |                     |
 100.100.251.220           100.100.251.218        200.200.64.139
       |                        |                     |
 192.168.100.x                   \                   /
(Office Network)                  \                 /
				         Linux Multihomed Router
                                       192.168.0.254
                                             |
                                             |
                                        192.168.0.6
                                      Internal Server


I got the above working on our test bed, where users can get to the =
internal server 192.168.0.6 via either Internet connection. The problem =
is getting from our Office Network to 200.200.64.139:56100

What appears to be happening is this:

1. Packet is sent from internal router, arrives at 100.100.251.220, is =
routed through 100.100.251.217 to the Internet.
2. Packet arrives at 200.200.64.139, DNAT'd to 192.168.0.6.
3. Internal Server replies, sends it to it's default gateway =
(192.168.0.254)
4. Linux server sees 100.100.251.220 as destination, sends to =
100.100.251.218 instead of back out of 200.200.64.139. (This is not =
expected as I'm marking incoming connections at the linux router using =
CONNMARK/MARK, and connections go in and out of the correct interface =
when the destination is outside the 100.100.251.216/29 network)

(Note: I don't know if the returning connections are SNAT'd back to =
200.200.64.139)

So...

Is there a way around this? i.e. so that the multihoming still works?

It seems that normal routing to the 100.100.251.216/29 network takes =
precedence over my connection marked rule, that would instruct the =
packet to be sent out over the correct interface (and maybe therefore =
SNAT'd correctly too).

Not sure what's going on. Can anyone point me in the correct direction?

Thanks,

Matt

