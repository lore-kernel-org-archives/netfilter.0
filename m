From: mpdykeman@micron.com
Subject: Netfilter connection management
Date: Mon, 24 Nov 2003 11:25:49 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <040405FAA8D7CD41BCA471B1A3451EE305AA7A@ntxboimbx08.micron.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C3B2B8.6270A160"
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

------_=_NextPart_001_01C3B2B8.6270A160
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I posted a more verbose message and did not get any replies earlier. So
please forgive me if I am appearing a bit clueless.

Is there anyway using Iptables or some other command-line tool to manage
the Netfilter connection hash tables? More specifically, I would like to
be able remove ASSURED connections as a component of a method to cut off
existing connections that are suspect of virus activity. I really don't
want to use a tool like cutter to send RST's...It just seems that it
would be much cleaner to directly manipulate the hash.

Also, I have been noticing some occasional problems with ASSURED entries
possibly disappearing from the Netfilter connection hash (causing a rule
which checks for packets without SYN and not ESTABLISHED to start
dropping packets which kills legitimate connections) and I'm trying to
find a way to log or somehow determine what caused the entry to be
removed....I'm not sure logging RST's or FIN's will locate all reasons
for a table entry drop.

Any assistance or helpful direction someone could provide me would be
appreciated.

Thanx.

-- Markley Dykeman



------_=_NextPart_001_01C3B2B8.6270A160
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.0.6487.1">
<TITLE>Netfilter connection management</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/rtf format -->

<P><FONT SIZE=3D2 FACE=3D"Verdana">Hello,</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Verdana">I posted a more verbose message and =
did not get any replies earlier. So please forgive me if I am appearing =
a bit clueless.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Verdana">Is there anyway using Iptables or =
some other command-line tool to manage the Netfilter connection hash =
tables? More specifically, I would like to be able remove ASSURED =
connections as a component of a method to cut off existing connections =
that are suspect of virus activity. I really don&#8217;t want to use a =
tool like cutter to send RST's&#8230;It just seems that it would be much =
cleaner to directly manipulate the hash.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Verdana">Also, I have been noticing some =
occasional problems with ASSURED entries possibly disappearing from the =
Netfilter connection hash (causing a rule which checks for packets =
without SYN and not ESTABLISHED to start dropping packets which kills =
legitimate connections) and I'm trying to find a way to log or somehow =
determine what caused the entry to be removed&#8230;.I'm not sure =
logging RST's or FIN's will locate all reasons for a table entry =
drop.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Verdana">Any assistance or helpful direction =
someone could provide me would be appreciated.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Verdana">Thanx.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Verdana">-- Markley Dykeman</FONT>
</P>
<BR>

</BODY>
</HTML>
------_=_NextPart_001_01C3B2B8.6270A160--

