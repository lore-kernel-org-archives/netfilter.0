From: Doug Watson <doug@1stbooks.com>
Subject: RE: intermittent and unreliable behaviour with iptables scripts
Date: Wed, 13 Nov 2002 09:53:35 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <91F7518FF779D41181A700010266356D015555E0@mail.springbound.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C28B24.7140C970"
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
To: 'Anders Fugmann' <afu@fugmann.dhs.org>
Cc: netfilter@lists.netfilter.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C28B24.7140C970
Content-Type: text/plain;
	charset="iso-8859-1"

Thank you as well for you prompt response.

I have seen lines logged in /var/log/messages
from some of my logging rules prior to a drop but all of these
seem to be packets that should be getting dropped per my rules. 
I have yet to see any entries indicating that /proc/net/ip_conntrack was
full.
However I have increased the value in ip_conntrack_max to 65535 anyway.

Your comments about the Asus P5A are interesting. I will remove some of
the RAM and what that gets me.

As for my kernel it is a vanilla 2.4.18 kernel. Recompiling my own
streamlined
kernel with most or all netfilter modules included is on my to do list
for today or tomorrow. 

The load balancing of the 2 T1s is being done by a Cisco 2621 router.

Finally, your comments on my "DMZ" rules are greatly appreciated and will
help
me finalize my configuration.

Thank you,
Doug Watson

-----Original Message-----
From: Anders Fugmann [mailto:afu@fugmann.dhs.org]
Sent: Monday, November 11, 2002 7:11 PM
To: Doug Watson
Cc: netfilter@lists.netfilter.org
Subject: Re: intermittent and unreliable behaviour with iptables scripts


Doug Watson wrote:
> 
> When browsing the web, web pages that normally would load very quickly
seem
> to hang for an inconsistent amount of time, anywhere between 1 second to 
> 30 seconds or more before they would even begin to load or would at times
> ever load at all as if the connection to the web was lost. This 
state may
> continue for seemingly any random amount of time, a few seconds to 
> several minutes or until I finally restarted the firewall computer which
> would bring it around, but would always return eventually. Yet users 
> connecting through the current firewall which is running RedHat 6.2 and
using 
> ipfwadm to forward and masquerade experienced none of these problems.
> I will note that when the firewall is in the state that no web pages will
> load, pings to its LAN interface which usually return in about 1ms will 
> time timeout, but I have not been able to link this to any specific
network 
> issue. Nor am I seeing this behaviour anywhere else on our network.
Are any lines logged in the firewall? It may be that the connection 
table cannot hold all the entries. Try increasing it:
echo 65535 > /proc/sys/net/ipv4/ip_conntrack_max.

> 
> Also overall speed of our connection seems to be noticeably slower when
> running through this firewall. One example be it a good one or not is
> when running the high speed bandwidth test at
http://www.bandwidthplace.com
> through the current firewall the average speed returned is between 1.0 
> and 1.4 Mbps which seems reasonable given that we have 2 T1's that are
load 
> balanced and about 100 users with varying amounts of usage. However, when
running 
> the same test through the new iptables based firewall the average speed 
> returned usually in the range of 600 to 800 Kbps.
> 
> Wondering if this was caused by a bad rule or rules I implemented the 
> following script so there would be no rules. While this is not much of a 
> firewall and would be insane to use at all I never experienced any of the
problems 
> described above while using the firewall in this configuration.
Good debugging. I guess that you have checked that there are no dropped 
packets in the system logs, when using the attached script. If there are 
none, I would suspect hardware to be the bottleneck.

I would recommend you to try and extend the small sctipt and add 
functionality in small steps while watching performance.

> Finally the last thing to note for now is that I have changed out nearly
> all of the hardware in this box and am currently using the following 
> components with RedHat 8.0 and iptables 1.2.7a.
> 
> AMD K6-450 processor (REPLACED)
> Asus P5A motherboard (REPLACED)
Bad choice. The ASUS P5A can only cache up to 128Mb. Try removing some 
of the ram modules, in order to only have 128 MB installed, and see how 
this affects performance. (Note: I'm running a firewall on a 512Mbits 
internet connection on almost identical hardware (P5A, K6-II 300Mhz, 
192Mb ram) with over 300 iptables rules, and see absolutly no degradation)

> 224Mb PC-100 memory (REPLACED)
> 3 Netgear FA-310TX NICS (REPLACED 3 3Com 905b-TXNMs and 3 3Com 980C-TXs)
> 1 ATI 8Mb RAGE IIC AGP graphics card (NO X console only)
> 1 52X Creative Labs IDE CD-ROM (Secondary Master)
> 1 10Gb IBM 7200Rpm HardDrive (Primary master) (REPLACED)
> 1 cheap floppy drive 3.5"
> 

What kernel are you running. I really recomment that you compile your 
own kernel, and minimizing the number of modules nessesary by linking 
them statically into the kernel. Make sure that you optimize for the K6 
architecture.

Also you mention loadbalacing. Is this done by the firewall or by some 
other hardware?

