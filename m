From: Askar Ali Khan <askarali@gmail.com>
Subject: Re: Virtual interfaces
Date: Wed, 7 Jul 2004 14:27:37 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <a0f69e504070702275db522e6@mail.gmail.com>
References: <200407051642.19090.francesco.chicchiricco@eposse.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407051642.19090.francesco.chicchiricco@eposse.it>
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
To: =?unknown-8bit?q?Dott=2E_Francesco_Chicchiricc=F2?= <francesco.chicchiricco@eposse.it>, netfilter <netfilter@lists.netfilter.org>

Hi Dott

On Mon, 5 Jul 2004 16:42:11 +0200, Dott. Francesco Chicchiricc=F2
<francesco.chicchiricco@eposse.it> wrote:
> Hi,
> after spending some time with iptables and linux virtual interfaces, I've
> decided to ask.
>=20
> I have a Linux BOX acting as a router among different LANs. I'm doing som=
e
> filtering (only ssh traffic coming from a certain MAC addrress can go fro=
m
> one LAN to another, an so on):
>=20
> iptables -t filter -P FORWARD DROP
> iptables -A FORWARD -i eth0 -s 192.168.0.0/24 -p TCP -m mac --mac-source
> $whiskey_MAC -d 192.168.10.0/24 --dport 22 -j ACCEPT
>=20
> With physical interfaces only, all works well. When a try to filter traff=
ic
> between 2 LANs attached to the same physical interface but with 2 differe=
nt
> virtual IPs, it starts messing. Nothing works, I can't even log packets.

Netfilter doesn't allow things like eth0:1 (it won't accept the
colon), so all you do is use the normal interface name (eth0).  =20

Regards
Askar
>=20
> Is that a known bug? Am I just misunderstanding?
> Please help.
> --
> ##################################################################
>=20
> "Computer Science is no more about computers than astronomy
> is about telescopes." (E. W. Dijkstra)
>=20
> Dott. Francesco Chicchiricc=F2
> Amministratore unico
> Tel 3290573276
>=20
> ePOSSE S.r.l.
> Sede operativa: Via dei Marrucini, 11 65127 Pescara
> Tel / FAX 0854503336
> http://www.eposse.it
>=20
> ##################################################################
>=20
>=20
>

