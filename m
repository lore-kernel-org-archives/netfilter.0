From: Doug Watson <doug@1stbooks.com>
Subject: RE: intermittent and unreliable behaviour with iptables scripts
Date: Mon, 9 Dec 2002 11:15:40 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <91F7518FF779D41181A700010266356D0155568B@mail.springbound.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C29F9E.375742F0"
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
To: 'Julian Gomez' <kluivert@tm.net.my>, "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C29F9E.375742F0
Content-Type: text/plain;
	charset="iso-8859-1"

Thanks to everyone that has responded to my numerous submissions.
I think that I finally have my issues resolved which seem to have been
related to
ARP requests being answered by an improper interface due to my switch set up
and the kernel. 

In searching for kernel related ARP articles per Julian using Google I found
the following suggestion.
	echo 1 > /proc/sys/net/ipv4/conf/all/hidden
However this file did not exist on my RedHat 8 box. But I did find
/proc/sys/net/ipv4/conf/arp_filter.
After doing some quick reading I found that echoing a value of 1 to this
file will cause your computer respond to ARP requests only with the
interface that they were received on. This has fixed my problem until I can
re-cable my set up.

Thanks,
Doug Watson
Director of Information Systems
1stBooks Library
http://www.1stbooks.com
dwatson@1stbooks.com
 

-----Original Message-----
From: Julian Gomez [mailto:kluivert@tm.net.my]
Sent: Sunday, December 08, 2002 2:38 AM
To: Doug Watson
Subject: RE: intermittent and unreliable behaviour with iptables scripts


On Fri, 6 Dec 2002, Doug Watson wrote:

(snip)

> At some point my workstation made an arp request to find out what mac
> address was associated with the ip address on the internal interface
> of the firewall, which is my workstations default gateway. The
> firewall may have choosen to respond with it's external interface
> which is plugged

Yup.

(snip)

> on the wrong interface at the firewall such as http requests to the
> internet that should first arrive that the firewall's internal
> interface and then be routed out to the web. Please let me know if I
> have failed to understand this.

Correct. I suggest you separate both the switches if possible though 
(physically). Usually for my uplink ports to the ISPs I just throw in an 
el-cheapo 10mbit hub.
 
> As for your search suggetion I did find some suggestions to basically
> hide an interface to prevent it from responding to arp requests. Here
> is one example that I found, note I have not tried this yet but may
> very soon.  I don't know what other consequences this may have though.
> 
> # Allow hiding interfaces
> echo 1 > /proc/sys/net/ipv4/conf/all/hidden

I've never used the hidden options, but the above proc entries are the 
ones to modify however -- you're right. Its not available in the default 
pristine kernel, you'll need to patch it.

> Again, thank you very much for you help. If I understand this like I
> think I do I guess I understand why my problem is occuring. I just
> don't understand why the kernel would respond to an arp request on any
> interface other than the one that I came in on.

If I remember correctly, its partly to help load balancing. Its a specific
Linux kernel behaviour though, I don't think it happens on BSD variants 
for example.

HTH.

------_=_NextPart_001_01C29F9E.375742F0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2654.45">
<TITLE>RE: intermittent and unreliable behaviour with iptables =
scripts</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>Thanks to everyone that has responded to my numerous =
submissions.</FONT>
<BR><FONT SIZE=3D2>I think that I finally have my issues resolved which =
seem to have been related to</FONT>
<BR><FONT SIZE=3D2>ARP requests being answered by an improper interface =
due to my switch set up and the kernel. </FONT>
</P>

<P><FONT SIZE=3D2>In searching for kernel related ARP articles per =
Julian using Google I found the following suggestion.</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>echo 1 =
&gt; /proc/sys/net/ipv4/conf/all/hidden</FONT>
<BR><FONT SIZE=3D2>However this file did not exist on my RedHat 8 box. =
But I did find /proc/sys/net/ipv4/conf/arp_filter.</FONT>
<BR><FONT SIZE=3D2>After doing some quick reading I found that echoing =
a value of 1 to this file will cause your computer respond to ARP =
requests only with the interface that they were received on. This has =
fixed my problem until I can re-cable my set up.</FONT></P>

