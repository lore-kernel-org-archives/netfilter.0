From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: RE: beginner, trying to use iptables.
Date: Thu, 29 Jan 2004 15:50:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075387830.4048.38.camel@elendil.intranet.cartel-securite.net>
References: <66CE949D18BCB249ABE8D9AF48C4F1CE777B06@helios.clb.tcfr.thales>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <66CE949D18BCB249ABE8D9AF48C4F1CE777B06@helios.clb.tcfr.thales>
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
To: Christophe.LINDHEIMER@fr.thalesgroup.com
Cc: netfilter@lists.netfilter.org

Le jeu 29/01/2004 =E0 14:58, Christophe.LINDHEIMER@fr.thalesgroup.com a
=E9crit :
> So at the end I have go something looking like this :
> @1  <--------> @2 | @3 <-------> @4
> with @1 =3D 128.0.0.2, @4 =3D 128.0.0.10, @2 & @3 can be anything.
> @1 & @4 must be on the same subnet ( the computer in the middle must be
> transparent and can be removed )
> So it is a kind of firewall but a bit special.

You have to set a transparent firewall up, using bridging.

See http://ebtables.sourceforge.net/

Principle is quite simple :

@1 ------- [eth0/eth1] ------ @2
	       br0

Once the patch is applied, you have to build your kernel with bridging
and bridge firewalling support (see networking section). Then, set your
box as a bridge :

	brctl addbr br0
	ifconfig eth0 up
	ifconfig eth1 up
	brctl addif br0 eth0
	brctl addif br0 eth1
	ifconfig br0 up

Now, your box behave like a bridge (i.e. an ethernet switch with 2
ports), forwarding frames between eth0 and eth1. Forwarded frames
payload, if IP, will be visible into Netfilter FORWARD chain, what
allows you to filter IP stuff, just as usual.

NB : . non-IP traffic will be allowed unless you use ebtables to block
       it
     . if you want to reach your box from network, just assign an IP to
       br0 interface

There's some documentation at http://ebtables.sourceforge.net/ that
explains this kind of setups.

> I thought that with iptables, I could say : the destination of any pack=
ets
> entering in eth0 ( with no care of the IP @ ) is transformed into @2 (u=
sing
> DNAT for example ), then @2 replies and I retransform the source @. ( i=
sn't
> a proxy working like this ?? )

A proxy works at application layer, here you'll have to work either at
link or network layer.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

