From: "Edgar Estrada Lopez" <estradaedgar@hotmail.com>
Subject: Re: Selective Masquerading
Date: Sun, 25 Apr 2004 20:06:30 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY8-F46ylJc0xvlUQ900035531@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Anthony:
>
>On Saturday 24 April 2004 5:14 pm, Edgar Estrada Lopez wrote:
>
> > HI guys:
> >
> > I have a DSL @ 1mb, and another one @ 256kbps
> >
> > While giving a deep thought on why I got the 2 dsl, the answer is=20
>simple:
> > So I could have fast downloads, and fast web browsing also.
> >
> > So I was thinking: is there a way to masquerade  / direct all web=20
>browsing
> > to the 256dsl, and leave the rest of the communications (higher ports) =

>to
> > the 1 mbps line?
>
>I'm sure you can do this either with iproute2 on its own, or if not then
>certainly by routing packets based on a MARK, and MARKing them in netfilter
>based on destination port number.
>

I've already read / tried all LARTC split-access howto -- no luck.

I can even have both interfaces up and runninng -- but my default route mus=
t=20
point to only one -- the moment I add the equalized route (ip route add=20
default equalize nexthop xxx.xxx.xxx.xxx via ethx nexthop......) then one o=
f=20
the DSL begins an AWFUL ARP flood, and no more communications occur (pingin=
g=20
to a know host equals 'destination host unreachable').

I haven't tried the MARKing, though.

>However, I have to ask - what sort of traffic are you generating which can=
=20
>use
>a 1Mbps line for "downloads", which is not HTTP?   I realise that you could
>be using FTP, or rsync, however I suspect you mean p2p networking, and you
>should check that this really isn't using TCP port 80 - otherwise there's =

>no
>way of distinguishing the two types of traffic.

Yes, I do mostly FTP - P2P - BT traffic -- all those use differnt ports

>
>Of course the other way to do it would be to use an HTTP proxy such as=20
>Squid
>which has a default route pointing up the 256k DSL, and the default gateway
>for other machines going up the 1M DSL...
>

Haven't tried Squid either ....

What do you suggest? MARKing or Squid ?? I think MARKing would be clearer=20
since it is not a proxy but a routing...

Thank you for your time.

- Ed

_________________________________________________________________
MSN. M=E1s =DAtil Cada D=EDa  http://www.msn.es/intmap/


