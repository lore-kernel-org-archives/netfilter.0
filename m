From: "Allen Bolderoff" <allen@gist.net.au>
Subject: Question about --limit
Date: Mon, 3 Mar 2003 21:29:12 +1030
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000801c2e173$ed386560$b16614cb@pblt>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0005_01C2E1CB.EECF02F0"
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

------=_NextPart_000_0005_01C2E1CB.EECF02F0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi there, and thanks for all the fish - I just love netfilter...

I have a quick question and would appreciate being cc'd in the reply if =
at all possible.

is it possible, with iptables to slow down traffic? - here is the =
scenario...

I have customer with an employee that is surfing certain websites (ie: =
zone.msn.com) and playing backgammon all day long.=20

The problem is that he is valueble to the organisation for certain =
reasons, and as such the customer does not want to piss him off =
(political reasons), however I have been commisssioned to stop the =
backgammon games as they are a real timewaster.

They have a firewall, which allows NAT'd connections without a squid =
proxy, and I was wondering if the --limit stuff would work to maybe =
reduce the access to the website, and therefore make it all but =
useable...

for example, when he goes to the website, instead of timing out =
completely, it just slows down so much that it is impossible to play...

I know there are other ways of doing this, but I am looking for an =
IPTABLES method if at all possible.

So, to recap - Dont disable, just slow down to an impossible crawl... =
maybe even using the --limit-burst stuff.

Any examples?

I thought of doing:

iptables -I FORWARD -s 207.46.20.12/32 -m limit --limit 10/minute -j =
ACCEPT

however this does not seem to work - any other ideas?

TIA

Allen
------=_NextPart_000_0005_01C2E1CB.EECF02F0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1141" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi there, and thanks for all the fish - =
I just love=20
netfilter...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have a quick question and would =
appreciate being=20
cc'd in the reply if at all possible.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>is it possible, with iptables to slow =
down traffic?=20
- here is the scenario...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have customer with an employee that =
is surfing=20
certain websites (ie: zone.msn.com) and playing backgammon all day long. =

</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>The problem is that he is valueble to =
the=20
organisation for certain reasons, and as such the customer does&nbsp;not =
want to=20
piss him off (political reasons), however I have been commisssioned to =
stop the=20
backgammon games as they are a real timewaster.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>They have a firewall, which allows =
NAT'd=20
connections without a squid proxy, and I was wondering if the --limit =
stuff=20
would work to maybe reduce the access to the website, and therefore make =
it all=20
but useable...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>for example, when he goes to the =
website, instead=20
of timing out completely, it just slows down so much that it is =
impossible to=20
play...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I know there are other ways of doing =
this, but I am=20
looking for an IPTABLES method if at all possible.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>So, to recap - Dont disable, just slow =
down to an=20
impossible crawl... maybe even using the --limit-burst =
stuff.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Any examples?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I thought of doing:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -I FORWARD -s 207.46.20.12/32 =
-m limit=20
--limit 10/minute -j ACCEPT</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>however this does not seem to work - =
any other=20
ideas?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>TIA</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Allen</FONT></DIV></BODY></HTML>

------=_NextPart_000_0005_01C2E1CB.EECF02F0--



