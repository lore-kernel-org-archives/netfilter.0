From: "Anderson, Ray" <rsa@prideindustries.com>
Subject: RE: Messages to console
Date: Tue, 19 Aug 2003 07:48:06 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <9FEBBE3B5C27D311B0B90050041E59B003F32F7C@ziggy.prideindustries.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="Boundary_(ID_wAfTs/+H0FcN8+477F60Yg)"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-return: allowed
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "Len L." <len@euler.com>, netfilter@lists.netfilter.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--Boundary_(ID_wAfTs/+H0FcN8+477F60Yg)
Content-type: text/plain

I have a RedHat 9 box, and this problem haunted me for MONTHS.....

The way I found to fix it (Thanks to Bryan - bryanp@visi.com) was to modify
the syslog in /etc/sysconfig/

The man page says that anything UNDER the given number will be shown on the
console, but I've found that anything equal to the number or below will spew
to the console, so I added -c 3 (instead of 4 as man suggests) to the
KLOGD_OPTIONS line:

KLOGD_OPTIONS="-x -c 3"

I also changed the syslog file in /etc/rc.d/init.d just for good measure.

My console logging has since stopped.

-=Ray
---------------------------------------
As a fighter pilot I knew from my own experiences how decisive surprise and
luck can be for a success, which in the long run only comes to the one who
combines daring with cool thinking.
Lt. General Adolph Galland, Luftwaffe

-----Original Message-----
From: Len L. [mailto:len@euler.com] 
Sent: Monday, August 18, 2003 3:29 PM
To: netfilter@lists.netfilter.org
Subject: Messages to console


Hey guys,

Not a killer, but I get all the iptable log messages to /dev/console.  I can
not find where to control this.  I checked /etc/syslog.conf, but kernal
messages was turned off (in fact if I turn kernal logging on I get duplicate
messages to the console).  I also did man on iptables, but I do not see any
reference to logging to /dev/console 

Can anyone point me in the right direction?

--Boundary_(ID_wAfTs/+H0FcN8+477F60Yg)
Content-type: text/html
Content-transfer-encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2654.45">
<TITLE>RE: Messages to console</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>I have a RedHat 9 box, and this problem haunted me =
for MONTHS.....</FONT>
</P>

<P><FONT SIZE=3D2>The way I found to fix it (Thanks to Bryan - =
bryanp@visi.com) was to modify the syslog in /etc/sysconfig/</FONT>
</P>

<P><FONT SIZE=3D2>The man page says that anything UNDER the given =
number will be shown on the console, but I've found that anything equal =
to the number or below will spew to the console, so I added -c 3 =
(instead of 4 as man suggests) to the KLOGD_OPTIONS line:</FONT></P>

<P><FONT SIZE=3D2>KLOGD_OPTIONS=3D&quot;-x -c 3&quot;</FONT>
</P>

<P><FONT SIZE=3D2>I also changed the syslog file in /etc/rc.d/init.d =
just for good measure.</FONT>
</P>

<P><FONT SIZE=3D2>My console logging has since stopped.</FONT>
</P>

<P><FONT SIZE=3D2>-=3DRay</FONT>
<BR><FONT SIZE=3D2>---------------------------------------</FONT>
<BR><FONT SIZE=3D2>As a fighter pilot I knew from my own experiences =
how decisive surprise and luck can be for a success, which in the long =
run only comes to the one who combines daring with cool =
thinking.</FONT></P>

<P><FONT SIZE=3D2>Lt. General Adolph Galland, Luftwaffe</FONT>
</P>

<P><FONT SIZE=3D2>-----Original Message-----</FONT>
<BR><FONT SIZE=3D2>From: Len L. [<A =
HREF=3D"mailto:len@euler.com">mailto:len@euler.com</A>] </FONT>
<BR><FONT SIZE=3D2>Sent: Monday, August 18, 2003 3:29 PM</FONT>
<BR><FONT SIZE=3D2>To: netfilter@lists.netfilter.org</FONT>
<BR><FONT SIZE=3D2>Subject: Messages to console</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>Hey guys,</FONT>
</P>

<P><FONT SIZE=3D2>Not a killer, but I get all the iptable log messages =
to /dev/console.&nbsp; I can not find where to control this.&nbsp; I =
checked /etc/syslog.conf, but kernal messages was turned off (in fact =
if I turn kernal logging on I get duplicate messages to the =
console).&nbsp; I also did man on iptables, but I do not see any =
reference to logging to /dev/console </FONT></P>

<P><FONT SIZE=3D2>Can anyone point me in the right direction?</FONT>
</P>

</BODY>
</HTML>=

--Boundary_(ID_wAfTs/+H0FcN8+477F60Yg)--

