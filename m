From: "Juliano Murlick" <jmurlick@sicredi.com.br>
Subject: Please ... how can i log all packets dropped ?
Date: Sat, 19 Jul 2003 14:38:01 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAArnhC4pMfykCnPZlPMhHrI8KAAAAQAAAAyh7iEzTuckqggWRQr9qR0AEAAAAA@sicredi.com.br>
Reply-To: <jmurlick@sicredi.com.br>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0006_01C34E03.5ACC4230"
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

------=_NextPart_000_0006_01C34E03.5ACC4230
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: 7bit

Hello ALL,
I need log all packet dropped on my firewall, how can i get it ? I know how
log all that i accept, like this:
 
iptables -A FORWARD -p tcp -s $REDELOCAL --sport 1024:65535 -d $SSHSRV
--sport 22 -j LOG
iptables -A FORWARD -p tcp -s $REDELOCAL --sport 1024:65535 -d $SSHSRV
--sport 22 -j ACCEPT
 
i will LOG all packet from ssh connection, but i don't  to log all packet
dropped, my default policy is DROP:
 
iptables -P FORWARD DROP
 
please, if anyone knows it ? tell me ....
 
 
Thanks in advance!

Att,
Juliano Murlick


 

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.500 / Virus Database: 298 - Release Date: 10/7/2003
 

------=_NextPart_000_0006_01C34E03.5ACC4230
Content-Type: text/html;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3DWindows-1252">


<META content=3D"MSHTML 6.00.2800.1170" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D937393017-19072003>Hello=20
ALL,</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D937393017-19072003>I need =
log all=20
packet dropped on my firewall, how can i get it ? I know how log all =
that i=20
accept, like this:</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D937393017-19072003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN =
class=3D937393017-19072003>iptables -A FORWARD=20
-p tcp -s $REDELOCAL --sport 1024:65535 -d $SSHSRV --sport 22 -j=20
LOG</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D937393017-19072003>
<DIV><FONT face=3DArial size=3D2><SPAN =
class=3D937393017-19072003>iptables -A FORWARD=20
-p tcp -s $REDELOCAL --sport 1024:65535 -d $SSHSRV --sport 22 -j=20
ACCEPT</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D937393017-19072003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D937393017-19072003>i will =
LOG all=20
packet from ssh connection, but i don't&nbsp; to log all packet dropped, =
my=20
default policy&nbsp;is DROP:</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D937393017-19072003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN =
class=3D937393017-19072003>iptables -P FORWARD=20
DROP</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D937393017-19072003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN =
class=3D937393017-19072003>please, if anyone=20
knows it ? tell me ....</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D937393017-19072003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D937393017-19072003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D937393017-19072003>Thanks =
in=20
advance!</SPAN></FONT></DIV></SPAN></FONT></DIV>
<P align=3Dleft><FONT face=3DArial size=3D2>A<SPAN=20
class=3D937393017-19072003>tt</SPAN>,<BR>Juliano Murlick<BR></FONT></P>
<DIV>&nbsp;</DIV></BODY></HTML>
<BR>

<P><FONT SIZE=3D2>---<BR>
Outgoing mail is certified Virus Free.<BR>
Checked by AVG anti-virus system (http://www.grisoft.com).<BR>
Version: 6.0.500 / Virus Database: 298 - Release Date: 10/7/2003<BR>
</FONT> </P>

------=_NextPart_000_0006_01C34E03.5ACC4230--


