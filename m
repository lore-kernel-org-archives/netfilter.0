From: "nano bug" <linnewbye@gmail.com>
Subject: Re: contrack-tools compile error
Date: Mon, 9 Jul 2007 17:55:45 +0300
Message-ID: <d39c36500707090755p38da5f0cofdd5586a0ceb4102@mail.gmail.com>
References: <d39c36500707090721x4db02d68n9d51f3d0de1fd772@mail.gmail.com>
	<4692457F.7080306@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=efzvFi+azzAI27VqFhKhsqyIy+93xxpX+uSRVWO9dsbUZJJwj1dOBuTpEX4vfaAng28hubQMXwqwXQRzFx+70OoGOiT61qdGU0egl4/o9ed6BsXJ7fQyqTvEx1qNyxaGGnB16ZS0KZPvYsr7wIlJoKctL+icmBO2Q+NRkRyBgzw=
In-Reply-To: <4692457F.7080306@netfilter.org>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@lists.netfilter.org

Thanks, that helped.

Regards

On 7/9/07, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> nano bug wrote:
> > Hello,
> >
> > I'm trying to compile contrack-tools 0.9.4 and I get the following erro=
r :
> >
> >
> > Making all in extensions
> > make[1]: Entering directory `/root/workspace/conntrack-tools-0.9.4/exte=
nsions'
> > make[1]: Nothing to be done for `all'.
> > make[1]: Leaving directory `/root/workspace/conntrack-tools-0.9.4/exten=
sions'
> > Making all in src
> > make[1]: Entering directory `/root/workspace/conntrack-tools-0.9.4/src'
> > if gcc -DPACKAGE_NAME=3D\"conntrack
> > -tools\" -DPACKAGE_TARNAME=3D\"conntrack-tools\" -DPACKAGE_VERSION=3D\"
> > 0.9.4\" -DPACKAGE_STRING=3D\"conntrack-tools\ 0.9.4\"
> > -DPACKAGE_BUGREPORT=3D\"pablo@netfilter.org\"
> > -DPACKAGE=3D\"conntrack-tools\" -DVERSION=3D\"0.9.4\" -DSTDC_HEADERS=3D=
1
> > -DHAVE_SYS_TYPES_H=3D1 -DHAVE_SYS_STAT_H=3D1 -DHAVE_STDLIB_H=3D1
> > -DHAVE_STRING_H=3D1 -DHAVE_MEMORY_H=3D1 -DHAVE_STRINGS_H=3D1
> > -DHAVE_INTTYPES_H=3D1 -DHAVE_STDINT_H=3D1 -DHAVE_UNISTD_H=3D1
> > -DHAVE_DLFCN_H=3D1 -DYYTEXT_POINTER=3D1 -DHAVE_LINUX_CAPABILITY_H=3D1
> > -DHAVE_LIBNFNETLINK=3D1 -DHAVE_LIBNETFILTER_CONNTRACK=3D1
> > -DHAVE_LIBPTHREAD=3D1 -DHAVE_ARPA_INET_H=3D1 -DHAVE_INET_PTON=3D1
> > -DHAVE_INET_PTON_IPV6=3D1 -I. -I.  -I../include    -g -O2 -MT proxy.o
> > -MD -MP -MF ".deps/proxy.Tpo" \
> >           -c -o proxy.o `test -f 'proxy.c' || echo './'`proxy.c; \
> >         then mv -f ".deps/proxy.Tpo" ".deps/proxy.Po"; \
> >         else rm -f ".deps/proxy.Tpo"; exit 1; \
> >         fi
> > In file included from /usr/include/sys/uio.h:24,
> >                  from /usr/include/sys/socket.h:27,
> >                  from /usr/local/include/libnfnetlink/libnfnetlink.h:19=
,
> >                  from  proxy.c:19:
> > /usr/include/sys/types.h:62: error: conflicting types for 'dev_t'
> > /usr/include/linux/types.h:22: error: previous declaration of 'dev_t' w=
as here
> > /usr/include/sys/types.h:67: error: conflicting types for 'gid_t'
> > /usr/include/linux/types.h:54: error: previous declaration of 'gid_t' w=
as here
> > /usr/include/sys/types.h:72: error: conflicting types for 'mode_t'
> > /usr/include/linux/types.h:24: error: previous declaration of 'mode_t' =
was here
> > /usr/include/sys/types.h:77: error: conflicting types for 'nlink_t'
> > /usr/include/linux/types.h:25: error: previous declaration of 'nlink_t'=
 was here
> > /usr/include/sys/types.h:82: error: conflicting types for 'uid_t'
> > /usr/include/linux/types.h:53: error: previous declaration of 'uid_t' w=
as here
> > In file included from /usr/include/sys/types.h:133,
> >                  from /usr/include/sys/uio.h:24,
> >                  from /usr/include/sys/socket.h:27,
> >                  from /usr/local/include/libnfnetlink/libnfnetlink.h:19=
,
> >                  from proxy.c:19:
> > /usr/include/time.h:105: error: conflicting types for 'timer_t'
> > /usr/include/linux/types.h:31: error: previous declaration of
> > 'timer_t' was here
> > In file included from /usr/include/sys/types.h:220,
> >                  from /usr/include/sys/uio.h:24,
> >                  from /usr/include/sys/socket.h:27,
> >                  from /usr/local/include/libnfnetlink/libnfnetlink.h:19=
,
> >                  from proxy.c:19:
> > /usr/include/sys/select.h:78: error: conflicting types for 'fd_set'
> > /usr/include/linux/types.h:21: error: previous declaration of 'fd_set' =
was here
> > In file included from /usr/include/sys/uio.h:24,
> >                  from /usr/include/sys/socket.h:27,
> >                  from /usr/local/include/libnfnetlink/libnfnetlink.h:19=
,
> >                  from proxy.c:19:
> > /usr/include/sys/types.h:235: error: conflicting types for 'blkcnt_t'
> > /usr/include/linux/types.h:152: error: previous declaration of
> > 'blkcnt_t' was here
> > make[1]: *** [proxy.o] Error 1
> > make[1]: Leaving directory `/root/workspace/conntrack-tools-0.9.4/src'
> > make: *** [all-recursive] Error 1
> >
> >
> > I'm using libnetfilter_conntrack-0.0.80 and libnfnetlink-0.0.25 and
> > gcc version 4.1.2 on Slackware 12.0. Can someone tell how can I fix
> > this ?
>
> Please, try with a libnfnetlink SVN snapshot, I plan to release a new
> version of libnfnetlink soon.
>
> --
> "Pa=EDses en desarrollo es el nombre con que los expertos designan a los
> pa=EDses arrollados por el desarrollo ajeno" -- Patas Arriba. La Escuela
> del Mundo al Rev=E9s -- E. Galeano
>

