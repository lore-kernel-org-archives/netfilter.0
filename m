From: "George" <george@xorgate.com>
Subject: set RELATED?
Date: Fri, 25 Jul 2003 20:21:21 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000801c3531c$9b1fad40$3eac18ac@geosxp>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0005_01C352EA.502C95F0"
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

------=_NextPart_000_0005_01C352EA.502C95F0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Is there currently a way for iptables to force another packet stream =
conntrack entry to be RELATED without having to look inside of the =
packet data?

For example:  If a 10.0.0.2 client behind an iptables firewall were to =
send an IMCP echo to 10.20.30.1, could a rule be set up so that after =
the firewall see this packet, all udp packets sent to dport=3D45678 =
would be DNATed to 10.0.0.2?

The designated RELATED stream would in general then be just like any =
other conntrack entry.

My guess is that this would require a generic force-related module.

------=_NextPart_000_0005_01C352EA.502C95F0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Is there currently a way&nbsp;for =
iptables to force=20
another packet stream&nbsp;conntrack entry&nbsp;to be RELATED without =
having to=20
look inside of the packet data?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>For example:&nbsp; If a 10.0.0.2 client =
behind an=20
iptables firewall were to send an IMCP echo to 10.20.30.1, could a rule =
be set=20
up so that after the firewall see this packet, all udp packets sent to=20
dport=3D45678&nbsp;would =
be&nbsp;DNATed&nbsp;to&nbsp;10.0.0.2?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>The designated RELATED stream would in =
general then=20
be&nbsp;just like any other conntrack entry.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>My guess is that this would require a =
generic=20
force-related module.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0005_01C352EA.502C95F0--


