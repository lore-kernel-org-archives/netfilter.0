From: "Benjamin Dickgiesser" <benjamin@dickgiesser.net>
Subject: AW: Firewall workaround
Date: Fri, 16 Jan 2004 18:45:21 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <357895CFC8CB7C44900D6A4F46D08AA90459CF@exchangeserver.IAT.local>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C3DC58.838B537B"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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

------_=_NextPart_001_01C3DC58.838B537B
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I don't know much about ssh forwarding, but I don't think it would be =
very useful in my case.
As far as I know you have to specify the server ip for a port to =
forward.
I want to be able to connect to any server on any port.
=20
Please correct me if I'am wrong.
=20
Thanks!

________________________________

Von: netfilter-admin@lists.netfilter.org im Auftrag von Alexis
Gesendet: Fr 16.01.2004 18:03
An: netfilter
Betreff: Re: Firewall workaround



most of the IM's today will try first it traditional ports, then 80,
then 443, then 23 , then 25.
Not using some tunneling of forwarding mechanism like ssh, just a single
connection trough this port.

I know ssh could forward ports, but in this case, you need the other end
where to forward the port :)



On Fri, 2004-01-16 at 13:54, Antony Stone wrote:
> On Friday 16 January 2004 4:38 pm, Alexis wrote:
>
> > using port 80 may work too.
>
> But SSH is designed to support port forwarding - it's part of the =
standard
> operation.   On port 80 you'd have to come up with some mechanism of =
your own
> and make it work.
>
> Antony.
>
> > On Fri, 2004-01-16 at 13:15, Antony Stone wrote:
> > > On Friday 16 January 2004 4:01 pm, Benjamin Dickgiesser wrote:
> > > > It would be realy nice if someone could help me with this:
> > > >
> > > > Situation:
> > > > I am useing a Windows XP PC at a student hall. To connect to the
> > > > internet I am useing the university connection. Unfortunatly =
there are
> > > > only around 5 open ports (80,21,22,23,6667).
> > > > My aim is to make a work around to this firewall.
> > >
> > > I'm not sure that's an appropriate quesion to ask on a security =
mailing
> > > list, but I guess you're right in assuming that this is a place to =
find
> > > people who know how to do it :)
> > >
> > > Anyway, my answer to your question is: why not just tunnel the =
protocols
> > > you want through SSH port forwarding?
> > >
> > > Antony
--
Alexis <alexis@attla.net.ar>







------_=_NextPart_001_01C3DC58.838B537B
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">=0A=
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">=0A=
<HTML>=0A=
<HEAD>=0A=
=0A=
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.5.6944.0">=0A=
<TITLE>Re: Firewall workaround</TITLE>=0A=
</HEAD>=0A=
<BODY>=0A=
<DIV id=3DidOWAReplyText91554 dir=3Dltr>=0A=
<DIV dir=3Dltr><FONT color=3D#000000></FONT><FONT face=3DArial =
size=3D2>I don't know =0A=
much about ssh forwarding, but I don't think it would be very useful in =
my =0A=
case.</FONT></DIV>=0A=
<DIV dir=3Dltr><FONT face=3DArial size=3D2>As far as I know you have to =
specify the =0A=
server ip for a port to forward.</FONT></DIV>=0A=
<DIV dir=3Dltr><FONT face=3DArial size=3D2>I want to be able to connect =
to any server =0A=
on any port.</FONT></DIV><FONT face=3DArial size=3D2></FONT></DIV>=0A=
<DIV dir=3Dltr><FONT face=3DArial size=3D2></FONT><FONT face=3DArial =0A=
size=3D2></FONT>&nbsp;</DIV>=0A=
<DIV dir=3Dltr><FONT face=3DArial size=3D2>Please correct me if I'am =0A=
wrong.</FONT></DIV>=0A=
<DIV dir=3Dltr><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>=0A=
<DIV dir=3Dltr><FONT face=3DArial size=3D2>Thanks!</FONT></DIV>=0A=
<DIV dir=3Dltr><BR></DIV>=0A=
<DIV dir=3Dltr>=0A=
<HR tabIndex=3D-1>=0A=
</DIV>=0A=
<DIV dir=3Dltr><FONT face=3DTahoma size=3D2><B>Von:</B> =0A=
netfilter-admin@lists.netfilter.org im Auftrag von =
Alexis<BR><B>Gesendet:</B> Fr =0A=
16.01.2004 18:03<BR><B>An:</B> netfilter<BR><B>Betreff:</B> Re: Firewall =0A=
workaround<BR></FONT><BR></DIV>=0A=
<DIV>=0A=
<P><FONT size=3D2>most of the IM's today will try first it traditional =
ports, then =0A=
80,<BR>then 443, then 23 , then 25.<BR>Not using some tunneling of =
forwarding =0A=
mechanism like ssh, just a single<BR>connection trough this =
port.<BR><BR>I know =0A=
ssh could forward ports, but in this case, you need the other =
end<BR>where to =0A=
forward the port :)<BR><BR><BR><BR>On Fri, 2004-01-16 at 13:54, Antony =
Stone =0A=
wrote:<BR>&gt; On Friday 16 January 2004 4:38 pm, Alexis =
wrote:<BR>&gt;<BR>&gt; =0A=
&gt; using port 80 may work too.<BR>&gt;<BR>&gt; But SSH is designed to =
support =0A=
port forwarding - it's part of the standard<BR>&gt; =
operation.&nbsp;&nbsp; On =0A=
port 80 you'd have to come up with some mechanism of your own<BR>&gt; =
and make =0A=
it work.<BR>&gt;<BR>&gt; Antony.<BR>&gt;<BR>&gt; &gt; On Fri, 2004-01-16 =
at =0A=
13:15, Antony Stone wrote:<BR>&gt; &gt; &gt; On Friday 16 January 2004 =
4:01 pm, =0A=
Benjamin Dickgiesser wrote:<BR>&gt; &gt; &gt; &gt; It would be realy =
nice if =0A=
someone could help me with this:<BR>&gt; &gt; &gt; &gt;<BR>&gt; &gt; =
&gt; &gt; =0A=
Situation:<BR>&gt; &gt; &gt; &gt; I am useing a Windows XP PC at a =
student hall. =0A=
To connect to the<BR>&gt; &gt; &gt; &gt; internet I am useing the =
university =0A=
connection. Unfortunatly there are<BR>&gt; &gt; &gt; &gt; only around 5 =
open =0A=
ports (80,21,22,23,6667).<BR>&gt; &gt; &gt; &gt; My aim is to make a =
work around =0A=
to this firewall.<BR>&gt; &gt; &gt;<BR>&gt; &gt; &gt; I'm not sure =
that's an =0A=
appropriate quesion to ask on a security mailing<BR>&gt; &gt; &gt; list, =
but I =0A=
guess you're right in assuming that this is a place to find<BR>&gt; &gt; =
&gt; =0A=
people who know how to do it :)<BR>&gt; &gt; &gt;<BR>&gt; &gt; &gt; =
Anyway, my =0A=
answer to your question is: why not just tunnel the protocols<BR>&gt; =
&gt; &gt; =0A=
you want through SSH port forwarding?<BR>&gt; &gt; &gt;<BR>&gt; &gt; =
&gt; =0A=
Antony<BR>--<BR>Alexis =0A=
&lt;alexis@attla.net.ar&gt;<BR><BR><BR><BR><BR></FONT></P></DIV>=0A=
=0A=
</BODY>=0A=
</HTML>
------_=_NextPart_001_01C3DC58.838B537B--

