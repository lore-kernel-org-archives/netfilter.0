From: "Marius" <netfilter@marius83.de>
Subject: AW: Problem getting connection to terminal Server behind router
	andfirewall
Date: Wed, 19 Oct 2005 18:55:13 +0200
Message-ID: <20051019165521.1A7C0D7DD@dd2824.kasserver.com>
References: <201E6F5AC48C274996A5AD8304FAEF860BFE00@p001ex03.porta.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <201E6F5AC48C274996A5AD8304FAEF860BFE00@p001ex03.porta.local>
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
To: "'Baake, Matthias'" <m.baake@porta.de>
Cc: "'Netfilter (E-Mail)'" <netfilter@lists.netfilter.org>

=20
Hi,

the gateway on all Win machines in LAN is eth1 (192.168.1.100), DNS is =
the
router address 192.168.178.1.
Inside the LAN (192.168.1.0/24) everything (including Terminal-Server) =
works
fine.
I put the firewall-script to http://www.marius83.de/firewall.txt. The
out-commentet lines are different
ways I tried out.

Thanks for your help so far,
Marius


-----Urspr=FCngliche Nachricht-----
Von: Baake, Matthias [mailto:m.baake@porta.de]=20
Gesendet: Mittwoch, 19. Oktober 2005 17:48
An: Marius
Cc: Netfilter (E-Mail)
Betreff: RE: Problem getting connection to terminal Server behind router
andfirewall

Hi,

missing/wrong default gateway on the win machine?
a post of your used firewall rules would be helpful

greets

/matthias

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of Marius
> Sent: Wednesday, October 19, 2005 5:43 PM
> To: netfilter@lists.netfilter.org
> Subject: Problem getting connection to terminal Server behind router=20
> andfirewall
>=20
>=20
> Hello,
>=20
> I have got following problem and would be happy about every hint you=20
> can give to me:
>=20
> Infrastructure:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> A router (AVM Fritz!Box Phone 7050 connected via Broadband-Access to=20
> the WWW, using an dynamic IP adress. It's neccesarry to use this=20
> Router because it includes a VoIP-telephone switchboard with=20
> QOS-Features.
> External Adress: dynamic (WAN)
> Internal Adress: 192.168.178.1
>=20
> The dynamic Address is published through a dyndns-Account
>=20
> After the router there is my firewall, (SuSE 9.3, iptables).=20
> The firewall is
> based on a "harry's script" which was a little bit modified.
> eth0: 192.168.178.100 (connected to the router)
> eth1: 192.168.1.100   (connected to my LAN)
>=20
> With IP 192.168.1.101 there is a Microsoft Windows SBS Server
> 2003 including
> Terminal-Server Service reached via MS-Remote-Desktop (Port 3389)
>=20
> ToDo:
> =3D=3D=3D=3D=3D
>=20
> The Terminal-Server should be reached from the www.
>=20
> This works fine as long as I don't have the Linux-Server in my=20
> network.
> If I change the MS SBS-IP to 192.168.178.101 for example and configure =

> the router to forward all TCP 3389 requests to 192.178.101, everything =

> works as it should.
>=20
> Problem:
> =3D=3D=3D=3D=3D=3D=3D=3D
>=20
> After the Linux-Firewall is between router an MS SBS, Terminal-Server=20
> access is not possible (all client services HTTP, HTTPS, POP3, IMAP... =

> work fine)
>=20
> I tried to ways:
>=20
> 1. Config the router to forward all TCP 3899 requests to the firewall
> (192.168.178.100) On the firewall i put the setting:=20
> iptables -t nat PREROUTING -p tcp --dport 3389 -j DNAT --to
> 192.168.1.101:3389 and (another try) iptables -t nat PREROUTING -p tcp =

> --dport 3389 -j DNAT --to 192.168.1.101
>=20
> 2. Config the outer to forward all TCP requests directly to MS SBS
> (192.168.1.101)
> Firewall:
> iptables -A FORWARD -p tcp --dport 3389 -j ACCEPT
>=20
> On both way's a tried to include Source/Destination-IP,=20
> incoming/outgoing devices, but without any positive results. Which way =

> I should follow generally?
>=20
> There get some packages through the firewall using both solutions (I=20
> can see an incoming connections in the Terminal-Servers log files) but =

> no correct connection can be established.
>=20
> Thanks for your help
>=20
>=20
>=20
>=20




