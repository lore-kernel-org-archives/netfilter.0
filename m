From: Yasuyuki KOZAKAI <yasuyuki.kozakai@toshiba.co.jp>
Subject: Re: patches against 2.6.21 and a small script
Date: Tue, 26 Jun 2007 15:52:56 +0900 (JST)
Message-ID: <200706260652.l5Q6qvKh018982@toshiba.co.jp>
References: <467FF58A.1010000@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <467FF58A.1010000@freemail.hu>
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
Content-Type: Text/Plain; charset="iso-8859-1"
To: swifty@freemail.hu
Cc: netfilter@lists.netfilter.org


Hi,

From: G=E1sp=E1r Lajos <swifty@freemail.hu>
Date: Mon, 25 Jun 2007 19:04:10 +0200

> Hi list!
> =

> I found that many pom patches are out of date so I "upgraded" them...=

> And also attached a small diff script. (Just rename the old source to=
 =

> .orig and you will get all of those modifications you did if you run =

> this script.)

Thanks, please post such patches to netfilter-devel list from next time=
.=


> --- ./patchlets/ipv4options/linux-2.6/net/ipv4/netfilter/ipt_ipv4opti=
ons.c.orig	2007-05-02 15:32:49.000000000 +0200
> +++ ./patchlets/ipv4options/linux-2.6/net/ipv4/netfilter/ipt_ipv4opti=
ons.c	2007-06-25 18:40:25.000000000 +0200
> @@ -154,8 +154,16 @@
>  	return 1;
>  }
>  =

> +#if LINUX_VERSION_CODE >=3D KERNEL_VERSION(2,6,21)
> +static struct xt_match ipv4options_match =3D { =

> +#else
>  static struct ipt_match ipv4options_match =3D { =

> +#endif

You don't need to support old kernel in one file.
Please assume that you are writing for only the recent kernel.

> --- ./patchlets/connlimit/linux-2.6/net/ipv4/netfilter/ipt_connlimit.=
c.orig	2007-03-06 14:47:13.000000000 +0100
> +++ ./patchlets/connlimit/linux-2.6/net/ipv4/netfilter/ipt_connlimit.=
c	2007-06-25 18:32:06.000000000 +0200

Jan Engelhardt is improving connlimit match. Please refer
netfilter-devel archive in detail.

-- Yasuyuki Kozakai