As a general note to the attached script.
The DMZ rules are really crappy, and it is actually not a DMZ.
_Never_ allow packets from the DMZ to the internal network.
(Well one might allow SSH, but the should be all.). Also do not allow 
the machines in the DMZ to have unrestricted access to the internet. 
Limit it to the services and DNS to specific servers.

Hope it helps.

Regards
Anders Fugmann

------_=_NextPart_001_01C28B24.7140C970
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

<P><FONT SIZE=3D2>Thank you as well for you prompt response.</FONT>
</P>

<P><FONT SIZE=3D2>I have seen lines logged in /var/log/messages</FONT>
<BR><FONT SIZE=3D2>from some of my logging rules prior to a drop but =
all of these</FONT>
<BR><FONT SIZE=3D2>seem to be packets that should be getting dropped =
per my rules. </FONT>
<BR><FONT SIZE=3D2>I have yet to see any entries indicating that =
/proc/net/ip_conntrack was full.</FONT>
<BR><FONT SIZE=3D2>However I have increased the value in =
ip_conntrack_max to 65535 anyway.</FONT>
</P>

<P><FONT SIZE=3D2>Your comments about the Asus P5A are interesting. I =
will remove some of</FONT>
<BR><FONT SIZE=3D2>the RAM and what that gets me.</FONT>
</P>

<P><FONT SIZE=3D2>As for my kernel it is a vanilla 2.4.18 kernel. =
Recompiling my own streamlined</FONT>
<BR><FONT SIZE=3D2>kernel with most or all netfilter modules included =
is on my to do list</FONT>
<BR><FONT SIZE=3D2>for today or tomorrow. </FONT>
</P>

<P><FONT SIZE=3D2>The load balancing of the 2 T1s is being done by a =
Cisco 2621 router.</FONT>
</P>

<P><FONT SIZE=3D2>Finally, your comments on my &quot;DMZ&quot; rules =
are greatly appreciated and will help</FONT>
<BR><FONT SIZE=3D2>me finalize my configuration.</FONT>
</P>

<P><FONT SIZE=3D2>Thank you,</FONT>
<BR><FONT SIZE=3D2>Doug Watson</FONT>
</P>

<P><FONT SIZE=3D2>-----Original Message-----</FONT>
<BR><FONT SIZE=3D2>From: Anders Fugmann [<A =
HREF=3D"mailto:afu@fugmann.dhs.org">mailto:afu@fugmann.dhs.org</A>]</FON=
T>
<BR><FONT SIZE=3D2>Sent: Monday, November 11, 2002 7:11 PM</FONT>
<BR><FONT SIZE=3D2>To: Doug Watson</FONT>
<BR><FONT SIZE=3D2>Cc: netfilter@lists.netfilter.org</FONT>
<BR><FONT SIZE=3D2>Subject: Re: intermittent and unreliable behaviour =
with iptables scripts</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>Doug Watson wrote:</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; When browsing the web, web pages that normally =
would load very quickly seem</FONT>
<BR><FONT SIZE=3D2>&gt; to hang for an inconsistent amount of time, =
anywhere between 1 second to </FONT>
<BR><FONT SIZE=3D2>&gt; 30 seconds or more before they would even begin =
to load or would at times&nbsp;&nbsp; &gt; ever load at all as if the =
connection to the web was lost. This </FONT></P>

<P><FONT SIZE=3D2>state may</FONT>
<BR><FONT SIZE=3D2>&gt; continue for seemingly any random amount of =
time, a few seconds to </FONT>
<BR><FONT SIZE=3D2>&gt; several minutes or until I finally restarted =
the firewall computer which</FONT>
<BR><FONT SIZE=3D2>&gt; would bring it around, but would always return =
eventually. Yet users </FONT>
<BR><FONT SIZE=3D2>&gt; connecting through the current firewall which =
is running RedHat 6.2 and using </FONT>
<BR><FONT SIZE=3D2>&gt; ipfwadm to forward and masquerade experienced =
none of these problems.</FONT>
<BR><FONT SIZE=3D2>&gt; I will note that when the firewall is in the =
state that no web pages will</FONT>
<BR><FONT SIZE=3D2>&gt; load, pings to its LAN interface which usually =
return in about 1ms will </FONT>
<BR><FONT SIZE=3D2>&gt; time timeout, but I have not been able to link =
this to any specific network </FONT>
<BR><FONT SIZE=3D2>&gt; issue. Nor am I seeing this behaviour anywhere =
else on our network.</FONT>
<BR><FONT SIZE=3D2>Are any lines logged in the firewall? It may be that =
the connection </FONT>
<BR><FONT SIZE=3D2>table cannot hold all the entries. Try increasing =
it:</FONT>
<BR><FONT SIZE=3D2>echo 65535 &gt; =
/proc/sys/net/ipv4/ip_conntrack_max.</FONT>
</P>

