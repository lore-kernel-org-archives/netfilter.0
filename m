From: "Tarun Bhalla" <tarun.bhalla@wipro.com>
Subject: compiling a module using netfilters..
Date: Sun, 2 Mar 2003 19:18:24 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <025601c2e133$8d0ebc10$8b03750a@TarunB>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPartTM-000-dee836f2-d360-4a3e-8d8a-8d92d28310eb"
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

------=_NextPartTM-000-dee836f2-d360-4a3e-8d8a-8d92d28310eb
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0253_01C2E0F0.7EDD4B40"

------=_NextPart_000_0253_01C2E0F0.7EDD4B40
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

hi all

Firstly a little intro about myself.. I m as new=20
to the Linux kernel as one can be... So please bear=20
with my ignorance and help me out of my misery :((

I have written the following code and frankly that also
cut-paste :)) But still I am not able to compile it.. i m=20
feeling embarrased.. its ok everyone has a bad day....=20
is'nt it?=20

#define MODULE

#include <linux/module.h>

#include <linux/init.h>

#include <linux/config.h>

#include <linux/kernel.h>

#include <asm/types.h>

#include <linux/netfilter_ipv4.h>

#include <linux/ip.h>

#include <net/ip.h>

#include <asm-i386/types.h>



static unsigned int stupid_hook(unsigned int hook,=20

struct sk_buff **pskb,=20

const struct net_device *indev,

const struct net_device *outdev,

int (*okfn) (struct sk_buff *)) {


return NF_ACCEPT;=20

}

static struct nf_hooks_ops stupid_ops=3D{{NULL, NULL}, stupid_hook, =
PF_INET, NF_IP_LOCAL_OUT, 0};

static int __init init(void) {=20

nf_register_hook(&stupid_ops);

return 0;

}


static void __exit fini(void) {

printk("bye - bye.......... \n");

nf_unregister_hook(&stupid_ops);

}

module_init(init);

module_exit(fini);

But when I am trying to compile it with the following flags:
gcc -c -I/usr/src/linux/include/ -Wall -DMODULE -D__KERNEL__ -DLINUX =
file_name.c -o file_name.o

The error says:
stupid_ops has an initializer but incomplete type
and many more errors saying all sorts of things like extra brace group
at end of initializer (despite the fact that I have counted the braces=20
atleast million number of times..)

So, have a look and if possible try it out and extricate me out of my =
misery..=20

cheers :)
tarun B


------=_NextPart_000_0253_01C2E0F0.7EDD4B40
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 5.50.4134.600" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>hi all</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Firstly a little intro about myself.. I =
m as new=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>to the Linux kernel as one can be... So =
please bear=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>with my ignorance and help me out of my =
misery=20
:((</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have written the following code and =
frankly that=20
also</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>cut-paste :)) But still I am not able =
to compile=20
it.. i m </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>feeling embarrased.. its ok everyone =
has a bad=20
day.... </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>is'nt it? </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>
<P>#define MODULE</P>
<P>#include &lt;linux/module.h&gt;</P>
<P>#include &lt;linux/init.h&gt;</P>
<P>#include &lt;linux/config.h&gt;</P>
<P>#include &lt;linux/kernel.h&gt;</P>
<P>#include &lt;asm/types.h&gt;</P>
<P>#include &lt;linux/netfilter_ipv4.h&gt;</P>
<P>#include &lt;linux/ip.h&gt;</P>
<P>#include &lt;net/ip.h&gt;</P>
<P>#include &lt;asm-i386/types.h&gt;</P>
<P>&nbsp;</P>
<P>static unsigned int stupid_hook(unsigned int hook, </P>
<P>struct sk_buff **pskb, </P>
<P>const struct net_device *indev,</P>
<P>const struct net_device *outdev,</P>
<P>int (*okfn) (struct sk_buff *)) {</P>
<P></P>
<P>return NF_ACCEPT; </P>
<P>}</P>
<P>static struct nf_hooks_ops stupid_ops=3D{{NULL, NULL}, stupid_hook, =
PF_INET,=20
NF_IP_LOCAL_OUT, 0};</P>
<P>static int __init init(void) { </P>
<P>nf_register_hook(&amp;stupid_ops);</P>
<P>return 0;</P>
<P>}</P>
<P></P>
<P>static void __exit fini(void) {</P>
<P>printk("bye - bye.......... \n");</P>
<P>nf_unregister_hook(&amp;stupid_ops);</P>
<P>}</P>
<P>module_init(init);</P>
<P>module_exit(fini);</P></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>But when I am trying to compile it with =
the=20
following flags:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>gcc -c -I/usr/src/linux/include/ -Wall =
-DMODULE=20
-D__KERNEL__ -DLINUX file_name.c -o file_name.o</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>The error says:</FONT></DIV>
<DIV>stupid_ops has an initializer but incomplete type</DIV>
<DIV>and many more errors saying all sorts of things like extra brace=20
group</DIV>
<DIV>at end of initializer (despite the fact that I have counted the =
braces=20
</DIV>
<DIV>atleast million number of times..)</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>So, have a look and if possible try it =
out and=20
extricate me out of my misery.. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>cheers :)<BR>tarun=20
B<BR></FONT></FONT></DIV></DIV></BODY></HTML>

------=_NextPart_000_0253_01C2E0F0.7EDD4B40--



------=_NextPartTM-000-dee836f2-d360-4a3e-8d8a-8d92d28310eb
Content-Type: text/plain;
	name="Wipro_Disclaimer.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="Wipro_Disclaimer.txt"

**************************Disclaimer**************************************************    
 
 Information contained in this E-MAIL being proprietary to Wipro Limited is 'privileged' 
and 'confidential' and intended for use only by the individual or entity to which it is 
addressed. You are notified that any use, copying or dissemination of the information 
contained in the E-MAIL in any manner whatsoever is strictly prohibited.

****************************************************************************************

------=_NextPartTM-000-dee836f2-d360-4a3e-8d8a-8d92d28310eb--


