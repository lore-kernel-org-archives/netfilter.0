From: Loc Huynh <loc.huynh@oz.quest.com>
Subject: RE: Iptables forwarding
Date: Thu, 27 Jun 2002 13:48:58 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <1C61B9073EBFBD40B45FA90B8265B2DD1BE7@MELXCHW01.oz.quest.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C21D8D.915CD690"
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
To: 'Patrick Schaaf' <bof@bof.de>
Cc: netfilter@lists.samba.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C21D8D.915CD690
Content-Type: text/plain;
	charset="iso-8859-1"

Thanks Patrick, 
Unfortunately, there wasn't any message related to the forwarding.  it only
told me the firewall has been stoped and restarted successfully.
I have found out that I need to open port 1025 -> 65535 then it works, I am
looking at the microsoft website for more infor. on IIS.  I will post if I
can find a *GOOD* stuff.
Ta,
LH

-----Original Message-----
From: Patrick Schaaf [mailto:bof@bof.de]
Sent: Wednesday, 26 June 2002 6:07 PM
To: Loc Huynh
Cc: netfilter@lists.samba.org
Subject: Re: Iptables forwarding


Hi,

> The above worked fine if I have the "FORWARD" to be open to ACCEPT
> ie: $IPTABLES -P FORWARD ACCEPT
> 
> Of course, I don't want the default is open to "ACCEPT", is there anyway
to
> avoid this please ?

Without thinking about your exact setup, here is a general advise:
in a case like the one you have on your hands, when you see that
a chain default policy is neccessary for something to work, you
can immediately guess that you are missing a neccessary rule within
the chain itself. Now what can you do to find out what kind of
rule you need? Easy: use the LOG target at the end of the chain,
and you will see in your syslog (/var/log/messages, most likely)
the address information of the packets which fall off the end
of your chain.

hope this helps
  Patrick

------_=_NextPart_001_01C21D8D.915CD690
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2653.12">
<TITLE>RE: Iptables forwarding</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>Thanks Patrick, </FONT>
<BR><FONT SIZE=3D2>Unfortunately, there wasn't any message related to =
the forwarding.&nbsp; it only told me the firewall has been stoped and =
restarted successfully.</FONT></P>

<P><FONT SIZE=3D2>I have found out that I need to open port 1025 -&gt; =
65535 then it works, I am looking at the microsoft website for more =
infor. on IIS.&nbsp; I will post if I can find a *GOOD* =
stuff.</FONT></P>

<P><FONT SIZE=3D2>Ta,</FONT>
<BR><FONT SIZE=3D2>LH</FONT>
</P>

<P><FONT SIZE=3D2>-----Original Message-----</FONT>
<BR><FONT SIZE=3D2>From: Patrick Schaaf [<A =
HREF=3D"mailto:bof@bof.de">mailto:bof@bof.de</A>]</FONT>
<BR><FONT SIZE=3D2>Sent: Wednesday, 26 June 2002 6:07 PM</FONT>
<BR><FONT SIZE=3D2>To: Loc Huynh</FONT>
<BR><FONT SIZE=3D2>Cc: netfilter@lists.samba.org</FONT>
<BR><FONT SIZE=3D2>Subject: Re: Iptables forwarding</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>Hi,</FONT>
</P>

<P><FONT SIZE=3D2>&gt; The above worked fine if I have the =
&quot;FORWARD&quot; to be open to ACCEPT</FONT>
<BR><FONT SIZE=3D2>&gt; ie: $IPTABLES -P FORWARD ACCEPT</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; Of course, I don't want the default is open to =
&quot;ACCEPT&quot;, is there anyway to</FONT>
<BR><FONT SIZE=3D2>&gt; avoid this please ?</FONT>
</P>

<P><FONT SIZE=3D2>Without thinking about your exact setup, here is a =
general advise:</FONT>
<BR><FONT SIZE=3D2>in a case like the one you have on your hands, when =
you see that</FONT>
<BR><FONT SIZE=3D2>a chain default policy is neccessary for something =
to work, you</FONT>
<BR><FONT SIZE=3D2>can immediately guess that you are missing a =
neccessary rule within</FONT>
<BR><FONT SIZE=3D2>the chain itself. Now what can you do to find out =
what kind of</FONT>
<BR><FONT SIZE=3D2>rule you need? Easy: use the LOG target at the end =
of the chain,</FONT>
<BR><FONT SIZE=3D2>and you will see in your syslog (/var/log/messages, =
most likely)</FONT>
<BR><FONT SIZE=3D2>the address information of the packets which fall =
off the end</FONT>
<BR><FONT SIZE=3D2>of your chain.</FONT>
</P>

<P><FONT SIZE=3D2>hope this helps</FONT>
<BR><FONT SIZE=3D2>&nbsp; Patrick</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C21D8D.915CD690--