<P><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; Also overall speed of our connection seems to =
be noticeably slower when</FONT>
<BR><FONT SIZE=3D2>&gt; running through this firewall. One example be =
it a good one or not is</FONT>
<BR><FONT SIZE=3D2>&gt; when running the high speed bandwidth test at =
<A HREF=3D"http://www.bandwidthplace.com" =
TARGET=3D"_blank">http://www.bandwidthplace.com</A></FONT>
<BR><FONT SIZE=3D2>&gt; through the current firewall the average speed =
returned is between 1.0 </FONT>
<BR><FONT SIZE=3D2>&gt; and 1.4 Mbps which seems reasonable given that =
we have 2 T1's that are load </FONT>
<BR><FONT SIZE=3D2>&gt; balanced and about 100 users with varying =
amounts of usage. However, when running </FONT>
<BR><FONT SIZE=3D2>&gt; the same test through the new iptables based =
firewall the average speed </FONT>
<BR><FONT SIZE=3D2>&gt; returned usually in the range of 600 to 800 =
Kbps.</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; Wondering if this was caused by a bad rule or =
rules I implemented the </FONT>
<BR><FONT SIZE=3D2>&gt; following script so there would be no rules. =
While this is not much of a </FONT>
<BR><FONT SIZE=3D2>&gt; firewall and would be insane to use at all I =
never experienced any of the problems </FONT>
<BR><FONT SIZE=3D2>&gt; described above while using the firewall in =
this configuration.</FONT>
<BR><FONT SIZE=3D2>Good debugging. I guess that you have checked that =
there are no dropped </FONT>
<BR><FONT SIZE=3D2>packets in the system logs, when using the attached =
script. If there are </FONT>
<BR><FONT SIZE=3D2>none, I would suspect hardware to be the =
bottleneck.</FONT>
</P>

<P><FONT SIZE=3D2>I would recommend you to try and extend the small =
sctipt and add </FONT>
<BR><FONT SIZE=3D2>functionality in small steps while watching =
performance.</FONT>
</P>

<P><FONT SIZE=3D2>&gt; Finally the last thing to note for now is that I =
have changed out nearly</FONT>
<BR><FONT SIZE=3D2>&gt; all of the hardware in this box and am =
currently using the following </FONT>
<BR><FONT SIZE=3D2>&gt; components with RedHat 8.0 and iptables =
1.2.7a.</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; AMD K6-450 processor (REPLACED)</FONT>
<BR><FONT SIZE=3D2>&gt; Asus P5A motherboard (REPLACED)</FONT>
<BR><FONT SIZE=3D2>Bad choice. The ASUS P5A can only cache up to 128Mb. =
Try removing some </FONT>
<BR><FONT SIZE=3D2>of the ram modules, in order to only have 128 MB =
installed, and see how </FONT>
<BR><FONT SIZE=3D2>this affects performance. (Note: I'm running a =
firewall on a 512Mbits </FONT>
<BR><FONT SIZE=3D2>internet connection on almost identical hardware =
(P5A, K6-II 300Mhz, </FONT>
<BR><FONT SIZE=3D2>192Mb ram) with over 300 iptables rules, and see =
absolutly no degradation)</FONT>
</P>

<P><FONT SIZE=3D2>&gt; 224Mb PC-100 memory (REPLACED)</FONT>
<BR><FONT SIZE=3D2>&gt; 3 Netgear FA-310TX NICS (REPLACED 3 3Com =
905b-TXNMs and 3 3Com 980C-TXs)</FONT>
<BR><FONT SIZE=3D2>&gt; 1 ATI 8Mb RAGE IIC AGP graphics card (NO X =
console only)</FONT>
<BR><FONT SIZE=3D2>&gt; 1 52X Creative Labs IDE CD-ROM (Secondary =
Master)</FONT>
<BR><FONT SIZE=3D2>&gt; 1 10Gb IBM 7200Rpm HardDrive (Primary master) =
(REPLACED)</FONT>
<BR><FONT SIZE=3D2>&gt; 1 cheap floppy drive 3.5&quot;</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
</P>

<P><FONT SIZE=3D2>What kernel are you running. I really recomment that =
you compile your </FONT>
<BR><FONT SIZE=3D2>own kernel, and minimizing the number of modules =
nessesary by linking </FONT>
<BR><FONT SIZE=3D2>them statically into the kernel. Make sure that you =
optimize for the K6 </FONT>
<BR><FONT SIZE=3D2>architecture.</FONT>
</P>

<P><FONT SIZE=3D2>Also you mention loadbalacing. Is this done by the =
firewall or by some </FONT>
<BR><FONT SIZE=3D2>other hardware?</FONT>
</P>

<P><FONT SIZE=3D2>As a general note to the attached script.</FONT>
<BR><FONT SIZE=3D2>The DMZ rules are really crappy, and it is actually =
not a DMZ.</FONT>
<BR><FONT SIZE=3D2>_Never_ allow packets from the DMZ to the internal =
network.</FONT>
<BR><FONT SIZE=3D2>(Well one might allow SSH, but the should be all.). =
Also do not allow </FONT>
<BR><FONT SIZE=3D2>the machines in the DMZ to have unrestricted access =
to the internet. </FONT>
<BR><FONT SIZE=3D2>Limit it to the services and DNS to specific =
servers.</FONT>
</P>

<P><FONT SIZE=3D2>Hope it helps.</FONT>
</P>

<P><FONT SIZE=3D2>Regards</FONT>
<BR><FONT SIZE=3D2>Anders Fugmann</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C28B24.7140C970--

