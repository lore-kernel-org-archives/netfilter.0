From: "Aditya Bhasin" <aditya.bhasin@openwave.com>
Subject: Netfilter Architecture
Date: Wed, 21 May 2003 09:38:26 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c31fb7$679d3ca0$6501a8c0@xp>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0001_01C31F7C.BB3E64A0"
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
To: netfilter@lists.samba.org

This is a multi-part message in MIME format.

------=_NextPart_000_0001_01C31F7C.BB3E64A0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

 
Hi,
Was reading your writeup about the netfilter architecture 
http://www.netfilter.org/documentation/HOWTO//netfilter-hacking-HOWTO.ht
ml
 
I was not able to figure out whether all this functionality is done in
the context of a single ISR for each IP Packet or is the traffic cached
and opperated on in the back ground?
 
Wondering if you could provide me links and potential issues/
performance guidlines if you are operating in the context of an ISR.
 
thanks,
 
aditya
 
 

------=_NextPart_000_0001_01C31F7C.BB3E64A0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<TITLE>Message</TITLE>

<META content=3D"MSHTML 6.00.2600.0" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D366043416-21052003>Hi,</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D366043416-21052003>Was =
reading your=20
writeup about the netfilter architecture </SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><A=20
href=3D"http://www.netfilter.org/documentation/HOWTO//netfilter-hacking-H=
OWTO.html">http://www.netfilter.org/documentation/HOWTO//netfilter-hackin=
g-HOWTO.html</A></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><SPAN class=3D366043416-21052003><FONT face=3DArial size=3D2>I was =
not able to=20
figure out whether all this functionality is done in the context of a =
single ISR=20
for each IP Packet or is the traffic cached and opperated on in the back =

ground?</FONT></SPAN></DIV>
<DIV><SPAN class=3D366043416-21052003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D366043416-21052003><FONT face=3DArial =
size=3D2>Wondering if you=20
could provide me links and potential issues/ performance guidlines if =
you are=20
operating in the context of an ISR.</FONT></SPAN></DIV>
<DIV><SPAN class=3D366043416-21052003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D366043416-21052003><FONT face=3DArial=20
size=3D2>thanks,</FONT></SPAN></DIV>
<DIV><SPAN class=3D366043416-21052003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D366043416-21052003><FONT face=3DArial=20
size=3D2>aditya</FONT></SPAN></DIV>
<DIV><SPAN class=3D366043416-21052003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D366043416-21052003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0001_01C31F7C.BB3E64A0--


