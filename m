From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: XTABLES errors...
Date: Fri, 22 Aug 2008 12:29:02 -0400 (EDT)
Message-ID: <alpine.LNX.1.10.0808221222550.10702@fbirervta.pbzchgretzou.qr>
References: <48AEE47A.9030300@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48AEE47A.9030300@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: =?UTF-8?Q?G=C3=A1sp=C3=A1r_Lajos?= <swifty@freemail.hu>
Cc: Netfilter list <netfilter@vger.kernel.org>


On Friday 2008-08-22 12:08, G=C3=A1sp=C3=A1r Lajos wrote:

> Hi list!
>
> I have a compile problem...
[with iptables]
>
> Jan can you help me?
>
> fw01:/usr/src/xtables# make
> make  all-recursive
> make[1]: Entering directory `/usr/src/xtables'
> Making all in extensions
> make[2]: Entering directory `/usr/src/xtables/extensions'
> GEN      initext4.c
> In file included from libxt_CLASSIFY.c:7:
> ../include/xtables.h:26: error: expected identifier or '(' before '<<=
' token
> ../include/xtables.h:28: error: expected identifier or '(' before '=3D=
=3D' token
> ../include/xtables.h:30: error: expected identifier or '(' before '>>=
' token
> ../include/xtables.h:146: warning: 'struct xtables_match' declared in=
side
>
> I have strange lines in the /usr/src/xtables/include/xtables.h file:

> #define XTABLES_API_VERSION(x,y,z)    (0x10000*(x) + 0x100*(y) + z)
>
> <<<<<<< HEAD:include/xtables.h.in
> union nf_inet_addr;
> =3D=3D=3D=3D=3D=3D=3D
> struct in_addr;
>> > > > > > > d91bd17eccd00fd392fbd89568bc21a605e84ea9:include/xtables=
=2Eh.in
>
> What is wrong ????

You did a git pull (most likely) without fixing up the merge conflicts.
I do not see where union nf_inet_addr comes from, it may have been part
of my personal development tree earlier on (in which case `gitk --all`
will help you find where you are).
If you just want to get it running and do not do personal development,
I suggest you use one of the available git techniques (reset-hard,
checkout or reclone) to get a clean slate.
