From: Rob Sterenborg <r.sterenborg@hsl-brabantzuid.nl>
Subject: RE: Multiple VPN Masquerading Works !! Thanks Everyone !
Date: Mon, 9 Sep 2002 09:00:04 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019831@hslex01.hsl-brabantzuid.nl>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C257CE.86659940"
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

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C257CE.86659940
Content-Type: text/plain;
	charset="iso-8859-1"

> Turns out my problem was because my routing isn't right. The 
> pptp server
> should have a default gateway to the netfilter box (like hard_ware
Actually I forgot about that one, but yes... That's right.

> said), and also in my iptables rules I need to set the 
> default rules to
> DROP for INPUT and OUTPUT. I guess it won't work if we have ACCEPT for
> all INPUT and OUTPUT when we try to do DNAT (correct me if I'm wrong).
> 
What broke things for me once was :
echo 1 > /proc/sys/net/ipv4/conf/all/rp_filter
Thought I was being smart, but I had asymetric routing :o)

Don't know about the default policy. I think it should also work with
ACCECT, but you don't want that anyway if DROP works.

But ehm.. You tried 2 pptp patches : from pom and from impsec.org
Which one have you got working ?


Rob

------_=_NextPart_001_01C257CE.86659940
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2650.12">
<TITLE>RE: Multiple VPN Masquerading Works !! Thanks Everyone !</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>&gt; Turns out my problem was because my routing =
isn't right. The </FONT>
<BR><FONT SIZE=3D2>&gt; pptp server</FONT>
<BR><FONT SIZE=3D2>&gt; should have a default gateway to the netfilter =
box (like hard_ware</FONT>
<BR><FONT SIZE=3D2>Actually I forgot about that one, but yes... That's =
right.</FONT>
</P>

<P><FONT SIZE=3D2>&gt; said), and also in my iptables rules I need to =
set the </FONT>
<BR><FONT SIZE=3D2>&gt; default rules to</FONT>
<BR><FONT SIZE=3D2>&gt; DROP for INPUT and OUTPUT. I guess it won't =
work if we have ACCEPT for</FONT>
<BR><FONT SIZE=3D2>&gt; all INPUT and OUTPUT when we try to do DNAT =
(correct me if I'm wrong).</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>What broke things for me once was :</FONT>
<BR><FONT SIZE=3D2>echo 1 &gt; =
/proc/sys/net/ipv4/conf/all/rp_filter</FONT>
<BR><FONT SIZE=3D2>Thought I was being smart, but I had asymetric =
routing :o)</FONT>
</P>

<P><FONT SIZE=3D2>Don't know about the default policy. I think it =
should also work with ACCECT, but you don't want that anyway if DROP =
works.</FONT></P>

<P><FONT SIZE=3D2>But ehm.. You tried 2 pptp patches : from pom and =
from impsec.org</FONT>
<BR><FONT SIZE=3D2>Which one have you got working ?</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>Rob</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C257CE.86659940--

