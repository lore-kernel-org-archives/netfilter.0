From: "Bogdan DUMITRIU" <bdumitriu@bdumitriu.ro>
Subject: can't compile simple netfilter hook
Date: Sat, 26 Oct 2002 12:03:02 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000801c27cce$7e4d5660$0100a8c0@blackwizard>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0005_01C27CE7.A2754840"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0005_01C27CE7.A2754840
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I have tried to compile the following netfilter hook (found in one of =
the documents listed in the documentation area at www.netfilter.org) and =
I just can't make it.

Here's how I tried to compile it:

gcc -c -I/lib/modules/`uname -r`/build/include ./netmod.c -Wall

Here's the error I got:

In file included from ./netfmod.c:4:
/lib/modules/2.4.18-4GB/build/include/linux/netfilter_ipv4.h:53: =
`INT_MIN' undeclared here (not in a function)
/lib/modules/2.4.18-4GB/build/include/linux/netfilter_ipv4.h:53: =
enumerator value for `NF_IP_PRI_FIRST' not integer constant
/lib/modules/2.4.18-4GB/build/include/linux/netfilter_ipv4.h:59: =
`INT_MAX' undeclared here (not in a function)
/lib/modules/2.4.18-4GB/build/include/linux/netfilter_ipv4.h:59: =
enumerator value for `NF_IP_PRI_LAST' not integer constant
./netfmod.c:12: warning: `struct net_device' declared inside parameter =
list
./netfmod.c:12: warning: its scope is only this definition or =
declaration, which is probably not what you want.
./netfmod.c:12: warning: `struct sk_buff' declared inside parameter list
./netfmod.c: In function `stupid_hook':
./netfmod.c:14: dereferencing pointer to incomplete type
./netfmod.c: At top level:
./netfmod.c:21: variable `stupid_ops' has initializer but incomplete =
type
./netfmod.c:21: extra brace group at end of initializer
./netfmod.c:21: (near initialization for `stupid_ops')
./netfmod.c:21: `NULL' undeclared here (not in a function)
./netfmod.c:21: `NULL' undeclared here (not in a function)
./netfmod.c:21: warning: excess elements in struct initializer
./netfmod.c:21: warning: (near initialization for `stupid_ops')
./netfmod.c:21: warning: excess elements in struct initializer
./netfmod.c:21: warning: (near initialization for `stupid_ops')
./netfmod.c:21: `PF_INET' undeclared here (not in a function)
./netfmod.c:21: warning: excess elements in struct initializer
./netfmod.c:21: warning: (near initialization for `stupid_ops')
./netfmod.c:21: warning: excess elements in struct initializer
./netfmod.c:21: warning: (near initialization for `stupid_ops')
./netfmod.c:21: warning: excess elements in struct initializer
./netfmod.c:21: warning: (near initialization for `stupid_ops')
./netfmod.c:23: parse error before `init'
./netfmod.c:24: warning: return-type defaults to `int'
./netfmod.c: In function `init':
./netfmod.c:25: warning: implicit declaration of function =
`nf_register_hook'
./netfmod.c: At top level:
./netfmod.c:28: parse error before `fini'
./netfmod.c:29: warning: return-type defaults to `int'
./netfmod.c: In function `fini':
./netfmod.c:30: warning: implicit declaration of function =
`nf_unregister_hook'
./netfmod.c:30: `linuxmag_ops' undeclared (first use in this function)
./netfmod.c:30: (Each undeclared identifier is reported only once
./netfmod.c:30: for each function it appears in.)
./netfmod.c:31: warning: control reaches end of non-void function
./netfmod.c: At top level:
./netfmod.c:33: warning: type defaults to `int' in declaration of =
`module_init'
./netfmod.c:33: warning: parameter names (without types) in function =
declaration
./netfmod.c:33: warning: data definition has no type or storage class
./netfmod.c:34: warning: type defaults to `int' in declaration of =
`module_exit'
./netfmod.c:34: warning: parameter names (without types) in function =
declaration
./netfmod.c:34: warning: data definition has no type or storage class=20

Here is the code in netmod.c:

/* Rusty's Dumb netfilter hook example */
#include <linux/config.h>
#include <linux/module.h>
#include <linux/netfilter_ipv4.h>
#include <linux/ip.h>

/* The work comes in here from netfilter.c. */
static unsigned int
stupid_hook(unsigned int hook,
           struct sk_buff **pskb,
           const struct net_device *indev,
           const struct net_device *outdev,
           int (*okfn)(struct sk_buff *))
{
       if ((*pskb)->len =3D=3D 200)
               return NF_DROP;

       return NF_ACCEPT;
}

static struct nf_hook_ops stupid_ops
=3D { { NULL, NULL }, stupid_hook, PF_INET, NF_IP_POST_ROUTING, 0 };

static int __init init(void)
{
        return nf_register_hook(&stupid_ops);
}

static void __exit fini(void)
{
        nf_unregister_hook(&linuxmag_ops);
}

module_init(init);
module_exit(fini);

I run a SuSE 8.0 Linux, kernel version 2.4.18, gcc version 2.95.3.

Please help with this as I need it for a school project and I can't get =
to actually doing what I have to do because I just can't make this work.

Thanks.
Bogdan.
------=_NextPart_000_0005_01C27CE7.A2754840
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#c0c0c0>
<DIV><FONT face=3DArial size=3D2>I have tried to compile the following =
netfilter=20
hook (found in one of the documents listed in the documentation area at =
<A=20
href=3D"http://www.netfilter.org">www.netfilter.org</A>) and I just =
can't make=20
it.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Here's how I tried to compile =
it:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>gcc -c -I/lib/modules/`uname =
-r`/build/include=20
./netmod.c -Wall</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Here's the error I got:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>In file included from=20
./netfmod.c:4:<BR>/lib/modules/2.4.18-4GB/build/include/linux/netfilter_i=
pv4.h:53:=20
`INT_MIN' undeclared here (not in a=20
function)<BR>/lib/modules/2.4.18-4GB/build/include/linux/netfilter_ipv4.h=
:53:=20
enumerator value for `NF_IP_PRI_FIRST' not integer=20
constant<BR>/lib/modules/2.4.18-4GB/build/include/linux/netfilter_ipv4.h:=
59:=20
`INT_MAX' undeclared here (not in a=20
function)<BR>/lib/modules/2.4.18-4GB/build/include/linux/netfilter_ipv4.h=
:59:=20
enumerator value for `NF_IP_PRI_LAST' not integer =
constant<BR>./netfmod.c:12:=20
warning: `struct net_device' declared inside parameter =
list<BR>./netfmod.c:12:=20
warning: its scope is only this definition or declaration, which is =
probably not=20
what you want.<BR>./netfmod.c:12: warning: `struct sk_buff' declared =
inside=20
parameter list<BR>./netfmod.c: In function =
`stupid_hook':<BR>./netfmod.c:14:=20
dereferencing pointer to incomplete type<BR>./netfmod.c: At top=20
level:<BR>./netfmod.c:21: variable `stupid_ops' has initializer but =
incomplete=20
type<BR>./netfmod.c:21: extra brace group at end of=20
initializer<BR>./netfmod.c:21: (near initialization for=20
`stupid_ops')<BR>./netfmod.c:21: `NULL' undeclared here (not in a=20
function)<BR>./netfmod.c:21: `NULL' undeclared here (not in a=20
function)<BR>./netfmod.c:21: warning: excess elements in struct=20
initializer<BR>./netfmod.c:21: warning: (near initialization for=20
`stupid_ops')<BR>./netfmod.c:21: warning: excess elements in struct=20
initializer<BR>./netfmod.c:21: warning: (near initialization for=20
`stupid_ops')<BR>./netfmod.c:21: `PF_INET' undeclared here (not in a=20
function)<BR>./netfmod.c:21: warning: excess elements in struct=20
initializer<BR>./netfmod.c:21: warning: (near initialization for=20
`stupid_ops')<BR>./netfmod.c:21: warning: excess elements in struct=20
initializer<BR>./netfmod.c:21: warning: (near initialization for=20
`stupid_ops')<BR>./netfmod.c:21: warning: excess elements in struct=20
initializer<BR>./netfmod.c:21: warning: (near initialization for=20
`stupid_ops')<BR>./netfmod.c:23: parse error before =
`init'<BR>./netfmod.c:24:=20
warning: return-type defaults to `int'<BR>./netfmod.c: In function=20
`init':<BR>./netfmod.c:25: warning: implicit declaration of function=20
`nf_register_hook'<BR>./netfmod.c: At top level:<BR>./netfmod.c:28: =
parse error=20
before `fini'<BR>./netfmod.c:29: warning: return-type defaults to=20
`int'<BR>./netfmod.c: In function `fini':<BR>./netfmod.c:30: warning: =
implicit=20
declaration of function `nf_unregister_hook'<BR>./netfmod.c:30: =
`linuxmag_ops'=20
undeclared (first use in this function)<BR>./netfmod.c:30: (Each =
undeclared=20
identifier is reported only once<BR>./netfmod.c:30: for each function it =
appears=20
in.)<BR>./netfmod.c:31: warning: control reaches end of non-void=20
function<BR>./netfmod.c: At top level:<BR>./netfmod.c:33: warning: type =
defaults=20
to `int' in declaration of `module_init'<BR>./netfmod.c:33: warning: =
parameter=20
names (without types) in function declaration<BR>./netfmod.c:33: =
warning: data=20
definition has no type or storage class<BR>./netfmod.c:34: warning: type =

defaults to `int' in declaration of `module_exit'<BR>./netfmod.c:34: =
warning:=20
parameter names (without types) in function =
declaration<BR>./netfmod.c:34:=20
warning: data definition has no type or storage class </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Here is the code in =
netmod.c:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV>/* Rusty's Dumb netfilter hook example */<BR>#include=20
&lt;linux/config.h&gt;<BR>#include &lt;linux/module.h&gt;<BR>#include=20
&lt;linux/netfilter_ipv4.h&gt;<BR>#include &lt;linux/ip.h&gt;<BR><BR>/* =
The work=20
comes in here from netfilter.c. */<BR>static unsigned=20
int<BR>stupid_hook(unsigned int=20
hook,<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
struct=20
sk_buff =
**pskb,<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
const struct net_device=20
*indev,<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
const=20
struct net_device=20
*outdev,<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
int=20
(*okfn)(struct sk_buff *))<BR>{<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
if=20
((*pskb)-&gt;len =3D=3D=20
200)<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
return NF_DROP;<BR><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return=20
NF_ACCEPT;<BR>}<BR><BR>static struct nf_hook_ops stupid_ops<BR>=3D { { =
NULL, NULL=20
}, stupid_hook, PF_INET, NF_IP_POST_ROUTING, 0 };<BR><BR>static int =
__init=20
init(void)<BR>{<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return=20
nf_register_hook(&amp;stupid_ops);<BR>}<BR><BR>static void __exit=20
fini(void)<BR>{<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
nf_unregister_hook(&amp;linuxmag_ops);<BR>}<BR><BR>module_init(init);<BR>=
module_exit(fini);</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I run a SuSE 8.0 Linux, kernel version =
2.4.18, gcc=20
version 2.95.3.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Please help with this as I need it for =
a school=20
project and I can't get to actually doing what I have to do because I =
just can't=20
make this work.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Bogdan.</FONT></DIV></BODY></HTML>

------=_NextPart_000_0005_01C27CE7.A2754840--


