From: Alexis <alexis@attla.net.ar>
Subject: Re: INCOMPLETE [ 8bytes] with two src addresses!
Date: Fri, 27 Feb 2004 15:41:01 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1077907260.1647.18.camel@pepelui.baicom>
References: <20040227175608.666a0e38.Information-Cascade@ntlworld.com>
	 <1077905409.1644.5.camel@pepelui.baicom>
	 <1077906138.2526.48.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1077906138.2526.48.camel@anduril.intranet.cartel-securite.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: Netfilter <netfilter@lists.netfilter.org>

ok, its my mistake when i said first step, but we have 2 confrontations
here.


in traceroute ttl=3D1 is only for the first packet (thats what i said
about the first step)

icmp info throws code 11 , thats why i assumed this was an traceroute.

but like you said, traceroutes uses icmp or icmp and udp like unix does.

ICMP src and dst addresses are the ones that change at each hop, but the
addresses (at ip) involved in the udp packets are always the same.
(apparently this not happen here)

Ive been reading about magic number, but its not related at all.

so , i dont know what it is.





On Fri, 2004-02-27 at 15:22, Cedric Blancher wrote:
> Le ven 27/02/2004 =C3=A0 19:10, Alexis a =C3=A9crit :
> > at first sight its the first step of a traceroute
>=20
> I don't think so.
> When you traceroute, your first step is your default gateway that sends
> you ICMP TTL exceeded back with an IP within your network. We can see :
>=20
> > SRC=3D216.200.115.66
> > DST=3D80.5.144.39
>=20
> As they do not belong to the same network, it's not the first step, but
> can be a further one.
>=20
> Moreover, usual traceroute tools uses ICMP echo (Windows) or UDP (Unix)
> probes. We have TCP here. BTW, TCP is damn cool to traceroute when you
> target a host with a known opened port (e.g. www.microsoft.com) :)))
--=20
Tus problemas no se pueden resolver en el mismo
nivel mental que ten=C3=ADas cuando los creaste.=20
		Albert Einstein


