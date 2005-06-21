From: Feizhou <feizhou@linuxmail.org>
Subject: Re: iptables leaking blocked ip addresses.
Date: Wed, 22 Jun 2005 00:52:16 +0800
Message-ID: <42B845C0.70101@linuxmail.org>
References: <49bf7d7050620083448c1dee9@mail.gmail.com>	<200506201055.25861.rob0@gmx.co.uk>
	<42B7DF8D.3060304@linuxmail.org>
	<1119364294.4923.17.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1119364294.4923.17.camel@anduril.intranet.cartel-securite.net>
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
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org, /dev/rob0 <rob0@gmx.co.uk>

Cedric Blancher wrote:
> Le mardi 21 juin 2005 =E0 17:36 +0800, Feizhou a =E9crit :
>=20
>>netfilter's conntrack module sucks in performance and at the same time=20
>>is not fully stateful.
>=20
>=20
> The last serious paper I could read about performances comparison was
> published on pf website long ago and desmonstrated a clear advantage fo=
r
> Netfilter against pf or ipf.
>=20
> 	http://www.benzedrine.cx/pf-paper.html

Yes...when NOT doing stateful. I have no arguments for netfilter's=20
filtering performance. Filtering barely adds overhead for my boxes.=20
Loading the conntrack module however had some painful effects...
>=20
> However, at this time, Netfilter was indeed not fully stateful. But it'=
s
> no longer the case as Netfilter now implements TCP window tracking in
> stock kernels.

Ah, sorry, I knew that this was brought up some time ago but I did not=20
the end result. I take back my not fully stateful statement.
>=20
> If you know good comparisons published, I wuold be happy to read them.
>=20

I will try a Linux based bridge setup in place of our OpenBSD firewall=20
now that we can get some equivalency in function. Or just go stateless.=20
Any suggestions on what kernel version to use? A Fedora errata in case I=20
install Fedora Core 3/4? Or a stock Linux kernel?

