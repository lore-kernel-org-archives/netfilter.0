From: "Daniel Beckham" <danbeck-netfilter@dealnews.com>
Subject: Re: DNAT and VPN Tunnel problems, traffic checks in, but doesn't check out
Date: Tue, 4 Mar 2003 15:12:21 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003701c2e292$c219ab80$0a02010a@danbeck>
References: <OF3A1E747D.4950DEAF-ON80256CDF.005A4395@start-global.com> <015401c2e273$31980d00$0a02010a@danbeck> <3E64E9A4.6010008@sqlcomp.com> <003601c2e27f$c7cf49d0$0a02010a@danbeck> <3E64FD61.50107@sqlcomp.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0034_01C2E260.74419CB0"
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
To: Netfilter <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0034_01C2E260.74419CB0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Arrrgh, I take it you don't have any help for me then. =3D)

Daniel

  ----- Original Message -----=20
  From: Steve Reynolds=20
  To: Daniel Beckham=20
  Sent: Tuesday, March 04, 2003 1:24 PM
  Subject: Re: DNAT and VPN Tunnel problems, traffic checks in, but =
doesn't check out


  I saw framing problems similar to what you were seeing last year.  =
really weird.
  thanks
  steve

  Daniel Beckham wrote:

    No.. just 10base-T 10 and 100.

    Daniel
      ----- Original Message -----=20
      From: Steve Reynolds=20
      To: Daniel Beckham=20
      Sent: Tuesday, March 04, 2003 12:00 PM
      Subject: Re: DNAT and VPN Tunnel problems, traffic checks in, but =
doesn't check out


      dumb question. is there any token ring in your network at all.
      thanks
      steve

      Daniel Beckham wrote:

Yeah, I actually DNAT and SNAT private addresses to public addresses on =
the
public interface on the firewall for some of the developers here, so I =
know
that using that SNAT line *should* work, as it does in practice already.

To answer your questions, here is the interface setup on the firewall.

eth0 -- public interface (207.111.175.64/26) to the external router
(internet) and normal traffic from and to the 129.41.69.128/26 subnet =
comes
over this wire
eth1 -- private interface to local network using 10.1.2.0/24 address =
space
tun0 -- a openvpn tunnel between the remote 10.1.1.0/24 network and =
private
10.1.2.0/24 network

The remote network is a private address space behind a router in the =
public
129.41.69.128/26 address space.  The eth0 interface does not =
specifically
listen for traffic from 129.41.69.137, instead it's just the gateway for =
any
external public traffic incoming to the 207.111.175.64/26 subnet.  There =
are
also several eth0:N aliases for local private machines that are =
DNAT/SNAT'ed
to public addresses for different reasons.

I use the following lines to allow all traffic to be forwarded from the
private interface (eth1) and the openvpn tunnel (tun0):
$IPTABLES -A FORWARD -i tun+ -j ACCEPT
$IPTABLES -A FORWARD -i tap+ -j ACCEPT
$IPTABLES -A FORWARD -i eth1 -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

The line for the tap device isn't really necessary for my setup, but it =
is
just there in case I decide to fool with bridging.

As far as I can tell, things should be working correctly.  And the funny
thing is that they do, sort of.  Responses to the DNAT'ed traffic =
initiated
by the client returns over the tunnel, but only part of the response =
traffic
by the client goes back out.  I.e. I can send very tiny emails, but =
nothing
large like a reply.  I can download files via ftp, but can not upload.   =
And
I've confirmed that traffic outgoing from the client is going over the
tunnel.

This is driving me crazy. =3D)

Daniel Beckham
dealnews.com


----- Original Message -----
From: <richardo@start-global.com>
To: "Daniel Beckham" <danbeck-netfilter@dealnews.com>
Sent: Tuesday, March 04, 2003 10:32 AM
Subject: Re: DNAT and VPN Tunnel problems, traffic checks in, but =
doesn't
check out


 =20
Hi Daniel.

The second rule you mention below would be correct and needed for these
connections to work properly, so keep it in there ..... a couple of =
things
I thought about, though ..... .did you setup an alias on the firewall
   =20
box's
 =20
'external' network card to listen for packets destined for 129.41.69.137 =
?
..... as follows :

ifconfig ethWHATEVER:0 129.41.69.137 netmask your.mask.goes.here

... also, what does your filter table look like, is the FORWARD chain
   =20
setup
 =20
