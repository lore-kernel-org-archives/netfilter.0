From: =?iso-8859-1?Q?Matias_Bj=F8rling?= <mb@ncparty.dk>
Subject: CONNMARK Patch-o-magic patch
Date: Fri, 8 Nov 2002 20:14:24 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000801c2875b$0d9cd1b0$0200000a@parseerror.dk>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0005_01C28763.6EB7B340"
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

------=_NextPart_000_0005_01C28763.6EB7B340
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hey! :D

I'm having a very anoying problem.

I have patched 2.4.18-19 kernels where both have the same problem, when =
i run patch-o-magic on a fresh kernel, then when i come to where i can =
patch the CONNMARK module into the kernel, it always fail, even if it's =
the only thing i select, and with both kernels, even they both are fresh =
installed.

Testing... CONNMARK.patch NOT APPLIED ( 4 missing files)
The extra/CONNMARK patch:
   Author: Henrik Nordstrom <hno@marasystems.com>
   Status: working

<-Nice information about the module...-->

-----------------------------------------------------------------
Do you want to apply this patch [N/y/t/f/a/r/b/w/v/q/?] y
Testing patch extra/CONNMARK.patch...
   Placed new Config.in line
   Placed new Config.in line
   Placed new Config.in line
   Placed new Configure.help entry
   Placed new Makefile line
   Placed new Makefile line
Failed to patch copy of /usr/src/linux
TEST FAILED: patch NOT applied.

[Press enter to continue]


Im using from source

iptables 1.2.7a=20
patch-o-magic 20021008=20
have tried with newer cvs image patch-o-magic and did'nt even work
kernel 2.4.18-19 both have the same problem.

Does anybody know if theres a workaround for this thingie?.. or am i =
just lost in my dreams until a new release come? Is there a way i can =
check what the error is?

- SilverWolf=20



------=_NextPart_000_0005_01C28763.6EB7B340
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2600.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hey! :D</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I'm having a very anoying =
problem.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have patched&nbsp;2.4.18-19 kernels =
where both=20
have the same problem, when i run patch-o-magic on&nbsp;a fresh kernel, =
then=20
when i come to where i can patch the CONNMARK module into the kernel, it =
always=20
fail, even if it's the only thing i select, and with both kernels, even =
they=20
both are fresh installed.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Testing... CONNMARK.patch NOT APPLIED ( =
4 missing=20
files)<BR>The extra/CONNMARK patch:<BR>&nbsp;&nbsp; Author: Henrik =
Nordstrom=20
&lt;<A=20
href=3D"mailto:hno@marasystems.com">hno@marasystems.com</A>&gt;<BR>&nbsp;=
&nbsp;=20
Status: working</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&lt;-Nice information about the=20
module...--&gt;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial=20
size=3D2>----------------------------------------------------------------=
-<BR>Do=20
you want to apply this patch [N/y/t/f/a/r/b/w/v/q/?] y<BR>Testing patch=20
extra/CONNMARK.patch...<BR>&nbsp;&nbsp; Placed new Config.in=20
line<BR>&nbsp;&nbsp; Placed new Config.in line<BR>&nbsp;&nbsp; Placed =
new=20
Config.in line<BR>&nbsp;&nbsp; Placed new Configure.help =
entry<BR>&nbsp;&nbsp;=20
Placed new Makefile line<BR>&nbsp;&nbsp; Placed new Makefile =
line<BR>Failed to=20
patch copy of /usr/src/linux<BR>TEST FAILED: patch NOT applied.</DIV>
<DIV>&nbsp;</DIV>
<DIV>[Press enter to continue]<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Im using from source</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables 1.2.7a </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>patch-o-magic 20021008 </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>have tried with newer cvs image =
patch-o-magic and=20
did'nt even work</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>kernel 2.4.18-19 both have the same=20
problem.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Does anybody know if theres a =
workaround for this=20
thingie?.. or am i just lost in my dreams until a new release come? Is =
there a=20
way i can check what the error is?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>- SilverWolf </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0005_01C28763.6EB7B340--


