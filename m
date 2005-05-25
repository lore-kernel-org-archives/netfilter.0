From: Leonardo <p0q0b0d@gmail.com>
Subject: Re: ICMP frag needed not forwarded to MSQ clients
Date: Wed, 25 May 2005 13:23:07 +0200
Message-ID: <3b1e6f4805052504234918e2e8@mail.gmail.com>
References: <3b1e6f48050525011730fa7e44@mail.gmail.com>
	<200505251112.23022.98111@free.fr>
Reply-To: Leonardo <p0q0b0d@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200505251112.23022.98111@free.fr>
Content-Disposition: inline
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

> Have you tried the TCPMSS target ? I think it have been created to solve =
this
> problem.
>=20
> Brice
>=20

Yes! Of course!

iptables -I FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --set-mss 1400

And it does not work! As far as I understand as man pages say, this is
a workaround if you are *behind* a router that block ICMP frag needed
packets, but this packets *are* received at my routerbox but *NOT*
unmasked&forwarded to the source host.

--=20
Leonardo Arena