correctly to allow the connection through the firewall ?

Regards,
Richard.

Richard Oatridge
Head of IT, Start-global Ltd
http://www.start-global.com
tel :  +44 1564 779297
email : richardo@start-global.com


|--------+----------------------------------->
|        |          "Daniel Beckham"         |
|        |          <danbeck-netfilter@dealne|
|        |          ws.com>                  |
|        |          Sent by:                 |
|        |          netfilter-admin@lists.net|
|        |          filter.org               |
|        |                                   |
|        |                                   |
|        |          04/03/2003 15:29         |
|        |                                   |
|--------+----------------------------------->

-------------------------------------------------------------------------=
--
   =20
----------------------------------------------|
 =20
  |
   =20
|
 =20
  |       To:     "Netfilter" <netfilter@lists.netfilter.org>
   =20
|
 =20
  |       cc:
   =20
|
 =20
  |       Subject:     Re: DNAT and VPN Tunnel problems, traffic checks
   =20
in, but doesn't check out                           |
 =20
-------------------------------------------------------------------------=
--
   =20
----------------------------------------------|
 =20
Thank you for your help, but I don't really understand what you are =
trying
to tell me.  The first config line makes sense and that is similar to =
what
I'm doing now.  Although, I'm not using any specific ports because I'm
testing at the moment.

The second line is confusing though.  Why would I SNAT a 10.1.1.0/24
address
to another 10.1.1.0/24 address?  I was thinking you may have meant a
10.1.2.0/24 address, but that makes even less sense as that is the =
client
trying to connect in the first place.  Also, why would you use a =
10.1.1.7
as
the -d option, the destination address?  Btw, I tried several =
combinations
including your example just for the hell of it, but none of them work. =
=3D)

Something that I did not mention before though is that I have tried =
this:
iptables -t nat -A POSTROUTING -s 10.1.1.7 -p tcp -j SNAT --to
129.41.69.137

I would think this would solve the problem, but this doesn't help.  =
Anyone
else have any ideas?

Thank you for your help,

Daniel Beckham
dealnews.com



----- Original Message -----
From: "Pavan Gokarn" <pavang@techknowledge.ws>
To: "Daniel Beckham" <danbeck-netfilter@dealnews.com>
Sent: Tuesday, March 04, 2003 12:15 AM
Subject: Re: DNAT and VPN Tunnel problems, traffic checks in, but =
doesn't
check out


   =20
yes daniel you'll need a rule to get the packets back from the remote
network back into your network.
these will be the rules substitute them eoth you desired ip addresses
for outgoing connection
# iptables -t nat -A PREROUTING -d 129.41.69.137 -p tcp --dport 25 -j
DNAT --to 10.1.1.7
for incomming replies
# iptables -t nat -A POSTROUTING -d 10.1.1.7 -p tcp --dport 25 -j
     =20
SNAT --to
   =20
10.1.1.something

remember not to allow all types of connections to in and out because
     =20
this
 =20
might cause a security threat. substitute the 10.1.1.something ip
     =20
address
 =20
with the ip that connects/talks to the 10.1.1.7 address.
this might work
hope this was helpful
regards

----- Original Message -----
From: Daniel Beckham <danbeck-netfilter@dealnews.com>
To: <netfilter@lists.netfilter.org>
Sent: Tuesday, March 04, 2003 3:53 AM
Subject: DNAT and VPN Tunnel problems, traffic checks in, but doesn't
     =20
check
   =20
out


     =20
I'm seeing a strange issue with DNAT'ed traffic over a VPN.  Incoming
packets arrive just fine, but outgoing traffic has trouble for large
       =20
streams
     =20
of tcp data.

My setup is fairly simple.   A group of machines on a private network
       =20
behind
     =20
a gateway/firewall (netfilter) connect through an OpenVPN tunnel to a
       =20
remote
     =20
group of machines on a different private network.

Local subnet: 10.1.2.0/24
Remote Subnet 10.1.1.0/24

Client machines on the local subnet can freely talk to servers on the
       =20
remote
     =20
subnet through the vpn with out any problems.

Until the vpn tunnel was functional, client machines on the local
       =20
private
   =20
network connected to mail.dealnews.com to retrieve and send mail, a
       =20
public
   =20
interface of the mail server on the remote private network.  Now that
       =20
the
   =20
vpn is working, they need to retrieve and send mail using the private
address 10.1.1.7.

