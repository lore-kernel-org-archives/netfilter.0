From: Metzger Kobi <Yaakov_Metzger@persay.com>
Subject: RE: Changing the source on incoming messages
Date: Fri, 11 Oct 2002 09:43:57 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <385D702A9C11D511A9E90008C7160AD5C3888C@ismail1.comverse.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C270F9.F48E0B34"
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
To: 'Bailey Kong' <bailey@tgpsolutions.com>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C270F9.F48E0B34
Content-Type: text/plain;
	charset="iso-8859-1"

Yes, I had to put a computer in between.

The way it was done (if someone else has to do it):
my machine: m1
in between machine: m2
fake destination address :m3
true destination: m4

 On m1:
route add m2 eth0  #static route to m2
route add lm3 gw m2  ## messages to m3 should go first to m2

On m2:
iptables -t nat -APREROUTING -d m3 -jDNAT --to <m4 ip>  ## change all
messages going to m3 to go to m4 .
iptables -t nat -APOSTROUTING -d m3 -s m1 -jSNAT --to <m2 ip>  ## change the
source so returns from m4 comes through m2.
echo 1 >/proc/sys/net/ipv4/ip_forward ##enable gateway operation.

And now when you connect to m3 on m1 you will actually connect to m4.


I guess that is trivial but I could not find a way to do this without using
m2 which was my original question.

Thanks.

Coby


-----Original Message-----
From: Bailey Kong [mailto:bailey@tgpsolutions.com]
Sent: Friday, October 11, 2002 5:33 AM
To: Metzger Kobi
Subject: RE: Changing the source on incoming messages


Thats right i forgot.

I think you might have to put a computer infront of your server.
A bridging firewall could do it.

bridging from http://bridge.source.forge.net
which works with iptables

give it a shot and let me know

Best Regards,
Bailey

On Thu, 2002-10-10 at 00:01, Metzger Kobi wrote:
> Because SNAT can go only on the POSTROUTING chain.
> Coby.
> 
> -----Original Message-----
> From: Bailey Kong [mailto:bailey@tgpsolutions.com]
> Sent: Wednesday, October 09, 2002 5:28 PM
> To: Metzger Kobi
> Cc: netfilter@lists.netfilter.org
> Subject: Re: Changing the source on incoming messages
> 
> 
> > The problem is that I could not change the source address on the
> > incoming messages, and the aplication won't work if the source is
> different. > The SNAT cannot be put on the incoming messages (while DNAT
> can be put
> > on outgoing messages).
> 
> y can't you put a SNAT on the incoming message?
> 
> -- 
> bailey@tgpsolutions.com
> 
> Administrator, tgpsolutions
> http://www.tgpsolutions.com
> 
-- 
bailey@tgpsolutions.com

Administrator, tgpsolutions
http://www.tgpsolutions.com

------_=_NextPart_001_01C270F9.F48E0B34
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2655.35">
<TITLE>RE: Changing the source on incoming messages</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>Yes, I had to put a computer in between.</FONT>
</P>

<P><FONT SIZE=3D2>The way it was done (if someone else has to do =
it):</FONT>
<BR><FONT SIZE=3D2>my machine: m1</FONT>
<BR><FONT SIZE=3D2>in between machine: m2</FONT>
<BR><FONT SIZE=3D2>fake destination address :m3</FONT>
<BR><FONT SIZE=3D2>true destination: m4</FONT>
</P>

<P><FONT SIZE=3D2>&nbsp;On m1:</FONT>
<BR><FONT SIZE=3D2>route add m2 eth0&nbsp; #static route to m2</FONT>
<BR><FONT SIZE=3D2>route add lm3 gw m2&nbsp; ## messages to m3 should =
go first to m2</FONT>
</P>

<P><FONT SIZE=3D2>On m2:</FONT>
<BR><FONT SIZE=3D2>iptables -t nat -APREROUTING -d m3 -jDNAT --to =
&lt;m4 ip&gt;&nbsp; ## change all messages going to m3 to go to m4 =
.</FONT>
<BR><FONT SIZE=3D2>iptables -t nat -APOSTROUTING -d m3 -s m1 -jSNAT =
--to &lt;m2 ip&gt;&nbsp; ## change the source so returns from m4 comes =
through m2.</FONT></P>

