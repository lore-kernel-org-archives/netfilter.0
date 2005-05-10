From: jonathan <support-squid@bfinance.fr>
Subject: Re: squid + clamp-mss-to-pmtu
Date: Tue, 10 May 2005 17:55:03 +0200
Message-ID: <1115740503.2934.3.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Le jeudi 05 mai 2005 =E0 06:32 -0400, Alistair Tonner a =E9crit :
> On May 4, 2005 11:09 am, jonathan wrote:
> > Hi,
> > I have a problem with squid and iptables.
> > I have to use "TCPMSS --clamp-mss-to-pmtu" to adapt the mtu with the
ISP
> > requirement, but since I have installed the squid proxy, it seems
like
> > the iptables chains below doesn't work.
>=20
>       I doubt that squid 'broke' iptables mss clamp.
> >
> > $iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN /
> > -j TCPMSS --clamp-mss-to-pmtu
> >
> > $iptables -A OUTPUT -p tcp --tcp-flags SYN,RST SYN /
> > -j TCPMSS --clamp-mss-to-pmtu
> >
> > Some websites still are unaccessible.
>=20
>       You are doing the clamp in both FORWARD and OUTPUT.  This is a
good idea on=20
> systems that require this function.  However since we don't know the
flow on=20
> your system we can't offer much in the way of advice.
>=20
>       Please let us know the following:
>       1) what is the basic layout of your network=20

scheme of the network :

clients (win2000 and linux)
  |
  |
iptables+squid+advanced routing (same machine)
  |   |
  |   |
2 differents ISPs

>       2) where are the systems initiating the failed connections
located on that=20
> network

sorry, i don't understand your question ...

>       3) where is squid on that network?

squid is on the same server than the iptables firewall (between clients
and the Internet)
>       4) what are you doing to get connections to go through squid?

Squid is configurated as transparent proxy, only the gateway IP address
is configurated on the clients. (nothing on the browsers)

>       5) what other rules are there?
classical rules are configurated, NAT for the local network... and
filtering rules for accessing typical ports (DROP INPUT AND FORWARD
setting by default).

routing configuration makes some marked packets going through ISP1 and
other marked packet through ISP2.

>       6) what are the tcp_ecn settings on the firewall (I'd suspect
ecn before=20
> anything else since there are so many b0rken firewalls out there that
don't=20
> understand it)
the tcp_ecn is switch to "0".

>       7) what is meant by inaccessible? what functions of squid might
affect this?
>=20
it means that mozilla browser write the state "waiting for..." until the
timeout. Sometimes, it take a lot of time to display the website writing
the state " transferring data from ...", and the website appears several
minutes later or never appears !
>       8) Are you absolutely sure you checked to make sure tcp_ecn is
off?
>          Completely?
>=20
yes :
if [ -e /proc/sys/net/ipv4/tcp_ecn ]; \=20
then echo 0 > /proc/sys/net/ipv4/tcp_ecn; fi

>       Alistair Tonner
>      =20

from now, I am not sure it's a mtu / mss problem ...

I've noticed that squid's log display "TCP_NEGATIVE_HIT/404" many times
( i suppose it's normal on some websites), but it seems like squid block
on this "error" message, trying to get a 2xx HTTP return code or
something like this. Is it possible ?
> >
> > Is there a way to make it work?
> >
> > thanks
>=20