For several reasons, one being laptop administration, I don't want to
       =20
change
     =20
all of the mail client's ip addresses to 10.1.1.7.  I want to use
       =20
iptables
   =20
to DNAT packets headed for the public mail address (mail.dealnews.com)
       =20
to
   =20
the private mail address 10.1.1.7 so that packets are routed over the
       =20
vpn
   =20
instead of the internet.

This is how I attempted to configure iptables:
iptables -t nat -A PREROUTING -s 10.1.2.10 -d 129.41.69.137 -p all -j
DNAT --to-destination 10.1.1.7

The -s option is there so that I can test the config myself without
       =20
Borking
     =20
the rest of the network.

This seems to work at first as I can see traffic sent from the client
       =20
to
   =20
mail.dealnews.com over the tunnel interface on the remote network.
       =20
What
   =20
happens though, is although that I can connect to the remote mail
       =20
server

   =20
just fine through IMAP and even send out a very small email message
       =20
through
     =20
SMTP, large mail messages just stall and fail.  Ftp is the same way.
       =20
I
 =20
can
     =20
transfer files from the remote server, but I can not send any sizeable
       =20
file
     =20
to the server.  I know for sure that traffic is traveling over the vpn
tunnel because I'm dumping the tunnel interface up at the remote
       =20
network.
   =20
This sounds like something to do with fragmentation or possibly
       =20
something
   =20
along that line of thinking, but I can not for the life of me figure
       =20
out
   =20
what this is.

I wondered if possibly, I needed another rule to DNAT packets coming
       =20
from
   =20
the remote network over the tunnel back to the public
       =20
mail.dealnews.com
 =20
ip
   =20
address:
iptables -t nat -A PREROUTING -s 129.41.69.37 -d 10.1.2.10 -p all -j
DNAT --to-destination 129.41.69.137

But this didn't seem to help anything.

Could anyone help me figure out how I can work around this?  Again,
       =20
incoming
     =20
traffic through the tunnel seems to work just fine, but outgoing
       =20
traffic
   =20
only half seems to work.  As strange as that sounds.

Thanks,

Daniel
dealnews.com




       =20
     =20





   =20







 =20





------=_NextPart_000_0034_01C2E260.74419CB0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE></TITLE>
<META http-equiv=3DContent-Type =
content=3Dtext/html;charset=3DISO-8859-1>
<META content=3D"MSHTML 6.00.2723.2500" name=3DGENERATOR></HEAD>
<BODY bgColor=3D#ffffff>
<DIV>
<DIV><FONT face=3DArial size=3D2>Arrrgh, I take it you don't have any =
help for me=20
then. =3D)<BR><BR>Daniel</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></DIV>
<BLOCKQUOTE=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Dsjr@sqlcomp.com href=3D"mailto:sjr@sqlcomp.com">Steve =
Reynolds</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A=20
  title=3Ddanbeck-netfilter@dealnews.com=20
  href=3D"mailto:danbeck-netfilter@dealnews.com">Daniel Beckham</A> =
</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Tuesday, March 04, 2003 =
1:24=20
  PM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> Re: DNAT and VPN =
Tunnel=20
  problems, traffic checks in, but doesn't check out</DIV>
  <DIV><BR></DIV>I saw framing problems similar to what you were seeing =
last=20
  year. &nbsp;really weird.<BR>thanks<BR>steve<BR><BR>Daniel Beckham =
wrote:<BR>
  <BLOCKQUOTE cite=3Dmid003601c2e27f$c7cf49d0$0a02010a@danbeck =
type=3D"cite">
    <META content=3D"MSHTML 6.00.2723.2500" name=3DGENERATOR>
    <STYLE></STYLE>

    <DIV><FONT face=3DArial size=3D2>No.. just 10base-T 10 and =
100.</FONT></DIV>
    <DIV>&nbsp;</DIV>
    <DIV><FONT face=3DArial size=3D2>Daniel</FONT></DIV>
    <BLOCKQUOTE=20
    style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: rgb(0,0,0) 2px solid; MARGIN-RIGHT: 0px">
      <DIV=20
      style=3D"FONT: 10pt arial; font-stretch: normal; font-size-adjust: =
none">-----=20
      Original Message ----- </DIV>
      <DIV=20
      style=3D"BACKGROUND: rgb(228,228,228) 0% 50%; FONT: 10pt arial; =
