From: Shawn <core@enodev.com>
Subject: Re: port 25 & 110 forward
Date: 14 Jul 2003 13:55:34 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1058208934.24132.60.camel@localhost>
References: <091A6DF13847F44395B31658ED61C19C63A449@yellowstone.medclaim.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <091A6DF13847F44395B31658ED61C19C63A449@yellowstone.medclaim.local>
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
To: "Brei, Matt" <mbrei@medclaiminc.com>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Can you telnet to port 25, and does it connect you to your private host?

If so, you have an SMTP issue.

On Mon, 2003-07-14 at 13:43, Brei, Matt wrote:
> I=E2=80=99m trying to forward smtp and pop3 from my router to my mail ser=
ver
> at 10.13.110.1.  I=E2=80=99ve tried both of the following iptables comman=
ds,
> neither has worked.
>=20
> =20
>=20
> $IPTABLES -t nat -A PREROUTING -i eth1 -p tcp --dport 25 -j DNAT --to
> 10.13.110.1
>=20
> $IPTABLES -t nat -A PREROUTING -i eth1 -p tcp --dport 110 -j DNAT --to
> 10.13.110.1
>=20
> $IPTABLES -A FORWARD -p tcp -d 10.13.110.1 --dport 25 -j ACCEPT
>=20
> $IPTABLES -A FORWARD -p tcp -d 10.13.110.1 --dport 110 -j ACCEPT
>=20
> =20
>=20
> =20
>=20
> $IPTABLES -t nat -A PREROUTING -d <public_ip> -p tcp --dport 25 -j
> DNAT --to 10.13.110.1:25
>=20
> $IPTABLES -A FORWARD -p tcp --dport 25 -j ACCEPT
>=20
> $IPTABLES -t nat -A PREROUTING -d <public_ip> -p tcp --dport 110 -j
> DNAT --to 10.13.110.1:110
>=20
> $IPTABLES -A FORWARD -p tcp --dport 110 -j ACCEPT
>=20
> =20
>=20
> The later works great for ftp and http forwards.  Why won=E2=80=99t it wo=
rk
> for 25 and 110?
>=20
> =20
>=20
> eth0=3D 10.13.110.1
>=20
> eth2=3D <public_ip>
>=20
> =20
>=20
> Matt Brei
>=20
> =20
>=20
>=20

