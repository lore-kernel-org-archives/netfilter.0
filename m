From: Kurt Yoder <ktynetfilter@richard-group.com>
Subject: Re: iptables returns "module is wrong version"
Date: Fri, 28 Jan 2005 10:24:52 -0500
Message-ID: <r02010100-1037-C21332F2714011D998C6000A95DF6F1E@[192.168.1.112]>
References: <1106769471.25216.1.camel@nostromo.bgsecm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1106769471.25216.1.camel@nostromo.bgsecm.com>
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
Content-Type: text/plain; charset="utf-8"
To: Jose Maria Lopez <jkerouac@bgsec.com>
Cc: netfilter@lists.netfilter.org

> El mi=C3=A9, 26 de 01 de 2005 a las 18:53, Kurt Yoder escribi=C3=B3:
> > Hi list
> >=20
> > I'm getting an error when running iptables:
> >=20
> > root@ns2:~# iptables -L -v
> > iptables v1.2.11: can't initialize iptables table `filter': Module
is
> > wrong version
> > Perhaps iptables or your kernel needs to be upgraded.
> >=20
> >=20

<snipped>

> > I'm running kernel 2.6.8 and iptables 1.2.11. I'm using Debian
packages
> > for the kernel and iptables. Anyone encountered this before and been
> > able to get around it?
>=20
> You probably don't have your kernel modules and iptables synced.
> They both have to be compiled with the same patches of
> patch-o-matic or it won't work.
>=20
> Regards.
>=20

How do I figure out which patches were applied to the iptables module?

I installed iptables from source with no patches but am still getting
the same error message.