font-stretch: normal; font-size-adjust: none"><B>From:</B>=20
      <A title=3Dsjr@sqlcomp.com href=3D"mailto:sjr@sqlcomp.com">Steve =
Reynolds</A>=20
      </DIV>
      <DIV=20
      style=3D"FONT: 10pt arial; font-stretch: normal; font-size-adjust: =
none"><B>To:</B>=20
      <A title=3Ddanbeck-netfilter@dealnews.com=20
      href=3D"mailto:danbeck-netfilter@dealnews.com">Daniel Beckham</A> =
</DIV>
      <DIV=20
      style=3D"FONT: 10pt arial; font-stretch: normal; font-size-adjust: =
none"><B>Sent:</B>=20
      Tuesday, March 04, 2003 12:00 PM</DIV>
      <DIV=20
      style=3D"FONT: 10pt arial; font-stretch: normal; font-size-adjust: =
none"><B>Subject:</B>=20
      Re: DNAT and VPN Tunnel problems, traffic checks in, but doesn't =
check=20
      out</DIV>
      <DIV><BR></DIV>dumb question. is there any token ring in your =
network at=20
      all.<BR>thanks<BR>steve<BR><BR>Daniel Beckham wrote:<BR>
      <BLOCKQUOTE cite=3Dmid015401c2e273$31980d00$0a02010a@danbeck =
type=3D"cite"><PRE wrap=3D"">Yeah, I actually DNAT and SNAT private =
addresses to public addresses on the
public interface on the firewall for some of the developers here, so I =
know
that using that SNAT line *should* work, as it does in practice already.

To answer your questions, here is the interface setup on the firewall.

eth0 -- public interface (207.111.175.64/26) to the external router
(internet) and normal traffic from and to the 129.41.69.128/26 subnet =
comes
over this wire
eth1 -- private interface to local network using 10.1.2.0/24 address =
space
tun0 -- a openvpn tunnel between the remote 10.1.1.0/24 network and =
private
10.1.2.0/24 network

The remote network is a private address space behind a router in the =
public
129.41.69.128/26 address space.  The eth0 interface does not =
specifically
listen for traffic from 129.41.69.137, instead it's just the gateway for =
any
external public traffic incoming to the 207.111.175.64/26 subnet.  There =
are
also several eth0:N aliases for local private machines that are =
DNAT/SNAT'ed
to public addresses for different reasons.

I use the following lines to allow all traffic to be forwarded from the
private interface (eth1) and the openvpn tunnel (tun0):
$IPTABLES -A FORWARD -i tun+ -j ACCEPT
$IPTABLES -A FORWARD -i tap+ -j ACCEPT
$IPTABLES -A FORWARD -i eth1 -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

The line for the tap device isn't really necessary for my setup, but it =
is
just there in case I decide to fool with bridging.

As far as I can tell, things should be working correctly.  And the funny
thing is that they do, sort of.  Responses to the DNAT'ed traffic =
initiated
by the client returns over the tunnel, but only part of the response =
traffic
by the client goes back out.  I.e. I can send very tiny emails, but =
nothing
large like a reply.  I can download files via ftp, but can not upload.   =
And
I've confirmed that traffic outgoing from the client is going over the
tunnel.

This is driving me crazy. =3D)

Daniel Beckham
dealnews.com


----- Original Message -----
From: <A class=3Dmoz-txt-link-rfc2396E =
href=3D"mailto:richardo@start-global.com">&lt;richardo@start-global.com&g=
t;</A>
To: "Daniel Beckham" <A class=3Dmoz-txt-link-rfc2396E =
href=3D"mailto:danbeck-netfilter@dealnews.com">&lt;danbeck-netfilter@deal=
news.com&gt;</A>
Sent: Tuesday, March 04, 2003 10:32 AM
Subject: Re: DNAT and VPN Tunnel problems, traffic checks in, but =
doesn't
check out


  </PRE>
        <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">Hi Daniel.

The second rule you mention below would be correct and needed for these
connections to work properly, so keep it in there ..... a couple of =
things
I thought about, though ..... .did you setup an alias on the firewall
    </PRE></BLOCKQUOTE><PRE wrap=3D""><!---->box's
  </PRE>
        <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">'external' network card =
to listen for packets destined for 129.41.69.137 ?
..... as follows :

ifconfig ethWHATEVER:0 129.41.69.137 netmask your.mask.goes.here

