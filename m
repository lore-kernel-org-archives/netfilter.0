From: "Juliano Murlick" <jmurlick@sicredi.com.br>
Subject: log all packets in DROP
Date: Thu, 17 Jul 2003 09:51:19 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAArnhC4pMfykCnPZlPMhHrI8KAAAAQAAAAxaWkmHTk3kqs21DKedVUqQEAAAAA@sicredi.com.br>
Reply-To: <jmurlick@sicredi.com.br>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_001A_01C34C48.F8E21BF0"
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

------=_NextPart_000_001A_01C34C48.F8E21BF0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: 7bit

Hello ALL,
How can i LOG all packet that is DROP on my firewall ?
 
iptables -A FORWARD -j LOG
iptables -P FORWARD DROP
 
some thing like this ?

Att,
Juliano Murlick


 

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.500 / Virus Database: 298 - Release Date: 10/7/2003
 

------=_NextPart_000_001A_01C34C48.F8E21BF0
Content-Type: text/html;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3DWindows-1252">


<META content=3D"MSHTML 6.00.2800.1170" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D015234612-17072003>Hello=20
ALL,</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D015234612-17072003>How =
can i LOG all=20
packet that is DROP on my firewall ?</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D015234612-17072003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN =
class=3D015234612-17072003>iptables -A FORWARD=20
-j LOG</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN =
class=3D015234612-17072003>iptables -P FORWARD=20
DROP</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D015234612-17072003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D015234612-17072003>some =
thing like this=20
?</SPAN></FONT></DIV>
<P align=3Dleft><FONT face=3DArial size=3D2>A<SPAN=20
class=3D015234612-17072003>tt</SPAN>,<BR>Juliano Murlick<BR></FONT></P>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>
<BR>

<P><FONT SIZE=3D2>---<BR>
Outgoing mail is certified Virus Free.<BR>
Checked by AVG anti-virus system (http://www.grisoft.com).<BR>
Version: 6.0.500 / Virus Database: 298 - Release Date: 10/7/2003<BR>
</FONT> </P>

------=_NextPart_000_001A_01C34C48.F8E21BF0--


