From: "Nikolaos Fideropoulos" <n.fideropoulos@tu-bs.de>
Subject: Module working on 2 Hooks
Date: Mon, 25 Nov 2002 14:38:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002801c29487$f4506340$0c0aa8c0@aristo>
Reply-To: "Nikolaos Fideropoulos" <n.fideropoulos@tu-bs.de>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0021_01C29490.4E9A1F00"
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

------=_NextPart_000_0021_01C29490.4E9A1F00
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

i have 2 questions, about which i'm not sure if they work like i think =
they do.

1. I wanna write a small module which does some checks on packets in =
NF_IP_LOCAL_IN, NF_IP_LOCAL_OUT and maintains a connection-table. I =
would like to know if it's ok to do that in 1 Module (and 1 function), =
or should that be done for any reason in seperate modules?

 static int __init init(void)      {
            return nf_register_hook(&first);
            return nf_register_hook(&second);
      }

static struct nf_hook_ops first
              =3D { { NULL, NULL }, example_hook, PF_INET, =
NF_IP_LOCAL_IN, NF_IP_PRI_FILTER-1 };
static struct nf_hook_ops first
              =3D { { NULL, NULL }, example_hook, PF_INET, =
NF_IP_LOCAL_OUT, NF_IP_PRI_FILTER-1 };

example_hook(unsigned int hook, struct sk_buff **skb,
                                const struct net_device *indev, const
                                struct net_device *outdev, int
                                (*okfn)(struct sk_buff *))
{
..
}


2. I wanna look at tunneled packets in LOCAL_IN after they got =
decapsulated, can i see that by looking at the "const struct net_device =
*indev" which should be the tunlX device?

Regards,=20
Nikos
------=_NextPart_000_0021_01C29490.4E9A1F00
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
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hello,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>i have 2 questions, about which i'm not =
sure=20
if&nbsp;they work like i think&nbsp;they do.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>1. I&nbsp;wanna write a small module =
which does=20
some checks on packets in NF_IP_LOCAL_IN, NF_IP_LOCAL_OUT and maintains =
a=20
connection-table. I would like to know if it's ok to do that in 1 Module =
(and 1=20
function), or should that be done for any reason in seperate=20
modules?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;static int __init=20
init(void)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<BR>&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
return nf_register_hook(&amp;first);</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; return=20
nf_register_hook(&amp;second);<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
}<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>static struct=20
nf_hook_ops&nbsp;first<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
=3D { { NULL, NULL }, example_hook, PF_INET, NF_IP_LOCAL_IN, =
NF_IP_PRI_FILTER-1=20
};<BR>static struct=20
nf_hook_ops&nbsp;first<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
=3D { { NULL, NULL }, example_hook, PF_INET, NF_IP_LOCAL_OUT, =
NF_IP_PRI_FILTER-1=20
};<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>example_hook(unsigned int hook, struct =
sk_buff=20
**skb,<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
const struct net_device *indev,=20
const<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
struct net_device *outdev,=20
int<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
(*okfn)(struct sk_buff *))</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>{</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>..</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>}<BR></DIV>
<DIV></FONT><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>2.&nbsp;I wanna look at tunneled =
packets in=20
LOCAL_IN after they got decapsulated, can i see that by looking at the =
"const=20
struct net_device *indev" which should be the tunlX device?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Regards, </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Nikos</FONT></DIV></BODY></HTML>

------=_NextPart_000_0021_01C29490.4E9A1F00--


