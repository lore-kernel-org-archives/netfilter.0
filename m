From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Changing the desitnation (DNAT) locally
Date: Tue, 10 Feb 2004 15:47:55 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5679158@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Al Sparks <data345@yahoo.com>, netfilter@lists.netfilter.org

When you locally generate packets, the netfilter core doesn't go through
PREROUTING,INPUT, or FORWARD before reaching their destinations. You
will have to add the same rule to the -t nat -A OUTPUT chain in order to
get the desired response from the local machine.

Al Sparks wrote:
> I'm new to netfilter.
>=20
> I've been going through the HOW-TO's on NAT, and I want to change the
> destination on packets based on it's destination.=20
>=20
> I set up a test, the idea being, I want to change the destination of
> a packet from 192.168.100.99 to 127.0.0.5.  The packet will be
> generated locally. =20
>=20
> The first thing I did, is I set up my route tables so that
> 192.168.100.99  127.0.0.5   255.255.255.255 UGH 0      0        0 lo
> 10.254.223.0    *           255.255.255.0   U   0      0        0 eth0
> 127.0.0.0       *           255.0.0.0     U     0      0        0 lo
> default         whatever    0.0.0.0       UG    0      0        0 eth0
>=20
>=20
>=20
> So I have 192.168.100.99 routed to my local interface, "lo".
>=20
>=20
> Here's my NAT listing:
> # iptables -t nat -L
> Chain PREROUTING (policy ACCEPT)
> target     prot opt source               destination
> DNAT       all  --  anywhere             192.168.100.99   =20
> to:127.0.0.5=20
>=20
> Chain POSTROUTING (policy ACCEPT)
> target     prot opt source               destination
>=20
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
>=20
>=20
>=20
> To test it, I telnet to the SSH port with
>    telnet 127.0.0.5 22
> which gets me a connection, but
>    telnet 192.168.100.99 22
> just shows a SYN_SENT when I check with netstat.
>=20
> So, is what I'm doing doable?  If so, how do I do it?
>    =3D=3D=3D Al

