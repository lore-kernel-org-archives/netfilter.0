From: "V. Pascual" <voltaire@voltaire.servebeer.com>
Subject: help: ip_nat_pptp
Date: Fri, 30 May 2003 14:39:54 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003f01c32676$496ca840$fe00a8c0@expi>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_003C_01C326B9.556CE130"
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

------=_NextPart_000_003C_01C326B9.556CE130
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi There,

I have patched my kernel (2.4.20) with ip_nat_pptp (using =
patch-o-matic-20030107). Patch went fine and the kernel was recompiled =
successfuly. I have tried to install the module but I have the error =
which says;

[root@ netfilter]# insmod ip_nat_pptp.o
ip_nat_pptp.o: unresolved symbol ip_pptp_lock_Rsmp_66d9b5ea

[root@ netfilter]# insmod ip_nat_mms.o
ip_nat_mms.o: unresolved symbol ip_mms_lock_Rsmp_8d71dea1



I have tried to install other modules but it works just fine(like =
ip_nat_proto_gre)

Did i missed something here when I apply the patch-o-matic? Appreciate =
your help.

TIA
//VP.


------=_NextPart_000_003C_01C326B9.556CE130
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2719.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi There,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have patched my kernel (2.4.20) with =
ip_nat_pptp=20
(using patch-o-matic-20030107). Patch went fine and the kernel was =
recompiled=20
successfuly. I have tried to install the module but I have the error =
which=20
says;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>[root@ netfilter]# insmod=20
ip_nat_pptp.o<BR>ip_nat_pptp.o: unresolved symbol=20
ip_pptp_lock_Rsmp_66d9b5ea</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>[root@ netfilter]# insmod=20
ip_nat_mms.o<BR>ip_nat_mms.o: unresolved symbol=20
ip_mms_lock_Rsmp_8d71dea1<BR></DIV>
<DIV><BR></DIV></FONT>
<DIV><FONT face=3DArial size=3D2>I have tried to install other modules =
but it works=20
just fine(like ip_nat_proto_gre)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Did i missed something here when I =
apply the=20
patch-o-matic? Appreciate your help.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>TIA</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>//VP.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;</DIV></FONT></BODY></HTML>

------=_NextPart_000_003C_01C326B9.556CE130--


