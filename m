From: Christophe.LINDHEIMER@fr.thalesgroup.com
Subject: RE: beginner, trying to use iptables.
Date: Thu, 29 Jan 2004 16:20:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <66CE949D18BCB249ABE8D9AF48C4F1CE777B08@helios.clb.tcfr.thales>
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

Hum, it looks good but when @1 sends data to @2 using TCP/IP,=20
I need to get data in my application running on bridge in order to =
choose if
data must be sent to @2.=20
Meaning that I would like to have for example a TCP/IP socket opened on =
eth0
and getting data before sending the data to @2.
The choice of routing or non routing can't only be done by looking at =
the
packet at the IP level but by analysing contents of a TCP data =
contents.


> -----Message d'origine-----
> De : Cedric Blancher [mailto:blancher@cartel-securite.fr]
> Envoy=E9 : jeudi 29 janvier 2004 15:51
> =C0 : Christophe.LINDHEIMER@fr.thalesgroup.com
> Cc : netfilter@lists.netfilter.org
> Objet : RE: beginner, trying to use iptables.
>=20
>=20
> Le jeu 29/01/2004 =E0 14:58, Christophe.LINDHEIMER@fr.thalesgroup.com =
a
> =E9crit :
> > So at the end I have go something looking like this :
> > @1  <--------> @2 | @3 <-------> @4
> > with @1 =3D 128.0.0.2, @4 =3D 128.0.0.10, @2 & @3 can be anything.
> > @1 & @4 must be on the same subnet ( the computer in the=20
> middle must be
> > transparent and can be removed )
> > So it is a kind of firewall but a bit special.
>=20
> You have to set a transparent firewall up, using bridging.
>=20
> See http://ebtables.sourceforge.net/
>=20
> Principle is quite simple :
>=20
> @1 ------- [eth0/eth1] ------ @2
> 	       br0
>=20
> Once the patch is applied, you have to build your kernel with =
bridging
> and bridge firewalling support (see networking section).=20
> Then, set your
> box as a bridge :
>=20
> 	brctl addbr br0
> 	ifconfig eth0 up
> 	ifconfig eth1 up
> 	brctl addif br0 eth0
> 	brctl addif br0 eth1
> 	ifconfig br0 up
>=20
> Now, your box behave like a bridge (i.e. an ethernet switch with 2
> ports), forwarding frames between eth0 and eth1. Forwarded frames
> payload, if IP, will be visible into Netfilter FORWARD chain, what
> allows you to filter IP stuff, just as usual.
>=20
> NB : . non-IP traffic will be allowed unless you use ebtables to =
block
>        it
>      . if you want to reach your box from network, just=20
> assign an IP to
>        br0 interface
>=20
> There's some documentation at http://ebtables.sourceforge.net/ that
> explains this kind of setups.
>=20
> > I thought that with iptables, I could say : the destination=20
> of any packets
> > entering in eth0 ( with no care of the IP @ ) is=20
> transformed into @2 (using
> > DNAT for example ), then @2 replies and I retransform the=20
> source @. ( isn't
> > a proxy working like this ?? )
>=20
> A proxy works at application layer, here you'll have to work either =
at
> link or network layer.
>=20
> --=20
> http://www.netexit.com/~sid/
> PGP KeyID: 157E98EE FingerPrint:=20
> FA62226DA9E72FA8AECAA240008B480E157E98EE
> >> Hi! I'm your friendly neighbourhood signature virus.
> >> Copy me to your signature file and help me spread!=20
>=20

