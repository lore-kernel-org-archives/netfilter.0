From: "Aditya Bhasin" <aditya.bhasin@openwave.com>
Subject: Usage of netfilter
Date: Tue, 27 May 2003 15:17:15 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00d101c3249d$bafb6990$2c40100a@xp>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00D2_01C32463.0E9C9190"
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

------=_NextPart_000_00D2_01C32463.0E9C9190
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit

Hi,
 
is it possbile using netfilter and libipq to extract a packet from the
IPV4 stream, buffer it in the user space and then put the packet back on
the outgoing stream at a later point in time.
 
All the docs and examples I have looked at seem to read in a packet do
an operation on it and then announce a verdit on the packet. 
 
Are there APIs to insert packets into the queue which have not been read
from it. If that was allowed I could copy and reject initially and then
insert again at a later point in time.
 
 
thanks,
 
aditya 
 

------=_NextPart_000_00D2_01C32463.0E9C9190
Content-Type: text/html;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<TITLE>Message</TITLE>

<META content=3D"MSHTML 6.00.2726.2500" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D628311322-27052003>Hi,</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D628311322-27052003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D628311322-27052003>is it =
possbile using=20
netfilter and libipq to extract a packet from the IPV4 stream, buffer it =
in the=20
user space and then put the packet back on the outgoing stream at a =
later point=20
in time.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D628311322-27052003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D628311322-27052003>All =
the docs and=20
examples I have looked at seem to read in a packet do an operation on it =
and=20
then announce&nbsp;a verdit on the packet. </SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D628311322-27052003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D628311322-27052003>Are =
there APIs to=20
insert packets into the queue which have not been read from it. If that =
was=20
allowed I could copy and reject initially and then insert again at a =
later point=20
in time.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D628311322-27052003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D628311322-27052003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D628311322-27052003>thanks,</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D628311322-27052003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D628311322-27052003>aditya =

</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D628311322-27052003></SPAN></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_00D2_01C32463.0E9C9190--


