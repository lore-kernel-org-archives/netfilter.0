From: "Jason Corekin" <jason@corekin.no-ip.com>
Subject: Can somebody help me with setting up a server behind a sdsl router?
Date: Mon, 16 Dec 2002 09:20:45 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <010801c2a527$782dcbd0$5d01a8c0@jason>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0105_01C2A4E4.69ECF1B0"
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

------=_NextPart_000_0105_01C2A4E4.69ECF1B0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I have a friend who is trying to setup a Netopia R7100 sdsl router.  I =
know that this is not a netfilter specific question, but it is largely =
the same stuff, just a different implementation. He has a few different =
publicly registered static ip's and has had one of the assigned to the =
dsl connection and has had it configured to pass the connection then to =
another router that is NATing for his internal network.  Now he wants to =
use another one of his publicly registered static ip's for his mail =
server, which we are trying to plug into one of the unused jacks on the =
built it hub on the R7100.  The problem is that we can not get the R7100 =
to respond to more then one public address.  Is there a way that we =
should be able to setup the R7100 such that it would route the second =
address through it to the mail server?  How would the rest of the =
internet know to talk to the R7100 to get to his mail server?  This =
sounds like just a basic routing issue but my knowledge is limited.

Thanks for any help you might offer

Jason Corekin
------=_NextPart_000_0105_01C2A4E4.69ECF1B0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1126" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>I have a friend who is trying to setup =
a Netopia=20
R7100 sdsl router.&nbsp; I know that this is not a netfilter specific =
question,=20
but it is largely the same stuff, just a different implementation. He =
has a few=20
different publicly registered static ip's and has had one of the =
assigned to the=20
dsl connection and has had it configured to pass the connection then to =
another=20
router that is NATing for his internal network.&nbsp; Now he wants to =
use=20
another one of his publicly registered static ip's for his mail server, =
which we=20
are trying to plug into one of the unused jacks on the built it hub on =
the=20
R7100.&nbsp; The problem is that we can not get the R7100 to respond to =
more=20
then one public address.&nbsp; Is there a way that we should be able to =
setup=20
the R7100 such that it would route the second address through it to the =
mail=20
server?&nbsp; How would the rest of the internet know to talk to the =
R7100 to=20
get to his mail server?&nbsp; This sounds like just a basic routing =
issue but my=20
knowledge is limited.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks for any help you might =
offer</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Jason =
Corekin</FONT></DIV></BODY></HTML>

------=_NextPart_000_0105_01C2A4E4.69ECF1B0--


