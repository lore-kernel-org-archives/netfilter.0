From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: Netfilter connection management
Date: Tue, 25 Nov 2003 08:45:00 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311251645.hAPGjNiu032437@server5.bandwidthco.com>
References: <040405FAA8D7CD41BCA471B1A3451EE305AA7A@ntxboimbx08.micron.com>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0012_01C3B330.69A5C6E0"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <040405FAA8D7CD41BCA471B1A3451EE305AA7A@ntxboimbx08.micron.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: mpdykeman@micron.com, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0012_01C3B330.69A5C6E0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Well I'm certainly no smatter than Jeff, but I will offer you an answer
based on what I would do if I were to attempt what you are trying to do.
First of all, and someone will surely correct me if I'm wrong here, I don
not beleive IPTables offers any built-in means to manipulate the connection
tables from user space.  However, there is a very nice free tool (perl
script) out there called Conntrack Viewer (get it here
http://cv.intellos.net/) which reads and formats netfilter connection
tables.  You could simply write an additional perl script which continually
calls, refreshes, and parses the output of Conntrack Viewer, looking for the
desired connection states.  When one is found, because perl can do so well
what perl does, cutter then could be called to deal with this connection.  I
know this isn't exactly what you are looking for, but it should get the job
done.

  _____  

From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of
mpdykeman@micron.com
Sent: Monday, November 24, 2003 10:26 AM
To: netfilter@lists.netfilter.org
Subject: Netfilter connection management



Hello, 

I posted a more verbose message and did not get any replies earlier. So
please forgive me if I am appearing a bit clueless.

Is there anyway using Iptables or some other command-line tool to manage the
Netfilter connection hash tables? More specifically, I would like to be able
remove ASSURED connections as a component of a method to cut off existing
connections that are suspect of virus activity. I really don't want to use a
tool like cutter to send RST's.It just seems that it would be much cleaner
to directly manipulate the hash.

Also, I have been noticing some occasional problems with ASSURED entries
possibly disappearing from the Netfilter connection hash (causing a rule
which checks for packets without SYN and not ESTABLISHED to start dropping
packets which kills legitimate connections) and I'm trying to find a way to
log or somehow determine what caused the entry to be removed..I'm not sure
logging RST's or FIN's will locate all reasons for a table entry drop.

Any assistance or helpful direction someone could provide me would be
appreciated. 

Thanx. 

-- Markley Dykeman 



------=_NextPart_000_0012_01C3B330.69A5C6E0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>Netfilter connection management</TITLE>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<META content=3D"MSHTML 6.00.2800.1264" name=3DGENERATOR></HEAD>
<BODY>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D391213016-25112003><FONT =
face=3DArial=20
color=3D#0000ff size=3D2>Well I'm certainly no smatter than Jeff, but I =
will offer=20
you an answer based on what I would do if I were to attempt what you are =
trying=20
to do.&nbsp; First of all, and someone will surely correct me if I'm =
wrong here,=20
I don not beleive IPTables offers any built-in means to&nbsp;manipulate =
the=20
connection tables from user space.&nbsp; However, there is a very nice =
free tool=20
(perl script) out there called Conntrack Viewer (get it here <A=20
href=3D"http://cv.intellos.net/">http://cv.intellos.net/</A>) which =
reads and=20
formats&nbsp;netfilter connection tables.&nbsp; You could simply write =
an=20
additional perl script which continually calls, refreshes, and =
parses&nbsp;the=20
output of Conntrack Viewer, looking for the desired connection =
states.&nbsp;=20
When one is found, because perl can do so well what perl does, cutter =
then could=20
be called to deal with this connection.&nbsp; I know this isn't exactly =
what you=20
are looking for, but it should get the job done.</FONT></SPAN></DIV><BR>
<DIV class=3DOutlookMessageHeader lang=3Den-us dir=3Dltr align=3Dleft>
<HR tabIndex=3D-1>
<FONT face=3DTahoma size=3D2><B>From:</B> =
netfilter-admin@lists.netfilter.org=20
[mailto:netfilter-admin@lists.netfilter.org] <B>On Behalf Of=20
</B>mpdykeman@micron.com<BR><B>Sent:</B> Monday, November 24, 2003 10:26 =

AM<BR><B>To:</B> netfilter@lists.netfilter.org<BR><B>Subject:</B> =
Netfilter=20
connection management<BR></FONT><BR></DIV>
<DIV></DIV><!-- Converted from text/rtf format -->
<P><FONT face=3DVerdana size=3D2>Hello,</FONT> </P>
<P><FONT face=3DVerdana size=3D2>I posted a more verbose message and did =
not get any=20
replies earlier. So please forgive me if I am appearing a bit=20
clueless.</FONT></P>
<P><FONT face=3DVerdana size=3D2>Is there anyway using Iptables or some =
other=20
command-line tool to manage the Netfilter connection hash tables? More=20
specifically, I would like to be able remove ASSURED connections as a =
component=20
of a method to cut off existing connections that are suspect of virus =
activity.=20
I really don&#8217;t want to use a tool like cutter to send =
RST's&#8230;It just seems that=20
it would be much cleaner to directly manipulate the hash.</FONT></P>
<P><FONT face=3DVerdana size=3D2>Also, I have been noticing some =
occasional problems=20
with ASSURED entries possibly disappearing from the Netfilter connection =
hash=20
(causing a rule which checks for packets without SYN and not ESTABLISHED =
to=20
start dropping packets which kills legitimate connections) and I'm =
trying to=20
find a way to log or somehow determine what caused the entry to be =
removed&#8230;.I'm=20
not sure logging RST's or FIN's will locate all reasons for a table =
entry=20
drop.</FONT></P>
<P><FONT face=3DVerdana size=3D2>Any assistance or helpful direction =
someone could=20
provide me would be appreciated.</FONT> </P>
<P><FONT face=3DVerdana size=3D2>Thanx.</FONT> </P>
<P><FONT face=3DVerdana size=3D2>-- Markley Dykeman</FONT> =
</P><BR></BODY></HTML>

------=_NextPart_000_0012_01C3B330.69A5C6E0--



