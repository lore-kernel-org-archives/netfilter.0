From: "Matt" <Matt@PlumSoftware.co.uk>
Subject: RE: Routing & NAT Problem take #2
Date: Wed, 13 Dec 2006 11:15:38 -0000
Message-ID: <117F5E7DA31C17478948DC39E01B948B400F66@frost.PlumSoftwareLtd.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <lartc-bounces@mailman.ds9a.nl>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://mailman.ds9a.nl/cgi-bin/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=unsubscribe>
List-Archive: <http://mailman.ds9a.nl/pipermail/lartc>
List-Post: <mailto:lartc@mailman.ds9a.nl>
List-Help: <mailto:lartc-request@mailman.ds9a.nl?subject=help>
List-Subscribe: <http://mailman.ds9a.nl/cgi-bin/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=subscribe>
Sender: lartc-bounces@mailman.ds9a.nl
Errors-To: lartc-bounces@mailman.ds9a.nl
Content-Type: text/plain; charset="us-ascii"
To: "LARTC (E-mail)" <lartc@mailman.ds9a.nl>, "Netfilter (E-mail)" <netfilter@lists.netfilter.org>


Cross posted to Netfilter and LARTC...

Grant & ArcosCom Linux User

Thanks for your replies.

Firstly, one problem was with my Token Bucket Filler on one of the =
interfaces, as it was dropping lots of packets and stopping connections =
from working over that interface. This lead to some strange results, =
with apparent partial success.

Secondly, I've decided against trying to get it working over the =
Internet, as actually it makes better sense for us if it doesn't. (it =
works a little quicker)

Grant - yes, this is a wierd routing issue! :) We looked at various =
multihoming solutions, and they either involved excessive cost with AS =
numbers and BGP and cisco routers, pointless montly renting for a third =
partly to do similar, and then I found that we could do something more =
or less the same without any of the cost using Linux... and here we are. =
It doesn't matter to us that users have to change IP address to use the =
2nd line. We don't users on the 2nd line unless the 1st line is broken =
as it is also our office internet line!

Anyway, thanks again, your comments helped me understand what was going =
on at the wire.

Cheers!

Matt

On 12/12/06 04:29, Matt wrote:
> I got the above working on our test bed, where users can get to the =
internal server 192.168.0.6 via either Internet connection. The problem =
is getting from our Office Network to 200.200.64.139:56100

*nod*  This is a weird routing issue.  (See below.)

> What appears to be happening is this:
>
> 1. Packet is sent from internal router, arrives at 100.100.251.220, is =
routed through 100.100.251.217 to the Internet.
> 2. Packet arrives at 200.200.64.139, DNAT'd to 192.168.0.6.
> 3. Internal Server replies, sends it to it's default gateway =
(192.168.0.254)
> 4. Linux server sees 100.100.251.220 as destination, sends to =
100.100.251.218 instead of back out of 200.200.64.139. (This is not =
expected as I'm marking incoming connections at the linux router using =
CONNMARK/MARK, and connections go in and out of the correct interface =
when the destination is outside the 100.100.251.216/29 network)

Presuming that you are not doing any custom routing with IPRoute2, this =
is as I would expect.  What is happening is your "Linux Multihomed =
Router" has a direct route back to your office's internet router.  Per =
standard routing mechanisms, your router will choose a directly =
connected route, or any other (non default) route that it knows of over =
your default route.  So, really your Linux router is doing what it =
should be doing.  Unfortunately what it should be doing is not what you =
want it to be doing.

> (Note: I don't know if the returning connections are SNAT'd back to =
200.200.64.139)

A simple TCPDump will tell you if this is the case or not.  However, I =
suspect that the packets are being SNATed to 100.100.251.218.

> Is there a way around this? i.e. so that the multihoming still works?

Yes, multiple.

One is to make your office router know that it can reach the =
200.200.64.139 host via the 100.100.251.218 router.  However, this is =
probably not what you really want to do.  I say this is probably not =
want you want to do b/c I'm willing to bet that you are wanting to be =
able to test things across the internet from your office, which would be =
circumvented with this routing.

> It seems that normal routing to the 100.100.251.216/29 network takes =
precedence over my connection marked rule, that would instruct the =
packet to be sent out over the correct interface (and maybe therefore =
SNAT'd correctly too).

Yes (see above).  This is because IPTables usually does not interact =
with any routing decisions.  (Usually b/c IPTables can be configured to =
do exactly that.)  IPTables usually acts on packets before and after =
routing decisions have been made.

> Not sure what's going on. Can anyone point me in the correct =
direction?

A different and probably my recommended solution (presuming that you =
want the traffic to cross the internet) would be to use a custom routing =
table for traffic that is to use the 200.200.64.139 interface.  This =
custom routing table would not include any knowledge of the =
100.100.251.218 network.  Thus any traffic back to the office at =
100.100.251.220 would be routed through the default gateway and out =
across the internet back to the office.  Presuming that you have MARK =
and CONNMARK working correctly you could use an "ip rule" to look for =
the firewall mark to instruct the Linux kernel to use the alternant =
routing table.



Grant. . . .