<P><FONT SIZE=3D2>echo 1 &gt;/proc/sys/net/ipv4/ip_forward ##enable =
gateway operation.</FONT>
</P>

<P><FONT SIZE=3D2>And now when you connect to m3 on m1 you will =
actually connect to m4.</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>I guess that is trivial but I could not find a way to =
do this without using m2 which was my original question.</FONT>
</P>

<P><FONT SIZE=3D2>Thanks.</FONT>
</P>

<P><FONT SIZE=3D2>Coby</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>-----Original Message-----</FONT>
<BR><FONT SIZE=3D2>From: Bailey Kong [<A =
HREF=3D"mailto:bailey@tgpsolutions.com">mailto:bailey@tgpsolutions.com</=
A>]</FONT>
<BR><FONT SIZE=3D2>Sent: Friday, October 11, 2002 5:33 AM</FONT>
<BR><FONT SIZE=3D2>To: Metzger Kobi</FONT>
<BR><FONT SIZE=3D2>Subject: RE: Changing the source on incoming =
messages</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>Thats right i forgot.</FONT>
</P>

<P><FONT SIZE=3D2>I think you might have to put a computer infront of =
your server.</FONT>
<BR><FONT SIZE=3D2>A bridging firewall could do it.</FONT>
</P>

<P><FONT SIZE=3D2>bridging from <A =
HREF=3D"http://bridge.source.forge.net" =
TARGET=3D"_blank">http://bridge.source.forge.net</A></FONT>
<BR><FONT SIZE=3D2>which works with iptables</FONT>
</P>

<P><FONT SIZE=3D2>give it a shot and let me know</FONT>
</P>

<P><FONT SIZE=3D2>Best Regards,</FONT>
<BR><FONT SIZE=3D2>Bailey</FONT>
</P>

<P><FONT SIZE=3D2>On Thu, 2002-10-10 at 00:01, Metzger Kobi =
wrote:</FONT>
<BR><FONT SIZE=3D2>&gt; Because SNAT can go only on the POSTROUTING =
chain.</FONT>
<BR><FONT SIZE=3D2>&gt; Coby.</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; -----Original Message-----</FONT>
<BR><FONT SIZE=3D2>&gt; From: Bailey Kong [<A =
HREF=3D"mailto:bailey@tgpsolutions.com">mailto:bailey@tgpsolutions.com</=
A>]</FONT>
<BR><FONT SIZE=3D2>&gt; Sent: Wednesday, October 09, 2002 5:28 =
PM</FONT>
<BR><FONT SIZE=3D2>&gt; To: Metzger Kobi</FONT>
<BR><FONT SIZE=3D2>&gt; Cc: netfilter@lists.netfilter.org</FONT>
<BR><FONT SIZE=3D2>&gt; Subject: Re: Changing the source on incoming =
messages</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; &gt; The problem is that I could not change the =
source address on the</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; incoming messages, and the aplication =
won't work if the source is</FONT>
<BR><FONT SIZE=3D2>&gt; different. &gt; The SNAT cannot be put on the =
incoming messages (while DNAT</FONT>
<BR><FONT SIZE=3D2>&gt; can be put</FONT>
<BR><FONT SIZE=3D2>&gt; &gt; on outgoing messages).</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; y can't you put a SNAT on the incoming =
message?</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; -- </FONT>
<BR><FONT SIZE=3D2>&gt; bailey@tgpsolutions.com</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; Administrator, tgpsolutions</FONT>
<BR><FONT SIZE=3D2>&gt; <A HREF=3D"http://www.tgpsolutions.com" =
TARGET=3D"_blank">http://www.tgpsolutions.com</A></FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>-- </FONT>
<BR><FONT SIZE=3D2>bailey@tgpsolutions.com</FONT>
</P>

<P><FONT SIZE=3D2>Administrator, tgpsolutions</FONT>
<BR><FONT SIZE=3D2><A HREF=3D"http://www.tgpsolutions.com" =
TARGET=3D"_blank">http://www.tgpsolutions.com</A></FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C270F9.F48E0B34--