... also, what does your filter table look like, is the FORWARD chain
    </PRE></BLOCKQUOTE><PRE wrap=3D""><!---->setup
  </PRE>
        <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">correctly to allow the =
connection through the firewall ?

Regards,
Richard.

Richard Oatridge
Head of IT, Start-global Ltd
<A class=3Dmoz-txt-link-freetext =
href=3D"http://www.start-global.com">http://www.start-global.com</A>
tel :  +44 1564 779297
email : <A class=3Dmoz-txt-link-abbreviated =
href=3D"mailto:richardo@start-global.com">richardo@start-global.com</A>


|--------+-----------------------------------&gt;
|        |          "Daniel Beckham"         |
|        |          <A class=3Dmoz-txt-link-rfc2396E =
href=3D"mailto:danbeck-netfilter@dealne%7C%7C%7Cws.com">&lt;danbeck-netfi=
lter@dealne|
|        |          ws.com&gt;</A>                  |
|        |          Sent by:                 |
|        |          <A class=3Dmoz-txt-link-abbreviated =
href=3D"mailto:netfilter-admin@lists.net">netfilter-admin@lists.net</A>|
|        |          filter.org               |
|        |                                   |
|        |                                   |
|        |          04/03/2003 15:29         |
|        |                                   |
|--------+-----------------------------------&gt;

-------------------------------------------------------------------------=
--
    </PRE></BLOCKQUOTE><PRE =
wrap=3D""><!---->----------------------------------------------|
  </PRE>
        <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">  |
    </PRE></BLOCKQUOTE><PRE wrap=3D""><!---->|
  </PRE>
        <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">  |       To:     =
"Netfilter" <A class=3Dmoz-txt-link-rfc2396E =
href=3D"mailto:netfilter@lists.netfilter.org">&lt;netfilter@lists.netfilt=
er.org&gt;</A>
    </PRE></BLOCKQUOTE><PRE wrap=3D""><!---->|
  </PRE>
        <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">  |       cc:
    </PRE></BLOCKQUOTE><PRE wrap=3D""><!---->|
  </PRE>
        <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">  |       Subject:     =
Re: DNAT and VPN Tunnel problems, traffic checks
    </PRE></BLOCKQUOTE><PRE wrap=3D""><!---->in, but doesn't check out   =
                        |
  </PRE>
        <BLOCKQUOTE type=3D"cite"><PRE =
wrap=3D"">---------------------------------------------------------------=
------------
    </PRE></BLOCKQUOTE><PRE =
wrap=3D""><!---->----------------------------------------------|
  </PRE>
        <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">Thank you for your =
help, but I don't really understand what you are trying
to tell me.  The first config line makes sense and that is similar to =
what
I'm doing now.  Although, I'm not using any specific ports because I'm
testing at the moment.

The second line is confusing though.  Why would I SNAT a 10.1.1.0/24
address
to another 10.1.1.0/24 address?  I was thinking you may have meant a
10.1.2.0/24 address, but that makes even less sense as that is the =
client
trying to connect in the first place.  Also, why would you use a =
10.1.1.7
as
the -d option, the destination address?  Btw, I tried several =
combinations
including your example just for the hell of it, but none of them work. =
=3D)

Something that I did not mention before though is that I have tried =
this:
iptables -t nat -A POSTROUTING -s 10.1.1.7 -p tcp -j SNAT --to
129.41.69.137

I would think this would solve the problem, but this doesn't help.  =
Anyone
else have any ideas?

Thank you for your help,

Daniel Beckham
dealnews.com



----- Original Message -----
From: "Pavan Gokarn" <A class=3Dmoz-txt-link-rfc2396E =
href=3D"mailto:pavang@techknowledge.ws">&lt;pavang@techknowledge.ws&gt;</=
A>
To: "Daniel Beckham" <A class=3Dmoz-txt-link-rfc2396E =
href=3D"mailto:danbeck-netfilter@dealnews.com">&lt;danbeck-netfilter@deal=
news.com&gt;</A>
Sent: Tuesday, March 04, 2003 12:15 AM
Subject: Re: DNAT and VPN Tunnel problems, traffic checks in, but =
doesn't
check out


    </PRE>
          <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">yes daniel you'll =
