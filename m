From: Noman Liaquat <khankhn1@yahoo.com>
Subject: Re: patch-o-matic help
Date: Thu, 22 Dec 2005 22:56:34 -0800 (PST)
Message-ID: <20051223065634.87014.qmail@web35913.mail.mud.yahoo.com>
References: <20051223044928.31767.qmail@web35912.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051223044928.31767.qmail@web35912.mail.mud.yahoo.com>
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
Content-Type: text/plain; charset="windows-1252"
To: Noman Liaquat <khankhn1@yahoo.com>
Cc: netfilter@lists.netfilter.org

Now after compilation of all things. i am getting this
error. what that means my kernel is not compiled
properly or my iptables have some problem



[root@mail iptables-1.3.4]# iptables -A INPUT -p tcp
-m string --string "/bin/sh" -j DROP iptables v1.3.4:
STRING match: You must specify `--algo'
Try `iptables -h' or 'iptables --help' for more
information.

Regards
khan
--- Noman Liaquat <khankhn1@yahoo.com> wrote:

>=20
> I am using kernel
>=20
> Operating system=3DREDHAT ENTERPRISE LINUX#ES
> kernel=3D linux-2.6.14.4
> iptables=3Diptables-1.3.2
>=20
> i downloaded the patch-o-matic
> svn co
>
https://svn.netfilter.org/netfilter/trunk/patch-o-matic-ng
>=20
> i tried 10 times after patching the kernel with
> patch-matic, but getting the same error.=20
>=20
> why
>=20
>
---------------------------------ERROR---------------------------------
> scripts/Makefile.build:51: kbuild:
> net/ipv4/netfilter/Makefile - Usage of export-objs
> is
> obsolete in 2.6. Please fix!
>   CC [M]=20
> net/ipv4/netfilter/ip_conntrack_standalone.o
> In file included from
> include/linux/netfilter_ipv4/ip_conntrack.h:157,
>                  from
> net/ipv4/netfilter/ip_conntrack_standalone.c:34:
>
include/linux/netfilter_ipv4/ip_conntrack_talk.h:7:43:
> linux/netfilter_ipv4/lockhelp.h: No such file or
> directory
> In file included from
> include/linux/netfilter_ipv4/ip_conntrack.h:157,
>                  from
> net/ipv4/netfilter/ip_conntrack_standalone.c:34:
> include/linux/netfilter_ipv4/ip_conntrack_talk.h:10:
> warning: type defaults to `int' in declaration of
> `DECLARE_LOCK_EXTERN'
> include/linux/netfilter_ipv4/ip_conntrack_talk.h:10:
> warning: parameter names (without types) in function
> declaration
> include/linux/netfilter_ipv4/ip_conntrack_talk.h:10:
> warning: data definition has no type or storage
> class
> make[3]: ***
> [net/ipv4/netfilter/ip_conntrack_standalone.o] Error
> 1
> make[2]: *** [net/ipv4/netfilter] Error 2
> make[1]: *** [net/ipv4] Error 2
> make: *** [net] Error 2
>
---------------------------------ERROR---------------------------------
>=20
> Regards
> Khan
>=20
>=20
> 	=09
> __________________________________________=20
> Yahoo! DSL =96 Something to write home about.=20
> Just $16.99/mo. or less.=20
> dsl.yahoo.com=20
>=20
>=20


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around=20
http://mail.yahoo.com=20

