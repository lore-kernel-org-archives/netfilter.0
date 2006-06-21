From: Samuel =?iso-8859-1?Q?D=EDaz_Garc=EDa?= <samueldg@arcoscom.com>
Subject: Re: conntrack patch--o-matic error
Date: Wed, 21 Jun 2006 09:44:37 +0200 (CEST)
Message-ID: <36199.195.55.244.106.1150875877.squirrel@www.arcoscom.com>
References: <9C574B97B5C3F246B6CBAA099C87F42F048770@veles.snt.bg>
Reply-To: samueldg@arcoscom.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9C574B97B5C3F246B6CBAA099C87F42F048770@veles.snt.bg>
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
To: netfilter@lists.netfilter.org

For many months, the patch for "talk" broke the kernel modules compilation
under 2.6.x kernels.

As is writen in some place: "only use patches you really need".

Regards.

--=20
Samuel D=EDaz Garc=EDa
ArcosCom Wireless, S.L.L.

CIF: B11828068
c/ Romero Gago, 19
Arcos de la Frontera
11630 - Cadiz

http://www.arcoscom.com

mailto:samueldg@arcoscom.com
msn: samueldg@arcoscom.com

Tlfn.: 956 70 13 15
Fax:   956 70 34 83


El Mie, 21 de Junio de 2006, 9:10, Tosho Yankov escribi=F3:
>
> I have
> linux-2.6.15.1
> patch-o-matic-ng-20060531
> iptables-1.3.4
>
> while I try to compile kernel with modules for conntrack I have this
> error :
>
> scripts/Makefile.build:51: kbuild: net/ipv4/netfilter/Makefile - Usage
> of export-objs is obsolete in 2.6. Please fix!
>   CC [M]  net/ipv4/netfilter/ip_conntrack_standalone.o
> In file included from include/linux/netfilter_ipv4/ip_conntrack.h:32,
>                  from net/ipv4/netfilter/ip_conntrack_standalone.c:34:
> include/linux/netfilter_ipv4/ip_conntrack_talk.h:7:43:
> linux/netfilter_ipv4/lockhelp.h: No such file or directory In file
> included from include/linux/netfilter_ipv4/ip_conntrack.h:32,
>                  from net/ipv4/netfilter/ip_conntrack_standalone.c:34:
> include/linux/netfilter_ipv4/ip_conntrack_talk.h:10: warning: type
> defaults to `int' in declaration of `DECLARE_LOCK_EXTERN'
> include/linux/netfilter_ipv4/ip_conntrack_talk.h:10: warning: parameter
> names (without types) in function declaration
> include/linux/netfilter_ipv4/ip_conntrack_talk.h:10: warning: data
> definition has no type or storage class
> make[3]: *** [net/ipv4/netfilter/ip_conntrack_standalone.o] Error 1
> make[2]: *** [net/ipv4/netfilter] Error 2
> make[1]: *** [net/ipv4] Error 2
> make: *** [net] Error 2
>
>
> Can anybody help me pleas ? what is wrong and how can a fix it ?
> Thank you, in advanced.
> Tosho Yankov
> Support Engineer
> S&T Bulgaria
> phone: +359 2 965 17 87
> fax: +359 2 975 16 00
> e-mail: t.yankov@snt.bg
> www.snt.bg
>
>



