From: "Adam Mitz" <ahm1@express.cec.wustl.edu>
Subject: Masquerading on 2 ppp's
Date: Fri, 17 May 2002 12:53:39 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <01b001c1fdcb$c6f52eb0$6801a8c0@dirkgently>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_01AD_01C1FDA1.DD8DE330"
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

------=_NextPart_000_01AD_01C1FDA1.DD8DE330
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I haven't seen this addressed in any FAQ or HOWTO on netfilter.samba.org =
so I hope this is an appropriate place.
I'd like to do Masquerading on to 2 different ppp interfaces.  So when a =
packet reaches the gateway from the internal LAN (the first packet of =
its connection) the gateway should choose the least-used ppp (or pick =
one at random, whatever) and do NAT masquerading for the duration of =
that connection, sending all packets to the same ppp with the same =
source ip/port modification.  Think of it as running 2 standard =
masquerading set-ups in parallel, transparent to the client LAN.  The 2 =
ppp connections are standard ISP dialups, dynamically assigned IPs.  Has =
anyone done this?  Is it possible?  Stupid? =20

Thanks,
    Adam

------=_NextPart_000_01AD_01C1FDA1.DD8DE330
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2716.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>I haven't seen this addressed in any =
FAQ or HOWTO=20
on netfilter.samba.org so I hope this is an appropriate =
place.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I'd like to do Masquerading on to 2 =
different ppp=20
interfaces.&nbsp; So when a packet reaches the gateway from the internal =
LAN=20
(the first packet of its connection) the gateway should choose the =
least-used=20
ppp (or pick one at random, whatever) and do NAT masquerading for the =
duration=20
of that connection, sending all packets to the same ppp with the same =
source=20
ip/port modification.&nbsp; Think of it as running 2 standard =
masquerading=20
set-ups in parallel, transparent to the client LAN.&nbsp; The 2 ppp =
connections=20
are standard ISP dialups, dynamically assigned IPs.&nbsp; Has anyone =
done=20
this?&nbsp; Is it possible?&nbsp; Stupid?&nbsp; </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; =
Adam</FONT></DIV></BODY></HTML>

------=_NextPart_000_01AD_01C1FDA1.DD8DE330--