<P><FONT SIZE=3D2>Thanks,</FONT>
<BR><FONT SIZE=3D2>Doug Watson</FONT>
<BR><FONT SIZE=3D2>Director of Information Systems</FONT>
<BR><FONT SIZE=3D2>1stBooks Library</FONT>
<BR><FONT SIZE=3D2><A HREF=3D"http://www.1stbooks.com" =
TARGET=3D"_blank">http://www.1stbooks.com</A></FONT>
<BR><FONT SIZE=3D2>dwatson@1stbooks.com</FONT>
<BR><FONT SIZE=3D2>&nbsp;</FONT>
</P>

<P><FONT SIZE=3D2>-----Original Message-----</FONT>
<BR><FONT SIZE=3D2>From: Julian Gomez [<A =
HREF=3D"mailto:kluivert@tm.net.my">mailto:kluivert@tm.net.my</A>]</FONT>=

<BR><FONT SIZE=3D2>Sent: Sunday, December 08, 2002 2:38 AM</FONT>
<BR><FONT SIZE=3D2>To: Doug Watson</FONT>
<BR><FONT SIZE=3D2>Subject: RE: intermittent and unreliable behaviour =
with iptables scripts</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>On Fri, 6 Dec 2002, Doug Watson wrote:</FONT>
</P>

<P><FONT SIZE=3D2>(snip)</FONT>
</P>

<P><FONT SIZE=3D2>&gt; At some point my workstation made an arp request =
to find out what mac</FONT>
<BR><FONT SIZE=3D2>&gt; address was associated with the ip address on =
the internal interface</FONT>
<BR><FONT SIZE=3D2>&gt; of the firewall, which is my workstations =
default gateway. The</FONT>
<BR><FONT SIZE=3D2>&gt; firewall may have choosen to respond with it's =
external interface</FONT>
<BR><FONT SIZE=3D2>&gt; which is plugged</FONT>
</P>

<P><FONT SIZE=3D2>Yup.</FONT>
</P>

<P><FONT SIZE=3D2>(snip)</FONT>
</P>

<P><FONT SIZE=3D2>&gt; on the wrong interface at the firewall such as =
http requests to the</FONT>
<BR><FONT SIZE=3D2>&gt; internet that should first arrive that the =
firewall's internal</FONT>
<BR><FONT SIZE=3D2>&gt; interface and then be routed out to the web. =
Please let me know if I</FONT>
<BR><FONT SIZE=3D2>&gt; have failed to understand this.</FONT>
</P>

<P><FONT SIZE=3D2>Correct. I suggest you separate both the switches if =
possible though </FONT>
<BR><FONT SIZE=3D2>(physically). Usually for my uplink ports to the =
ISPs I just throw in an </FONT>
<BR><FONT SIZE=3D2>el-cheapo 10mbit hub.</FONT>
<BR><FONT SIZE=3D2>&nbsp;</FONT>
<BR><FONT SIZE=3D2>&gt; As for your search suggetion I did find some =
suggestions to basically</FONT>
<BR><FONT SIZE=3D2>&gt; hide an interface to prevent it from responding =
to arp requests. Here</FONT>
<BR><FONT SIZE=3D2>&gt; is one example that I found, note I have not =
tried this yet but may</FONT>
<BR><FONT SIZE=3D2>&gt; very soon.&nbsp; I don't know what other =
consequences this may have though.</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; # Allow hiding interfaces</FONT>
<BR><FONT SIZE=3D2>&gt; echo 1 &gt; =
/proc/sys/net/ipv4/conf/all/hidden</FONT>
</P>

<P><FONT SIZE=3D2>I've never used the hidden options, but the above =
proc entries are the </FONT>
<BR><FONT SIZE=3D2>ones to modify however -- you're right. Its not =
available in the default </FONT>
<BR><FONT SIZE=3D2>pristine kernel, you'll need to patch it.</FONT>
</P>

<P><FONT SIZE=3D2>&gt; Again, thank you very much for you help. If I =
understand this like I</FONT>
<BR><FONT SIZE=3D2>&gt; think I do I guess I understand why my problem =
is occuring. I just</FONT>
<BR><FONT SIZE=3D2>&gt; don't understand why the kernel would respond =
to an arp request on any</FONT>
<BR><FONT SIZE=3D2>&gt; interface other than the one that I came in =
on.</FONT>
</P>

<P><FONT SIZE=3D2>If I remember correctly, its partly to help load =
balancing. Its a specific</FONT>
<BR><FONT SIZE=3D2>Linux kernel behaviour though, I don't think it =
happens on BSD variants </FONT>
<BR><FONT SIZE=3D2>for example.</FONT>
</P>

<P><FONT SIZE=3D2>HTH.</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C29F9E.375742F0--

