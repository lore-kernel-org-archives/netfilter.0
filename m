From: "Derick Anderson" <danderson@vikus.com>
Subject: Re: iptables spof address problem
Date: Wed, 28 Sep 2005 17:13:24 -0400
Message-ID: <E656E2CC1C5AEB42ACB00EB83122C7742E2EBE@farmer.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

=20
Responses inline.

> Hello everyone
>=20
> I have simple question.
>=20
> Lets assume that we have Linux with IP=3D10.0.0.2 with iptables=20
> and it is logging all incomming ssh connection. Log file=20
> contains both IP and MAC addresses of the computers which=20
> bind to this service.
> Lets assume that we have another PC connected into LAN with=20
> IP=3D10.0.0.100.
>=20
> Attacker with IP  =3D 10.0.0.200 runs:
> hping2  -S --spoof  10.0.0.100 -p 22 --faster 10.0.0.2  -=20
> which will cause DoS of SSH service on 10.0.0.2
>=20
> Netfilter logs all incomming on 22 port traffic. It shows=20
> that connections come from IP 10.0.0.100 and it shows real=20
> MAC address of this computer (10.0.0.100) instead of MAC=20
> address of attackers computer (IP 10.0.0.200).
>=20
> So result is that we think that real attacker is computer=20
> with IP 10.0.0.100

I've never used hping before, but I believe when an IP address is
spoofed correctly this is the expected behavior. Bits are bits.=20

> Moreover.
>=20
> Lest assume that spoofed  address is IP which is not assignet=20
> in the local network. Netfilter logs incomming traffic but it=20
> shows MAC address unknown or completely unpredictable=20
> (Windows shows all 0-ros, Linux 12 bytes long MAC address).
>=20
> Result is that we completely don't know who is the attacker,=20
> cannot track him down even we have registered MAC addresses=20
> of all computers in local network. =20

MAC addresses are Layer 2. Layer 2 does not route, so at best you see
the MAC address of the router. I'm not sure what you mean by all
"0-ros"... I believe 00:00:00:00:00:00 is the "nothing" MAC address
similar to 0.0.0.0 for IP (generally seen when a computer is requesting
DHCP). ff:ff:ff:ff:ff:ff is used in ARP queries but I don't recall all
0's being used.

> It works like this with FC4, also have this problem on RedHat 3.0.
>=20
> How can I make netfilter to log MAC address of the attackers=20
> computer, not this one which is resolved by TCP/IP stack ? Is=20
> it possible?
>=20
> Regards
>=20
> PiotrH

You can't. Netfilter uses the kernel stack like every other program
(someone correct me if I'm wrong). You could try using ARPWatch to help
you monitor your network but even then I believe a successful MAC/IP
spoof will go unnoticed.

Derick Anderson

