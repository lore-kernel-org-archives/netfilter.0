From: "Ryan Beisner" <ryanb@thedataarc.com>
Subject: re: WAP11 through router
Date: Wed, 18 Sep 2002 16:31:45 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0d3901c25f5a$c9de9c60$64dc0a0a@dataarc>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0D36_01C25F30.E0E88940"
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

This is a multi-part message in MIME format.

------=_NextPart_000_0D36_01C25F30.E0E88940
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


How about this:

    Ext IF eth1 IP 10.20.0.3 (insignificant unnecessary info for this =
config)
    Ext IF eth1:1 Virtual IP 10.20.0.4
    Int IF eth0 IP 192.168.168.1   =20

I want a one-to-one bidirectional NAT map from 10.20.0.4 to =
192.168.168.178 for all ports.  I will explicitly allow and deny =
protocols later.  Again, this is already behind a firewall in my =
corporation.  The goal is to make 10.20.0.4 a full "representative" of =
my WAP11.  Security is taken care of elsewhere with the firebox.    =3D  =
)

Using IPTRAF, I can see the request coming through, but the answer =
doesn't make it out.  I'm just not figuring that out.  Thanks again, I =
really appreciate any help you can provide.

-Ryan Beisner





On Wednesday 18 September 2002 9:44 pm, Ryan Beisner wrote:

> Hi All!
>
> I have a Linksys WAP11 behind a high speed connection.
>
> Here's the scenario:
>
>     INT (eth0) IP Range ( 192.168.168.1 class C )
>     EXT (eth1) IP Range also private ( 10.20.0.3 class B )
>     EXT (eth1:1) Virtual IP is 10.20.0.4
>
> I want to map everything from Virt IP (Eth1:1) 10.20.0.4 (all ports) =
to
> internal 192.168.168.178 (the Linksys WAP 11).  FYI this is for remote
> management of my access point.
>
> Here was my first attempt, which did not work.  I explicitly allow all
> traffic in/out/fwd for 10.20.0.4 to make sure I wasn't kicking myself =
here.
>  Still no go.  Suggestions?
>
>     ""iptables -A PREROUTING -t nat -d 10.20.0.4 -j DNAT --to
> 192.168.168.178""

The PREROUTING rule looks good.

However, remember that by the time packets reach the FORWARD chain, the=20
PREROUTING rule has already NATted them, so you need to allow packets =
for=20
192.168.168.178 through netfilter, not packets for 10.20.0.4.....

Also, you say you want to do this for "remote management of the access=20
point", so why do you want to map *all* ports ?   Surely there's only a =
very=20
few ways of managing the AP: telnet, snmp, http - any others ?

Antony.

--=20

If at first you don't succeed, destroy all the evidence that you tried.


------=_NextPart_000_0D36_01C25F30.E0E88940
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2614.3500" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>How about this:</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; Ext IF eth1 IP =
10.20.0.3=20
(insignificant unnecessary info for this =
config)</FONT></DIV></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; Ext IF eth1:1 =
Virtual IP=20
10.20.0.4</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; Int IF eth0 IP=20
192.168.168.1&nbsp;&nbsp;&nbsp; </FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I want a one-to-one bidirectional NAT =
map from=20
10.20.0.4 to 192.168.168.178 for all ports.&nbsp; I will explicitly =
allow and=20
deny protocols later.&nbsp; Again, this is already behind a firewall in =
my=20
corporation.&nbsp; The goal is to make 10.20.0.4 a full "representative" =
of my=20
WAP11.&nbsp; Security is taken care of elsewhere with the=20
firebox.&nbsp;&nbsp;&nbsp; =3D&nbsp; )</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Using IPTRAF, I can see the request =
coming through,=20
but the answer doesn't make it out.&nbsp; I'm just not figuring that =
out.&nbsp;=20
Thanks again, I really appreciate any help you can provide.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>-Ryan Beisner</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>On Wednesday 18 September 2002 9:44 pm, =
Ryan=20
Beisner wrote:<BR><BR>&gt;<I> Hi All!<BR></I>&gt;<I><BR></I>&gt;<I> I =
have a=20
Linksys WAP11 behind a high speed =
connection.<BR></I>&gt;<I><BR></I>&gt;<I>=20
Here's the =
scenario:<BR></I>&gt;<I><BR></I>&gt;<I>&nbsp;&nbsp;&nbsp;&nbsp; INT=20
(eth0) IP Range ( 192.168.168.1 class C =
)<BR></I>&gt;<I>&nbsp;&nbsp;&nbsp;&nbsp;=20
EXT (eth1) IP Range also private ( 10.20.0.3 class B=20
)<BR></I>&gt;<I>&nbsp;&nbsp;&nbsp;&nbsp; EXT (eth1:1) Virtual IP is=20
10.20.0.4<BR></I>&gt;<I><BR></I>&gt;<I> I want to map everything from =
Virt IP=20
(Eth1:1) 10.20.0.4 (all ports) to<BR></I>&gt;<I> internal =
192.168.168.178 (the=20
Linksys WAP 11).&nbsp; FYI this is for remote<BR></I>&gt;<I> management =
of my=20
access point.<BR></I>&gt;<I><BR></I>&gt;<I> Here was my first attempt, =
which did=20
not work.&nbsp; I explicitly allow all<BR></I>&gt;<I> traffic in/out/fwd =
for=20
10.20.0.4 to make sure I wasn't kicking myself =
here.<BR></I>&gt;<I>&nbsp; Still=20
no go.&nbsp; =
Suggestions?<BR></I>&gt;<I><BR></I>&gt;<I>&nbsp;&nbsp;&nbsp;&nbsp;=20
""iptables -A PREROUTING -t nat -d 10.20.0.4 -j DNAT --to<BR></I>&gt;<I> =

192.168.168.178""<BR></I><BR>The PREROUTING rule looks =
good.<BR><BR>However,=20
remember that by the time packets reach the FORWARD chain, the =
<BR>PREROUTING=20
rule has already NATted them, so you need to allow packets for=20
<BR>192.168.168.178 through netfilter, not packets for=20
10.20.0.4.....<BR><BR>Also, you say you want to do this for "remote =
management=20
of the access <BR>point", so why do you want to map *all* ports =
?&nbsp;&nbsp;=20
Surely there's only a very <BR>few ways of managing the AP: telnet, =
snmp, http -=20
any others ?<BR><BR>Antony.<BR><BR>-- <BR><BR>If at first you don't =
succeed,=20
destroy all the evidence that you tried.<BR></FONT></DIV></BODY></HTML>

------=_NextPart_000_0D36_01C25F30.E0E88940--



