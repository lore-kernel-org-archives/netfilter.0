From: Toby DiPasquale <codeslinger@gmail.com>
Subject: Re: ipset compilation fails on kernel 2.6.13
Date: Wed, 7 Sep 2005 13:03:52 -0400
Message-ID: <876ef97a0509071003d9fe3c8@mail.gmail.com>
References: <431F10C7.7020009@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <431F10C7.7020009@free.fr>
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
Content-Type: text/plain; charset="iso-8859-1"
To: tedemo <tedemo@free.fr>
Cc: netfilter@lists.netfilter.org

On 9/7/05, tedemo <tedemo@free.fr> wrote:
> Hello,
>=20
> Using sources found on http://ipset.netfilter.org/install.html, and also
> the latest iptables & pom-ng, I cannot get ipset to compile without error=
s :
>=20
>   CC [M]  net/ipv4/netfilter/ip_set.o
> net/ipv4/netfilter/ip_set.c:35: attention : type defaults to `int' in
> declaration of `DECLARE_RWLOCK'
> net/ipv4/netfilter/ip_set.c:35: attention : noms de param=E8tres (sans
> type) dans la d=E9claration de fonction

It would appear that ipset was not cleaned up to remove use of the
macros that were in include/linux/netfilter_ipv4/lockhelp.h, which was
removed in the 2.6.13 release. Check out an old copy of lockhelp.h for
help in converting the failing macros.

--=20
Toby DiPasquale
0x636f6465736c696e67657240676d61696c2e636f6d

