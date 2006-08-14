From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: issue with 'gre' over nat
Date: Mon, 14 Aug 2006 19:13:58 +0200
Message-ID: <44E0AF56.6080102@plouf.fr.eu.org>
References: <OF9E9DDECA.67360F0D-ON832571C7.004F26DB-832571C7.005F0D4F@powers.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <OF9E9DDECA.67360F0D-ON832571C7.004F26DB-832571C7.005F0D4F@powers.com.br>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

thiago@powers.com.br a =E9crit :
>=20
> nated boxes -> iptables gateway -> internet -> vpn server (runs pptp, a=
nd=20
> has iptables also)
>=20
> Note:1) allways trying one connection at time, 2) connection tracking=20
> module is loaded
>=20
> I can establish vpn connections (and acctually make use of it) with the=
=20
> remote vpn server many times, when the requests are originated from the=
=20
> same box (behind nat); if another computer behind this same nat tries t=
o=20
> connect this vpn server, the tunnel doesn't come up.

Have you tried with the PPTP conntrack and NAT modules ip_conntrack_pptp=20
and ip_nat_pptp loaded ?
If your kernel is older than 2.6.14, you may need to patch and compile=20
your kernel with the pptp-conntrack-nat patch from the patch-o-matic-ng=20
(older than patch-o-matic-ng-20060512).

