From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: another iptables question
Date: Wed, 27 Nov 2002 21:11:26 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211272111.26736.netfilter@newkirk.us>
References: <20021127184139.34206.qmail@web14506.mail.yahoo.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021127184139.34206.qmail@web14506.mail.yahoo.com>
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
To: "james.Q.L" <shijialeeee@yahoo.ca>, netfilter@lists.netfilter.org

On Wednesday 27 November 2002 01:41 pm, james.Q.L wrote:
> still reading the HOWTO.
>
> in the howto, it discusses about how internal machine access
> webserver that is port forwarded to the same network. here
>
> $INET_IP as the internet_IP
>
> 1.packet leaves $LAN_BOX to $INET_IP.

I assume here that you use $LAN_BOX to mean any client machine on the LAN=
, and=20
$INET_IP to mean the external IP of the gateway/firewall, IE the public I=
P=20
that identifies it on the internet itself.  (and is also the 'official' I=
P of=20
any servers hidden behind it on local private IPs)

> 2.the packet reaches the firewall.
> #my quesion: is the packet here looks like come from $INET_IP
> the firewall machine (i.e SNAT'ed when it goes out to request
> the webserver)?

If $LAN_BOX sends a packet to an IP that is on the internet, the procedur=
e is=20
to SNAT it at the firewall/gateway, so that once it leaves the gateway an=
d=20
passes out to the internet it appears to have come FROM the gateway's=20
external IP, since that is the only address that a return packet from the=
=20
internet can be routed to on the internet.

> 3.the packet gets DNAT'ed,and all other requierd action are
> taken,however,the packet is not SNAT'ed. so the same source IP
> address is used on the packet.

If the target of a packet is local (even if this is unknown to $LAN_BOX) =
then=20
the packet needs to be DNATted, since it comes in addressed to $INET_IP, =
but=20
once there we know it REALLY needs to go somewhere else.  If the packet c=
ame=20
from the internet, then the return packet will normally go back to the=20
gateway/firewall machine anyway, (always assuming the server is configure=
d=20
properly :^) which will then 'undo' the DNAT and send the packet on its w=
ay=20
with $INET_IP as it's source IP, instead of the actual address of the ser=
ver,=20
which is private.

> # my question: what does it have to do with SNAT here? shouldn't
> it see the source come from $INET_IP ?

This is where it gets more complicated.  If $LAN_BOX sends a packet to=20
$INET_IP that gets DNATted and forwarded to the local server, the reply f=
rom=20
that server will go DIRECTLY to $LAN_BOX since it recongnizes the client =
as=20
an IP that is local to it, therefore not requiring routing through the=20
gateway.  The solution to this is to SNAT the DNAT.  What you do is DNAT =
the=20
packet as it enters the firewall so that it will be forwarded to the serv=
er=20
that handles it, even though it came in addressed to the firewall/gateway=
 at=20
$INET_IP.  THEN you SNAT that same packet as it leaves the firewall, so t=
hat=20
the reply from the server will come BACK to the gateway/firewall.  On the=
=20
return trip the SNAT is reversed (so that the packet gets forwarded back =
to=20
the original requesting client) and then the DNAT is reversed (so that th=
e=20
client sees it as returning from $INET_IP instead of the 'private' IP of =
the=20
actual server)

> then later the author has the solution like this:
> iptables -t nat -A POSTROUTING -p tcp --dst $HTTP_IP --dport 80
> -j SNAT  --to-source $LAN_IP
>
> my quesion: the source change to $LAN_IP during SNAT. it seems
> to me that when the webserver replies the request, it will reply
> to the $LAN_IP. how does it  go back to the firewall machine so
> it can be alterd?

For this to work, $LAN_IP is the IP on the LAN for the firewall/gateway, =
as=20
opposed to $INET_IP being the IP on the internet for the firewall/gateway=
=2E =20
It's NOT the IP of $LAN_BOX.  This is the SNAT mentioned above that ensur=
es=20
that the reply DOES go back to the firewall machine.

> sorry that is a lot questions. sincerely thanks for your help.

Not really, just three parts of the same overall question.  :^)  I hope I=
've=20
helped, and you are certainly welcome.

j


