From: Jorge Davila <davila@nicaraguaopensource.com>
Subject: Re: What is wrong ???
Date: Mon, 22 Jan 2007 09:08:32 -0600
Message-ID: <web-4300200@bk3.webmaillogin.com>
References: <45B4977B.8060906@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45B4977B.8060906@freemail.hu>
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
To: =?ISO-8859-2?Q?G=E1sp=E1r?= Lajos <swifty@freemail.hu>, Netfilter IPtableMailinglist <netfilter@lists.netfilter.org>

Well, I don't know if this post will help you but I found some problems=20
compiling the kernel in the 2.6 series. My solution was install the=20
compatibility package for gcc 3.2 (the actual version (in my system) is=20
4.1.1 - for gcc - and then compile using gcc 3.2.

Hope this helps.

Jorge Davila.

On Mon, 22 Jan 2007 11:52:43 +0100
  G=E1sp=E1r Lajos <swifty@freemail.hu> wrote:
> Hi list,
>=20
> Why do I get these errors when I compile my new kernel ???
>=20
> net/ipv4/netfilter/ipt_ipv4options.c:161: warning: initialization from=20
>incompatible pointer type
>=20
> net/ipv4/netfilter/ipt_IPV4OPTSSTRIP.c: In function `target':
> net/ipv4/netfilter/ipt_IPV4OPTSSTRIP.c:33: warning: implicit declaratio=
n=20
>of function `skb_ip_make_writable'
> net/ipv4/netfilter/ipt_IPV4OPTSSTRIP.c: At top level:
> net/ipv4/netfilter/ipt_IPV4OPTSSTRIP.c:72: warning: initialization from=
=20
>incompatible pointer type
> net/ipv4/netfilter/ipt_IPV4OPTSSTRIP.c:73: warning: initialization from=
=20
>incompatible pointer type
>=20
> WARNING: "skb_ip_make_writable" [net/ipv4/netfilter/ipt_IPV4OPTSSTRIP.k=
o]=20
>undefined!
> make[2]: *** [__modpost] Error 1
> make[1]: *** [modules] Error 2
> make[1]: Leaving directory `/usr/src/linux-2.6.19.2'
> make: *** [debian/stamp-build-kernel] Error 2
>=20
>=20
> kernel: 2.6.19.2
> iptables: 1.3.7
> POM-ng: 20070121
>=20
> Swifty
>=20

Jorge Isaac Davila Lopez
Nicaragua Open Source
davila@nicaraguaopensource.com

