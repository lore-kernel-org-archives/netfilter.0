From: "eNet" <nt@enet.org.al>
Subject: rules for ssh
Date: Sat, 19 Jul 2003 18:50:00 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000e01c34e15$cb10a010$8101a8c0@tani>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000B_01C34E26.8E91CEF0"
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

------=_NextPart_000_000B_01C34E26.8E91CEF0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Is there any other rule to allow ssh from an internal network to the =
server.

till now i have used a rule like this:

$iptables -A tcp-packets -p TCP -s xxx.xxx.xxx.xxx -allowed

Tani

------=_NextPart_000_000B_01C34E26.8E91CEF0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.3315.2870" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Is there any other rule to allow ssh =
from an=20
internal network to the server.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>till now i have used a rule like =
this:</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>$iptables -A tcp-packets -p TCP -s =
xxx.xxx.xxx.xxx=20
-allowed</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Tani</FONT></DIV></BODY></HTML>

------=_NextPart_000_000B_01C34E26.8E91CEF0--


