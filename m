From: Christophe.LINDHEIMER@fr.thalesgroup.com
Subject: RE: beginner, trying to use iptables.
Date: Thu, 29 Jan 2004 14:58:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <66CE949D18BCB249ABE8D9AF48C4F1CE777B06@helios.clb.tcfr.thales>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: blancher@cartel-securite.fr
Cc: netfilter@lists.netfilter.org

Well, my case is a bit special.

In fact I have two computers : 128.0.0.2 & 128.0.0.10

Thoses machines are going to connect and exchange data using TCP/IP.

The problem is that I must able to forbid some packets to reach the
destination.
To choose if a TCP/IP message must be forward to the next machine I =
must
analyse the contents of the data.

To do that , I add a computer with two ethernet cards inside.

So at the end I have go something looking like this :

@1  <--------> @2 | @3 <-------> @4

with @1 =3D 128.0.0.2, @4 =3D 128.0.0.10, @2 & @3 can be anything.

@1 & @4 must be on the same subnet ( the computer in the middle must be
transparent and can be removed )

So it is a kind of firewall but a bit special.

So for example when @1 pings @4, I would that like that @2 responds.
And when @1 tries to make a connection with @4, I would like to do the
connection with @2.
Then I just have to analyse the data sent and I choose to send them or =
not
to @4.

I thought that with iptables, I could say : the destination of any =
packets
entering in eth0 ( with no care of the IP @ ) is transformed into @2 =
(using
DNAT for example ), then @2 replies and I retransform the source @. ( =
isn't
a proxy working like this ?? )

Chris



> -----Message d'origine-----
> De : Cedric Blancher [mailto:blancher@cartel-securite.fr]
> Envoy=E9 : jeudi 29 janvier 2004 14:38
> =C0 : Christophe.LINDHEIMER@fr.thalesgroup.com
> Cc : netfilter@lists.netfilter.org
> Objet : Re: beginner, trying to use iptables.
>=20
>=20
> Le jeu 29/01/2004 =E0 13:59, Christophe.LINDHEIMER@fr.thalesgroup.com =
a
> =E9crit :
> > My computer that is running iptables is 128.0.0.1
> > An other computer has @ 128.0.0.2.
> > I try to followings commands :
> > iptables -t nat -A PREROUTING -i eth0 -j LOG
> > iptables -t mangle -A PREROUTING -i eth0 -j LOG
> > iptables -A INPUT -i eth0 -j LOG
> > if I ping 128.0.0.1 from 128.0.0.2, I see the packets in the =
syslog.
> > if I ping 128.0.0.10 ( for example ) from 128.0.0.2, there=20
> is nothing in the
> > syslog.
> > Is it normal ?
>=20
> Euh... Well...
> I do not have an idea of your general network setup, but I do not see
> why (according to the fact that your rules are issued on 128.0.0.1) a
> packet from 128.0.0.2 to 128.0.0.10 should get logged by 128.0.0.1...
>=20
> > I thought that I was going to see all the packets in the=20
> NAT and not only
> > the packets with the right IP @.
>=20
> All the packets _received_ by the box.
>=20
> > Missing something ???
>=20
> If I'm right, you're missing the fact that packets from 128.0.0.2 to
> 128.0.0.10 are not seen by 128.0.0.1, so cannot get logged there.
>=20
> But, again, you should explain your LAN setup for us to be sure we
> discuss the same situation.
>=20
> --=20
> http://www.netexit.com/~sid/
> PGP KeyID: 157E98EE FingerPrint:=20
> FA62226DA9E72FA8AECAA240008B480E157E98EE
> >> Hi! I'm your friendly neighbourhood signature virus.
> >> Copy me to your signature file and help me spread!=20
>=20