need a rule to get the packets back from the remote
network back into your network.
these will be the rules substitute them eoth you desired ip addresses
for outgoing connection
# iptables -t nat -A PREROUTING -d 129.41.69.137 -p tcp --dport 25 -j
DNAT --to 10.1.1.7
for incomming replies
# iptables -t nat -A POSTROUTING -d 10.1.1.7 -p tcp --dport 25 -j
      </PRE></BLOCKQUOTE><PRE wrap=3D"">SNAT --to
    </PRE>
          <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">10.1.1.something

remember not to allow all types of connections to in and out because
      </PRE></BLOCKQUOTE></BLOCKQUOTE><PRE wrap=3D""><!---->this
  </PRE>
        <BLOCKQUOTE type=3D"cite">
          <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">might cause a =
security threat. substitute the 10.1.1.something ip
      </PRE></BLOCKQUOTE></BLOCKQUOTE><PRE wrap=3D""><!---->address
  </PRE>
        <BLOCKQUOTE type=3D"cite">
          <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">with the ip that =
connects/talks to the 10.1.1.7 address.
this might work
hope this was helpful
regards

----- Original Message -----
From: Daniel Beckham <A class=3Dmoz-txt-link-rfc2396E =
href=3D"mailto:danbeck-netfilter@dealnews.com">&lt;danbeck-netfilter@deal=
news.com&gt;</A>
To: <A class=3Dmoz-txt-link-rfc2396E =
href=3D"mailto:netfilter@lists.netfilter.org">&lt;netfilter@lists.netfilt=
er.org&gt;</A>
Sent: Tuesday, March 04, 2003 3:53 AM
Subject: DNAT and VPN Tunnel problems, traffic checks in, but doesn't
      </PRE></BLOCKQUOTE><PRE wrap=3D"">check
    </PRE>
          <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">out


      </PRE>
            <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">I'm seeing a =
strange issue with DNAT'ed traffic over a VPN.  Incoming
packets arrive just fine, but outgoing traffic has trouble for large
        </PRE></BLOCKQUOTE><PRE wrap=3D"">streams
      </PRE>
            <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">of tcp data.

My setup is fairly simple.   A group of machines on a private network
        </PRE></BLOCKQUOTE><PRE wrap=3D"">behind
      </PRE>
            <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">a gateway/firewall =
(netfilter) connect through an OpenVPN tunnel to a
        </PRE></BLOCKQUOTE><PRE wrap=3D"">remote
      </PRE>
            <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">group of machines =
on a different private network.

Local subnet: 10.1.2.0/24
Remote Subnet 10.1.1.0/24

Client machines on the local subnet can freely talk to servers on the
        </PRE></BLOCKQUOTE><PRE wrap=3D"">remote
      </PRE>
            <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">subnet through the =
vpn with out any problems.

Until the vpn tunnel was functional, client machines on the local
        </PRE></BLOCKQUOTE></BLOCKQUOTE><PRE wrap=3D"">private
    </PRE>
          <BLOCKQUOTE type=3D"cite">
            <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">network connected =
to mail.dealnews.com to retrieve and send mail, a
        </PRE></BLOCKQUOTE></BLOCKQUOTE><PRE wrap=3D"">public
    </PRE>
          <BLOCKQUOTE type=3D"cite">
            <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">interface of the =
mail server on the remote private network.  Now that
        </PRE></BLOCKQUOTE></BLOCKQUOTE><PRE wrap=3D"">the
    </PRE>
          <BLOCKQUOTE type=3D"cite">
            <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">vpn is working, =
they need to retrieve and send mail using the private
address 10.1.1.7.

For several reasons, one being laptop administration, I don't want to
        </PRE></BLOCKQUOTE><PRE wrap=3D"">change
      </PRE>
            <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">all of the mail =
client's ip addresses to 10.1.1.7.  I want to use
        </PRE></BLOCKQUOTE></BLOCKQUOTE><PRE wrap=3D"">iptables
    </PRE>
          <BLOCKQUOTE type=3D"cite">
            <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">to DNAT packets =
headed for the public mail address (mail.dealnews.com)
        </PRE></BLOCKQUOTE></BLOCKQUOTE><PRE wrap=3D"">to
    </PRE>
          <BLOCKQUOTE type=3D"cite">
            <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">the private mail =
address 10.1.1.7 so that packets are routed over the
        </PRE></BLOCKQUOTE></BLOCKQUOTE><PRE wrap=3D"">vpn
    </PRE>
          <BLOCKQUOTE type=3D"cite">
            <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">instead of the =
