From: "Eric Poulin" <epoulin@onepost.net>
Subject: Re: Problem compiling Iptables 1.2.11 on Kernel 2.6.7 <Resolved, but other problem>
Date: Wed, 7 Jul 2004 10:53:00 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <035101c46432$19e49650$800101df@lvl.digidyne.ca>
References: <009001c4638f$7a173170$800101df@lvl.digidyne.ca> <015601c46399$68674140$800101df@lvl.digidyne.ca> <40EB1FC4.4090606@linux.org.ar>
Reply-To: "Eric Poulin" <epoulin@onepost.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hey Jose, thanks for you help, the CVS version resolved it.

I'll remember about it next time. Any idea when this will be incorporated=
 in
the official pom?

Thanks again, I was getting really annoyed by this! :)

Hum, I'm getting a new problem thought while compiling iptables as module=
s
inside my new kernel...

net/ipv4/netfilter/ip_conntrack_standalone.c:222: error: redefinition of
`ip_conntrack_defrag'
net/ipv4/netfilter/ip_conntrack_standalone.c:202: error:
`ip_conntrack_defrag' previously defined here
net/ipv4/netfilter/ip_conntrack_standalone.c:303: error: redefinition of
`ip_conntrack_defrag_local_out_ops'
net/ipv4/netfilter/ip_conntrack_standalone.c:295: error:
`ip_conntrack_defrag_local_out_ops' previously defined here
net/ipv4/netfilter/ip_conntrack_standalone.c:202: warning:
`ip_conntrack_defrag' defined but not used
net/ipv4/netfilter/ip_conntrack_standalone.c:295: warning:
`ip_conntrack_defrag_local_out_ops' defined but not used
{standard input}: Assembler messages:
{standard input}:745: Error: symbol `ip_conntrack_defrag_local_out_ops' i=
s
already defined
make[3]: *** [net/ipv4/netfilter/ip_conntrack_standalone.o] Error 1
make[2]: *** [net/ipv4/netfilter] Error 2
make[1]: *** [net/ipv4] Error 2
make: *** [net] Error 2

I'll do my research... Let me know if you encounter this...


Eric

----- Original Message -----=20
From: "Jose Teves" <joseteves@linux.org.ar>
To: <netfilter@lists.netfilter.org>
Sent: Tuesday, July 06, 2004 5:55 PM
Subject: Re: Problem compiling Iptables 1.2.11 on Kernel 2.6.7


Eric,

Download the last version of patch-o-matic-ng from cvs.netfilter.org


http://cvs.netfilter.org/patch-o-matic-ng/patch-o-matic-ng.tar.gz?tarball=
=3D1

this it compiles without problems.

good luck

pd: i'm sorry my bad english :(

--
Jose Teves
josxlnx at yahoo dot com dot ar

Eric Poulin escribi=F3:

>Well, it turned out I need to apply the 08_linux-2.6.7-user_attr.patch f=
rom
>patch-o-matic, however, it is failing since it needs to  apply
>03_linux-2.6.5.patch, and it failed on the diff test... There is some
>rejects according to the
>output. Can't force it either... :(
>
>Interesting
>
>Eric
>----- Original Message -----=20
>From: "Eric Poulin" <epoulin@onepost.net>
>To: <netfilter@lists.netfilter.org>
>Sent: Tuesday, July 06, 2004 3:28 PM
>Subject: Problem compiling Iptables 1.2.11 on Kernel 2.6.7
>
>
>
>
>>Hello Guys,
>>
>>Any people succesfully compiled iptables 1.2.11 on 2.6.7?  Oddly, even
>>without applying any patch-o-matics packages, I'm getting the following
>>error while doing the make:
>>
>># make BINDIR=3D/sbin KERNEL_DIR=3D/usr/src/linux
>>Making dependencies: please wait...
>>Extensions found: IPv4:ROUTE IPv4:recent IPv6:ROUTE IPv6:ah IPv6:esp
>>IPv6:frag IPv6:ipv6header IPv6:hbh IPv6:dst IPv6:rt
>>
>>
>>
>gcc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/ -DIPTABLES_VE=
RSI
O
>
>
>>N=3D\"1.2.11\"  -fPIC -o extensions/libipt_ah_sh.o -c extensions/libipt=
_ah.c
>>In file included from include/libiptc/libiptc.h:6,
>>                 from include/iptables.h:5,
>>                 from extensions/libipt_ah.c:8:
>>/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:255: warning: n=
o
>>semicolon at end of struct or union
>>/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:255: error: syn=
tax
>>error before '*' token
>>/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:259: error: syn=
tax
>>error before '}' token
>>/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:339: warning: t=
ype
>>defaults to `int' in declaration of `DECLARE_MUTEX'
>>/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:339: warning:
>>parameter names (without types) in function declaration
>>/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:339: warning:
>>`DECLARE_MUTEX' declared `static' but never defined
>>make: *** [extensions/libipt_ah_sh.o] Error 1
>>
>>
>>I'm getting this with a vanilla source code of the kernel and iptables.=
 I
>>was getting those with the patch-o-matic installed, but I wanted to nar=
row
>>it down. Kernel can compile easily those modules that are coming from
>>iptables 1.2.9.
>>
>>Any idea?
>>
>>Eric
>>
>>
>>
>>
>>
>>
>
>
>
>
>
>
>


--=20
Jose Teves
joseteves at linux dot org dot ar






