From: "Roman Gavrilov" <romio@netvision.net.il>
Subject: iptables and ftp
Date: Sat, 22 Feb 2003 22:20:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <023001c2daaf$cd19fe80$020010ac@romio>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_022D_01C2DAC0.90982020"
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

------=_NextPart_000_022D_01C2DAC0.90982020
Content-Type: text/plain;
	charset="windows-1255"
Content-Transfer-Encoding: quoted-printable

Hello,

My question is about ftp and ftp data connections.
I know this subject has been heavily discussed but still ...

I set up my firewall to allow connections to 21 and 20 ports.
 I also allowed connections to high ports from outside from port 20.
and of course I enabled all established and related connections.


But when ever I connect to my ftp server and issuing "ls" command it =
stacks.
In the firewall I see :
Feb 22 04:07:46 hostname IN=3Deth0 OUT=3D =
MAC=3D00:e0:18:d3:1b:4b:00:90:5f:0d:64:38:08:00  SRC=3Dsource ip =
DST=3Dmy server ip LEN=3D60 TOS=3D00 PREC=3D0x00 TTL=3D53 ID=3D41512 DF =
PROTO=3DTCP SPT=3D37070 DPT=3D21773 SEQ=3D3256137382 ACK=3D0 =
WINDOW=3D5648 SYN URGP=3D0

SPT=3D37070 DPT=3D21773 looks strange to me.

It seems that ftp data session is trying to establish connection from a =
high port to a high port.
SYN means that it trying to establish connection and of course it is =
dropped by the firewall.
There is no sense in allowing anything from outside to servers high =
ports.

I think that the client should issue a connect request from a high port =
to servers 20 port.
And then it should match the established connection.

What can be the problem ?

Thanks


------=_NextPart_000_022D_01C2DAC0.90982020
Content-Type: text/html;
	charset="windows-1255"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dwindows-1255">
<META content=3D"MSHTML 6.00.2722.900" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hello,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>My question is about ftp and ftp data=20
connections.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I know this subject has been heavily =
discussed but=20
still ...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I set up my firewall to allow =
connections to 21 and=20
20 ports.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;I also allowed connections to =
high ports from=20
outside from port 20.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>and of course I enabled all established =
and related=20
connections.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>But when ever I connect to my ftp =
server and=20
issuing "ls" command it stacks.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>In the firewall I see :</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Feb 22 04:07:46&nbsp;hostname IN=3Deth0 =
OUT=3D=20
MAC=3D00:e0:18:d3:1b:4b:00:90:5f:0d:64:38:08:00&nbsp; SRC=3Dsource =
ip&nbsp;DST=3Dmy=20
server ip LEN=3D60 TOS=3D00 PREC=3D0x00 TTL=3D53 ID=3D41512 DF =
PROTO=3DTCP SPT=3D37070=20
DPT=3D21773 SEQ=3D3256137382 ACK=3D0 WINDOW=3D5648 SYN =
URGP=3D0<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>SPT=3D37070 DPT=3D21773 looks strange =
to=20
me.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT><FONT face=3DArial =
size=3D2>&nbsp;</DIV></FONT>
<DIV><FONT face=3DArial size=3D2>It seems that ftp data session is =
trying to=20
establish connection from a high port to a high port.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>SYN means that it trying to establish =
connection=20
and of course it is dropped by the firewall.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>There is no sense in allowing anything =
from outside=20
to servers high ports.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I think that the client should issue a =
connect=20
request from a high port to servers 20 port.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>And then it should match the =
established=20
connection.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>What can be the problem ?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;</DIV></FONT></BODY></HTML>

------=_NextPart_000_022D_01C2DAC0.90982020--