internet.

This is how I attempted to configure iptables:
iptables -t nat -A PREROUTING -s 10.1.2.10 -d 129.41.69.137 -p all -j
DNAT --to-destination 10.1.1.7

The -s option is there so that I can test the config myself without
        </PRE></BLOCKQUOTE><PRE wrap=3D"">Borking
      </PRE>
            <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">the rest of the =
network.

This seems to work at first as I can see traffic sent from the client
        </PRE></BLOCKQUOTE></BLOCKQUOTE><PRE wrap=3D"">to
    </PRE>
          <BLOCKQUOTE type=3D"cite">
            <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">mail.dealnews.com =
over the tunnel interface on the remote network.
        </PRE></BLOCKQUOTE></BLOCKQUOTE><PRE wrap=3D"">What
    </PRE>
          <BLOCKQUOTE type=3D"cite">
            <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">happens though, is =
although that I can connect to the remote mail
        </PRE></BLOCKQUOTE></BLOCKQUOTE><PRE wrap=3D"">server

    </PRE>
          <BLOCKQUOTE type=3D"cite">
            <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">just fine through =
IMAP and even send out a very small email message
        </PRE></BLOCKQUOTE><PRE wrap=3D"">through
      </PRE>
            <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">SMTP, large mail =
messages just stall and fail.  Ftp is the same way.
        </PRE></BLOCKQUOTE></BLOCKQUOTE></BLOCKQUOTE><PRE =
wrap=3D""><!---->I
  </PRE>
        <BLOCKQUOTE type=3D"cite">
          <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">can
      </PRE>
            <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">transfer files from =
the remote server, but I can not send any sizeable
        </PRE></BLOCKQUOTE><PRE wrap=3D"">file
      </PRE>
            <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">to the server.  I =
know for sure that traffic is traveling over the vpn
tunnel because I'm dumping the tunnel interface up at the remote
        </PRE></BLOCKQUOTE></BLOCKQUOTE><PRE wrap=3D"">network.
    </PRE>
          <BLOCKQUOTE type=3D"cite">
            <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">This sounds like =
something to do with fragmentation or possibly
        </PRE></BLOCKQUOTE></BLOCKQUOTE><PRE wrap=3D"">something
    </PRE>
          <BLOCKQUOTE type=3D"cite">
            <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">along that line of =
thinking, but I can not for the life of me figure
        </PRE></BLOCKQUOTE></BLOCKQUOTE><PRE wrap=3D"">out
    </PRE>
          <BLOCKQUOTE type=3D"cite">
            <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">what this is.

I wondered if possibly, I needed another rule to DNAT packets coming
        </PRE></BLOCKQUOTE></BLOCKQUOTE><PRE wrap=3D"">from
    </PRE>
          <BLOCKQUOTE type=3D"cite">
            <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">the remote network =
over the tunnel back to the public
        </PRE></BLOCKQUOTE></BLOCKQUOTE></BLOCKQUOTE><PRE =
wrap=3D""><!---->mail.dealnews.com
  </PRE>
        <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">ip
    </PRE>
          <BLOCKQUOTE type=3D"cite">
            <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">address:
iptables -t nat -A PREROUTING -s 129.41.69.37 -d 10.1.2.10 -p all -j
DNAT --to-destination 129.41.69.137

But this didn't seem to help anything.

Could anyone help me figure out how I can work around this?  Again,
        </PRE></BLOCKQUOTE><PRE wrap=3D"">incoming
      </PRE>
            <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">traffic through the =
tunnel seems to work just fine, but outgoing
        </PRE></BLOCKQUOTE></BLOCKQUOTE><PRE wrap=3D"">traffic
    </PRE>
          <BLOCKQUOTE type=3D"cite">
            <BLOCKQUOTE type=3D"cite"><PRE wrap=3D"">only half seems to =
work.  As strange as that sounds.

Thanks,

Daniel
dealnews.com




        </PRE></BLOCKQUOTE><PRE wrap=3D"">      </PRE></BLOCKQUOTE><PRE =
wrap=3D"">




    </PRE></BLOCKQUOTE><PRE wrap=3D""><!---->






  =
</PRE></BLOCKQUOTE><BR></BLOCKQUOTE></BLOCKQUOTE><BR></BLOCKQUOTE></BODY>=
</HTML>

------=_NextPart_000_0034_01C2E260.74419CB0--



