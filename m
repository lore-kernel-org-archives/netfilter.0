From: "Luigi Cartuccia" <luigicart@tin.it>
Subject: NF_STOLEN and okfn
Date: Tue, 1 Oct 2002 11:45:06 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001901c2692f$39accac0$abdd2dd5@q8c7l5>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0016_01C2693F.FC9E8AE0"
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

------=_NextPart_000_0016_01C2693F.FC9E8AE0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Good morning to all.
I have installed a software that  use netfilter.
It register a function in the hook IP_LOCAL_OUT
This function is:=20
unsigned int local_out_handler ( unsigned int hooknum, struct sk_buff =
**, const struct net_device *in, const struct net_device  *out, =
int(*okfn) struct sk_buff *)
The function handle the packet and return NF_STOLEN, but before it call =
okfn. What okfn do?????
Thank you
Luigi


------=_NextPart_000_0016_01C2693F.FC9E8AE0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2919.6307" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Good morning to all.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I have installed a software that&nbsp; =
use=20
netfilter.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>It register a function in the hook=20
IP_LOCAL_OUT</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>This function is: </FONT></DIV>
<DIV><FONT face=3DArial size=3D2><STRONG>unsigned int</STRONG> =
local_out_handler (=20
unsigned int hooknum, struct sk_buff **, const struct net_device *in, =
const=20
struct net_device&nbsp; *out, int(*okfn) struct sk_buff *)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>The function handle the packet and =
return=20
NF_STOLEN, but before it call <STRONG>okfn</STRONG>. What okfn=20
do?????</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Thank you</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Luigi</FONT></DIV>
<DIV>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0016_01C2693F.FC9E8AE0--


