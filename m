From: "Jurrie Overgoor" <jurrie@pcamobile.com>
Subject: Invalid parameter parm_ports
Date: Wed, 19 Jun 2002 15:35:59 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <002e01c21796$3f896f60$720aa8c0@PCA>
Reply-To: "Jurrie Overgoor" <jurrie@pcamobile.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_002B_01C217A7.02E785E0"
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: netfilter@lists.samba.org

This is a multi-part message in MIME format.

------=_NextPart_000_002B_01C217A7.02E785E0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hey,

I'm using iptables 1.2.6a on a RedHat 7.1 machine. When I do a 'modprobe =
ip_nat_ftp ports=3D21,23' I get an error: 'Invalid paramter parm_ports'. =
Does anybody know what causes this? The ftp-multi.patch is already =
applied in 1.2.6a, or am I wrong?

        Greetz -- Jurrie
        jurrie@pcamobile.com

------=_NextPart_000_002B_01C217A7.02E785E0
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
<DIV><FONT face=3DArial size=3D2>Hey,</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I'm using iptables 1.2.6a on a RedHat =
7.1 machine.=20
When I do a 'modprobe ip_nat_ftp ports=3D21,23' I get an error: 'Invalid =
paramter=20
parm_ports'. Does anybody know what causes this? The ftp-multi.patch is =
already=20
applied in 1.2.6a, or am I wrong?</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
Greetz --=20
Jurrie</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
<A=20
href=3D"mailto:jurrie@pcamobile.com">jurrie@pcamobile.com</A></FONT></DIV=
></BODY></HTML>

------=_NextPart_000_002B_01C217A7.02E785E0--


