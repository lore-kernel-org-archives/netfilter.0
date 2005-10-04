From: bernin_a@informatik.haw-hamburg.de
Subject: Re: NAT/POSTROUTING rules doesn't match packets
Date: Tue, 4 Oct 2005 11:25:02 GMT
Message-ID: <20051004112502.8B5133C65565@mailgate.informatik.haw-hamburg.de>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-9"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

> Just to make sure, i have compiled kernel 2.4.31 and also switched back to
> =20
> 1.2.11 iptables. But nothing changed. Still the packets don't get SNAT-ed
> and=20
> there has been no hit on SNAT rule for about an hour (packets are sent ev=
er=20
> y ten seconds or so). This only applies to UDP packets.
>=20
> Now i have noticed the same problem on another of my machines. Since its =
not=20
> only me having problems, maybe its some well-hidden bug in the netfilter?
>=20

If so, it has been there for quite a while. I am using kernel 2.4.27 (with
grsecurity patches)... It seems there is only a problem with UDP here, too.=
..=20
Are your machines under heavy load ? We have a constant rate of at least 5 =
mbit
running over this machines...they are not very busy, though.

> As a side note: both routers that are having this problem are diskless=20
> machines with root-over-nfs (mostly R/O) could this be any issue?
>=20

i don't even have nfs compiled in ;-)

> Marek
>=20
>=20

--arne

_________________________________________________
Versendet =FCber Webmail der HAW Hamburg
http://www.haw-hamburg.de/webmail



