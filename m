From: "Piszcz, Justin Michael" <justin.piszcz@mitretek.org>
Subject: RE: traceroute
Date: Wed, 30 Jun 2004 11:10:48 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2E314DE03538984BA5634F12115B3A4E62E80A@email1.mitretek.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: netfilter <netfilter@lists.netfilter.org>

ICMP is "allowed" when you -I INPUT ESTABLISHED,RELATED.

You do not have to allow it explicitly (ie: allow icmp so other machines
can ping your machine).

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
Sent: Wednesday, June 30, 2004 10:58 AM
To: netfilter
Subject: Re: traceroute

On Wednesday 30 June 2004 3:34 pm, Piszcz, Justin Michael wrote:

> -----Original Message-----
> From: Peter Marshall [mailto:peter.marshall@caris.com]
> Sent: Wednesday, June 30, 2004 10:25 AM
> To: Piszcz, Justin Michael; netfilter
> Subject: Re: traceroute
>
> I don't get anything (except the name lookup) from traceroute.
>
> Below are the relavant rules .... tracert is the ip of the box I am
> trying to traceroute form.
> The Ip of that box is an internet routable ip addess.
>
> $IPT -A FORWARD -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
> $IPT -A FORWARD -p UDP -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> $IPT -A FORWARD -s <tracert box> -o eth1 -j rh-net
> $IPT -A FORWARD -d <tracert box -i eth1 -j net-rh
>
> $IPT -A rh-net -s <tracert box> -j ACCEPT
> $IPT -A net-rh -p UDP -m state --state ESTABLISHED,RELATED -j ACCEPT

You should allow ICMP packets through your system.

You should certainly allow ICMP through if you want traceroute to work,
and=20
you should generally allow ICMP if you want many other things to work.
If=20
you want to block certain types of ICMP, that's fine (many people do),
but=20
don't block all ICMP.

Traceroute works by sending either ICMP "ping" (echo request) packets,
or UDP=20
packets to high port numbers (which are assumed not to be listening),=20
depending on the Operating System of the client doing the traceroute.
In=20
both cases the important response is an ICMP TTL exceeded packet, which=20
contains the IP address of the router where TTL became =3D=3D 0.

Remember that firewalling can be a dangerous topic - if you block things
you=20
don't understand, and therefore don't know that you should allow, some
things=20
will break.

Regards,

Antony.

--=20
Anything that improbable is effectively impossible.

 - Murray Gell-Mann, Nobel Prizewinner in Physics

                                                     Please reply to the
list;
                                                           please don't
CC me.



