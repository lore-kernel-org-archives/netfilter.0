From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: Fwd: VoIP conntrack issue
Date: Wed, 14 Nov 2012 03:09:51 +0200
Message-ID: <50A2EF5F.9040904@ngtech.co.il>
References: <CABY2qi9ge+3jkt5ePM-iZU2XycBic6orCvjF63WArCvjWPS4og@mail.gmail.com> <201211122202.02082.neal.p.murphy@alum.wpi.edu> <CABY2qi9-dYnr8AkTmoeQZgbxM02T=OFw0-FKZoyt+_N6xHuJgA@mail.gmail.com> <50A213B1.4050601@ngtech.co.il> <CABY2qi86ntiYHDzaSeyEwy8vVSy8z8gc+uc8B8EANvya7m6f8w@mail.gmail.com> <50A2A903.3050702@ngtech.co.il> <CABY2qi8w6eDME-OUYM_5Y8Pk63TxBudoHkC54EdzHtuEwQGjZQ@mail.gmail.com> <CABY2qi9s0b1Ztbg7uj=H+YU4eac0K2uxD3qwtT0XpvcvhWsyrA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CABY2qi9s0b1Ztbg7uj=H+YU4eac0K2uxD3qwtT0XpvcvhWsyrA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?J=F6rn_Krebs?= <jk@smartbyte.de>
Cc: netfilter <netfilter@vger.kernel.org>

Hey J=F6rn,

As I mentioned before you seems to not understand the NAT and MASQUERAD=
E=20
meanings fully.

NAT is only allowing to the router take in account that specific sessio=
n=20
was meant for specific client in the LAN.
means: 192.168.1.38 tries to connect from port 3899 to 1.1.1.1 port 338=
8=20
the router\NAT when will get response  to specific port
then IT will choose(free to choose what it has and like) will then=20
forward into LAN ip 192.168.1.38 to port 3899.
What you expect to get is something else not related to STUN or=20
NAT(SNAT) but more DNAT or PORT-FORWARDING.
since the asterisk was contacted it will send back to the port it got=20
the connection from 1030 which is what was expected and it's not a magi=
c.
When asterisk tells the GMX server to try send you the data the only=20
problem is that you dont have corresponding session established with=20
your client
which will cause the NAT to not know a thing about it.

The solution is to use DNAT for the specific port forwarding or add UPN=
P=20
service to your linux box that will do it for you.

Regards,
Eliezer


On 11/14/2012 12:49 AM, J=F6rn Krebs wrote:
 >
 > Hi,
 >
 > the mailing list is not accepting HTML mails, that's why I am sendin=
g=20
you this directly, as I hope this helps you to understand my problem.
 >
 > ---------- Forwarded message ----------
 > From: J=F6rn Krebs <jk@smartbyte.de>
 > Date: Wed, Nov 14, 2012 at 9:43 AM
 > Subject: Re: VoIP conntrack issue
 > To: netfilter <netfilter@vger.kernel.org>
 >
 >
 > Thanks, I really liked your answer that was very helpfull:
 >
 > I try to explain a few more things to make my situation a bit cleare=
r:
 > First I have my nice little Android phone (192.168.1.38 here).
 > That phone operates in different places, like work, home, customer,=20
etc, so I need one config that fits all
 > (that's a big problem I know, but I think I solved it for most=20
places, except my own home network,
 > which is very odd, as this is the network I am the admin in, and I=20
can configure everything...)
 >
 > O.K. so, in this case 192.168.1.38 is my Android phone with CSIPSimp=
le.
 > My PC/router at home is my old linux system, with kernel 3.4.7, so=20
fairly recent.
 > My home network is 192.168.1.0/24
 > And the public IP address of my home system is: 114.XX.234.123
 > (That system has two network cards, one internal and one external.=20
But this system is a router only, I don't want to have any asterisk=20
server on that system!)
 >
 > The I have a public Xen VoIP Asterisk server, which actually does a=20
good job for me: The public IP address is: 122.XX.115.203
 >
 > And then there is my German VoIP-PSTN-Provider I use to actually do=20
phone calls to landlines. (GMX).
 > GMX uses a different IP-address everytime, depending on the region=20
you call. So I cannot put static rules in my iptables config.
 >
 > I live in Australia, and what I try to achieve is NOT to route the=20
RTP traffic through the Asterisk server (which does work perfectly by=20
the way), because of the extra delay I have with it).
 > I would like Asterisk to just do the SIP stuff, and when it comes to=
=20
the RTP traffic, I want that RTP traffic to go directly from my Android=
=20
device to GMX, or any other VoIP provider (I actually have about 5=20
different providers, not just GMX)
 > But most traffic goes over GMX, so it is my aim to get direct RTP=20
working with GMX.
 >
 > I don't want to include the conntrack log again, as this doesn't see=
m=20
to help explaining the issue.
 > So I try it in text form here, as this mailing list doesn't allow an=
y=20
HTML code, so I cannot show that in a graphic.
 >
 > Here is a list of different connections that are used in this case=20
(the log I show here is from my linux router box 114.XXXXXXX/192.168.1.=
1):
 > 1) STUN: My phone connects to the STUN server stun.sipgate.net via=20
UDP on ports 44608 and 57890, which is shown in the conntrack log as as=
sured
 > Phone (src Port 44608) ----------> Router (src Port 44608)=20
----------> STUN Server
 > Phone (src Port 57890) ----------> Router (src Port 57890)=20
----------> STUN Server
 > (STUN Server (dst Port 44608) ----------> Router (src Port 44608)=20
----------> Phone)
 > (STUN Server (dst Port 57890) ----------> Router (dst Port 57890)=20
----------> Phone)
 >
 >
 > 2) SIP: My Android phone connects to the Asterisk server on the SIP=20
ports (not shown here, as this works fine)
 > Phone (src Port 5092) ----------> Router (src Port 5092) ---------->=
=20
SIP Server
 > (SIP Server (dst Port 5092) ----------> Router (dst Port 5092)=20
----------> Phone)
 >
 > 3) RTP1: My SIP Server tries to send the RTP traffic back to the=20
Android phone (initialised from the SIP protocol) to port 44608 (that's=
=20
the same port that has been used by my phone to connect to the STUN=20
server !), but that doesn't work, because conntrack/netfilter has mappe=
d=20
the port 44608, that my phone uses as the src port, to src port 1030 at=
=20
the router.
 > Asterisk (DST Port 44608) ----------> Router (DST Port 44608)=20
------FAILS---->
 > Phone    (SRC Port 44608) ----------> Router (SRC 1030) ---------->=20
Asterisk
 > (Asterisk, very intelligent "sees" that wrong port mapping, and=20
rectifies it!!!)
 > Asterisk (DST Port 1030) ----------> Router (DST 1030) ---------->=20
Phone (44608)
 >
 > And this is the important point: Why does linux does a port mapping=20
here? why can't linux just use the same src port externaly that my phon=
e=20
uses as the src port (44608), when sending data to my asterisk box?
 > It re-maps the port my phone uses from 44608 (192.168.1.38) to=20
external port 1030 (external IP router 114.XXX.XXX.XXX).
 > (But as I said here, because asterisk is pretty intelligent it "sees=
"=20
that and rectifies it's ports. My phone says via the SIP protocol: "I a=
m=20
on port 44608, please connect me there", but the actual connection from=
=20
my phone to the asterisk server comes from port 1030, because my linux=20
box does a (in my opinion wrong) port mapping), so asterisk rectifies=20
the dst port from 44608 to 1030, and lives with that. And it works!
 >
 > 4) RTP2: Now Asterisk tries to "switch" the RTP stream and not be "i=
n=20
the middle" anymore, and tells GMX to NOT send the RTP data to the=20
asterisk server anymore, but to the router (the Phone). But because thi=
s=20
is a new connection, asterisk assumes, that this port mapping of port=20
44608 to 1030 is for the Asterisk VoIP server only and tells GMX to use=
=20
the RTP port 44608 that my Phone is using as it's src port for sending=20
RTP audio data. At the same time my phone gets the same inmormation,=20
"Please send the RTP stream directly to the GMX server Port dst port=20
(35642).
 > Phone (DST Port 35642, SRC Port 44608) ----------> Router (DST Port=20
35642, SRC Port 1030)   ----------> GMX (WORKS!) (But one way audio=20
onlye, because:)
 > GMX   (SRC Port 35642, DST Port 44608) ----------> Router (SRC Port=20
35642, DST Port 44608) -----FAILS!----->
 >
 > See the clash here: The connection should be between: GMX Port 35642=
=20
<-----> Phone Port 44608
 > But because linux is in between and does a port mapping that=20
connection fails, as linux remaps port 44608 of the port to external=20
port 1030,
 >
 > Is that clearer now?
 > Here is a summary of the UDP connections again (see FAILS for the=20
errors I have because of the wrong port mapping linux does):
 > Phone (src Port 44608) ----------> Router (src Port 44608)=20
----------> STUN Server
 > (STUN Server (dst Port 44608) ----------> Router (src Port 44608)=20
----------> Phone)
 > Phone (src Port 57890) ----------> Router (src Port 57890)=20
----------> STUN Server
 > (STUN Server (dst Port 57890) ----------> Router (dst Port 57890)=20
----------> Phone)
 > Phone (src Port 5092) ----------> Router (src Port 5092) ---------->=
=20
SIP Server
 > (SIP Server (dst Port 5092) ----------> Router (dst Port 5092)=20
----------> Phone)
 > Asterisk (DST Port 44608) ----------> Router (DST Port 44608)=20
------FAILS---->
 > Phone    (SRC Port 44608) ----------> Router (SRC 1030) ---------->=20
Asterisk
 > Asterisk (DST Port 1030) ----------> Router (DST 1030) ---------->=20
Phone (44608)
 > Phone (SRC Port 44608) ----------> Router (SRC 1030) ----------> Ast=
erisk
 > GMX   (SRC Port 35642, DST Port 44608) ----------> Router (DST 44608=
)=20
-----FAILS!----->
 >
 > Please let me know, if you have other questions.
 > As I said, I can only post Text Mails to this mailing list, so I=20
cannot provide any nice pictures.
 > I tried my best to provide text-graphics.
 >
 > Thanks, Joern.
 >
 > The conntrack log in a more readable form (hope it comes through):
 >
 > # Here is the STUN-Part
 > [NEW] 192.168.1.38:44608      -> 216.93.246.14:3478 |=20
216.93.246.14:3478 -> 114.XX.234.123:44608
 > [NEW] 192.168.1.38:57890      -> 216.93.246.14:3478 |=20
216.93.246.14:3478 -> 114.XX.234.123:57890
 > [UPDATE] 192.168.1.38:44608 -> 216.93.246.14:3478 |=20
216.93.246.14:3478 -> 114.XX.234.123:44608 [ASSURED]
 > [UPDATE] 192.168.1.38:57890 -> 216.93.246.14:3478 |=20
216.93.246.14:3478 -> 114.XX.234.123:57890 [ASSURED]
 > # STUN ended - Two connections assureds, ports: 44608 and 57890
 >
 > # Now we try to connect to the VoIP Server source port 44608 and 578=
90
 > ( this might be some ICE related thing, I cannot explain, why my
 > client does it, but that's actually not the problem.
 > [NEW] 122.XX.115.203:10020 -> 114.XX.234.123 44608 |=20
114.XX.234.123:44608 -> 122.XX.115.203:10020 [UNREPLIED]
 > [NEW] 192.168.1.38:57890    -> 122.XX.115.203:10021 |=20
122.XX.115.203:10021 -> 114.XX.234.123:57890 [UNREPLIED]
 > # !!!!!!! Look here !!!!!!! That's where it starts! Why do we have a
 > port mapping here???
 > [NEW] 192.168.1.38:44608     -> 122.XX.115.203:10020 |=20
122.XX.115.203:10020 -> 114.XX.234.123:1030 [UNREPLIED]
 > # And from that point on it goes down the drain!
 > # Se the port mapping to port 1030!!!???!!!! Why?!
 > [UPDATE] 192.168.1.38:44608 -> 122.XX.115.203:10020 |=20
122.XX.115.203:10020 -> 114.XX.234.123:1030
 > [UPDATE] 192.168.1.38:44608 -> 122.XX.115.203:10020 |=20
122.XX.115.203:10020 -> 114.XX.234.123:1030 [ASSURED]
 > # The connection is assured, because Asterisk is basically listening
 > to everything on that port and changes the port it send the data bac=
k
 > # But my VoIP Provider is not that intelligent. :-((( See the follow=
ing
 > [NEW] 192.168.1.38:44608   -> 62.52.147.185:35642  |=20
62.52.147.185:35642   ->114.XX.234.123:1030 [UNREPLIED]
 > [NEW] 62.52.147.185:35642 -> 114.XX.234.123:44608 |=20
114.XX.234.123:44608 -> 62.52.147.185:35642 [UNREPLIED]
 > [NEW] 62.52.147.185:44609 -> 114.XX.234.123:44609 |=20
114.XX.234.123:44609 -> 62.52.147.185:35643 [UNREPLIED]
 > [NEW] 192.168.1.38:57890   -> 62.52.147.185:35643  |=20
62.52.147.185:35643   -> 114.XX.234.123:57890 [UNREPLIED]
 >
 > On Wed, Nov 14, 2012 at 7:09 AM, Eliezer Croitoru=20
<eliezer@ngtech.co.il> wrote:
 >
 >     Hi J=F6rn,
 >
 >     You must first understand that you description is kind of vague=20
on what the actual network setup is and you are just referring to=20
specific things in the whole picture which what leads every reader to=20
another conclusion.
 >
 >     I will try to write you the question that I still dont know the=20
answer for:
 >     what is the network path of the packets?(routing)
 >     Where is this NAT happening?
 >     I will give you an example that can clear up what We need to try=
=20
to help you stay focused:
 >     http://wiki.squid-cache.org/ConfigExamples/UbuntuTproxy4Wccp2#To=
plogy
 >
 >     The above diagram shows and describes path and network diagram i=
n=20
a way that seems to me good.
 >
 >     192.168.1.38 sends packet to?
 >     what external IP this router use? 114.XX.234.123 ?
 >     if the IP of the asterisk server is:  122.XX.115.203 then what=20
nat? to what direction? on what machine?
 >     If it's a xen host that hosts the asterisk server I would say=20
it's one of the bad choices ever(from my experience) to host VOIP serve=
r.
 >     The whole question you are asking looks very weird from the=20
conntrack output.
 >
 >     From netfilter\technial point of view fire-walling is not NAT in=
=20
any way while they both use some common modules.
 >     (I dont know how much you know so I am now on the "syn-ack" part=
=20
of the question from you to make sure we get the connection right and o=
n=20
the same src,dst logic)
 >
 >     If you do host any SIP service behind a firewall and\or nat you=20
should be explicit on what is allowed to the direction of the SIP serve=
r.
 >
 >     I still dont understand how you managed to capture all this=20
conntrack (topology+machines) data on the same machine.
 >
 >     If you do have problem with this specific part:
 >
 >     > # The connection is assured, because Asterisk is basically=20
listening
 >     > to everything on that port and changes the port it send the=20
data back
 >     > # But my VoIP Provider is not that intelligent. :-((( See the=20
following
 >     > [NEW] 192.168.1.38:44608 -> 62.52.147.185:35642  |=20
62.52.147.185:35642
 >     > ->114.XX.234.123:1030 [UNREPLIED]
 >     > [NEW] 62.52.147.185:35642 -> 114.XX.234.123:44608 |
 >     > 114.XX.234.123:44608 -> 62.52.147.185:35642 [UNREPLIED]
 >     > [NEW] 62.52.147.185:44609 -> 114.XX.234.123:44609 |
 >     > 114.XX.234.123:44609 -> 62.52.147.185:35643 [UNREPLIED]
 >     > [NEW] 192.168.1.38:57890 -> 62.52.147.185:35643 |=20
62.52.147.185:35643
 >     > -> 114.XX.234.123:57890 [UNREPLIED]
 >
 >     You should configure the RTP and SIP settings right.
 >     how exactly the VOIP phone "192.168.1.38" contacts the PSTN=20
provider "62.52.147.185" and why?(make it clear so I and others can=20
understand the situation)
 >     If you do have Asterisk server then this server should contact=20
the SIP\PSTN provider and not the SIP phone.
 >
 >     The stun should be and should only be related to the external=20
connections from the phone to a server in the internet.
 >     Any other stuff should be static as possible to assure that the=20
service will WORK.
 >
 >     You have mentioned:
 >
 >     /sbin/iptables -t nat -A POSTROUTING -j MASQUERADE -s 192.168.0.=
0/16
 >     before which is not any mechanism of symmetric nat but more of=20
snat(source nat).
 >
 >     NAT can never assure you symmetric port to port mapping and=20
especially when you are natting more then 1000 hosts.
 >     There is a great possibility that in such a wide NAT size you=20
will have problems.
 >     two clients can use somehow the same port in the same time.
 >
 >     My recommendation is that IF you can use even simple routing=20
tunnel(IPIP\GRE) to avoid nat just use it.
 >     it's simple to setup and supported on any linux distribution I=20
know of.
 >
 >     (all the above is based on that I didnt understood the network=20
infrastructure and is a speculation only until I will know more)
 >
 >     You can always contact me on my personal email to send me data=20
you dont want to publish on the public lists.
 >
 >
 >     Best Regards,
 >     Eliezer
 >
 >
 >     On 11/13/2012 1:42 PM, J=F6rn Krebs wrote:
 >
 >         Hi Eliezer,
 >
 >         I think your comment is a bit offensive, yes I understand ho=
w NAT
 >         works, and yes I know what STUN does,
 >         but in this case it is the NAT firewall who does some=20
unneeded Port mapping!
 >
 >         Setup:
 >         External IP: 114.XX.234.123
 >         Local Network : 192.168.1.0/24 -> Internal VoIP Phone:=20
192.168.1.38
 >         STUN Server: 216.93.246.14
 >         Asterisk Server: 122.XX.115.203
 >         VoIP-PSTN Provider: 62.52.147.185
 >
 >         And what I do is:
 >         Call a number on my Asterisk Server, who then reroutes the=20
call / the
 >         RTP stream directly to my VoIP Phone.
 >         (I tried directmedia and directrtpsetup, both do not work,=20
because
 >         netfilter/conntrack does a port mapping.)
 >
 >         I though you might be able to read this out of my first=20
email, but to
 >         be honest, it was very hard to read,
 >         that's why I shortened the conntrack -E log and made it a bi=
t=20
more
 >         readable, and attach it here:
 >=20
-----------------------------------------------------------------------=
----------------------------------------------------------------
 >         # Here is the STUN-Part
 >         [NEW] 192.168.1.38:44608 -> 216.93.246.14:3478 |=20
216.93.246.14:3478 ->
 >         114.XX.234.123:44608
 >         [NEW] 192.168.1.38:57890 -> 216.93.246.14:3478 |=20
216.93.246.14:3478 ->
 >         114.XX.234.123:57890
 >         [UPDATE] 192.168.1.38:44608 -> 216.93.246.14:3478 |=20
216.93.246.14:3478
 >         -> 114.XX.234.123:44608 [ASSURED]
 >         [UPDATE] 192.168.1.38:57890 -> 216.93.246.14:3478 |=20
216.93.246.14:3478
 >         -> 114.XX.234.123:57890 [ASSURED]
 >         # STUN ended - Two connections assureds, ports: 44608 and 57=
890
 >
 >         # Now we try to connect to the VoIP Server source port 44608=
=20
and 57890
 >         ( this might be some ICE related thing, I cannot explain, wh=
y my
 >         client does it, but that's actually not the problem.
 >         [NEW] 122.XX.115.203:10020 -> 114.XX.234.123 44608 |
 >         114.XX.234.123:44608 -> 122.XX.115.203:10020 [UNREPLIED]
 >         [NEW] 192.168.1.38:57890 -> 122.XX.115.203:10021 |
 >         122.XX.115.203:10021 -> 114.XX.234.123:57890 [UNREPLIED]
 >         # !!!!!!! Look here !!!!!!! That's where it starts! Why do w=
e=20
have a
 >         port mapping here???
 >         [NEW] 192.168.1.38:44608 -> 122.XX.115.203:10020 |
 >         122.XX.115.203:10020 -> 114.XX.234.123:1030 [UNREPLIED]
 >         # And from that point on it goes down the drain!
 >         # Se the port mapping to port 1030!!!???!!!! Why?!
 >         [UPDATE] 192.168.1.38:44608 -> 122.XX.115.203:10020 |
 >         122.XX.115.203:10020 -> 114.XX.234.123:1030
 >         [UPDATE] 192.168.1.38:44608 -> 122.XX.115.203:10020 |
 >         122.XX.115.203:10020 -> 114.XX.234.123:1030 [ASSURED]
 >         # The connection is assured, because Asterisk is basically=20
listening
 >         to everything on that port and changes the port it send the=20
data back
 >         # But my VoIP Provider is not that intelligent. :-((( See th=
e=20
following
 >         [NEW] 192.168.1.38:44608 -> 62.52.147.185:35642  |=20
62.52.147.185:35642
 >         ->114.XX.234.123:1030 [UNREPLIED]
 >         [NEW] 62.52.147.185:35642 -> 114.XX.234.123:44608 |
 >         114.XX.234.123:44608 -> 62.52.147.185:35642 [UNREPLIED]
 >         [NEW] 62.52.147.185:44609 -> 114.XX.234.123:44609 |
 >         114.XX.234.123:44609 -> 62.52.147.185:35643 [UNREPLIED]
 >         [NEW] 192.168.1.38:57890 -> 62.52.147.185:35643 |=20
62.52.147.185:35643
 >         -> 114.XX.234.123:57890 [UNREPLIED]
 >=20
-----------------------------------------------------------------------=
--------------------------------------------------------------
 >         As you can see, half way through ( Underneath my !!!!!!!!=20
comment)
 >         conntrack/netfilter, linux does a port mapping, and does not=
=20
use the
 >         internal port 44608, but mapps the port to port 1030, for=20
whatever
 >         reason.
 >         I am pretty sure this port-mapping is unneeded, and it messe=
s=20
up my
 >         VoIP calls, as the providers are thinking my external port i=
s=20
44608
 >         (that's the port the device uses), but linux maps it to port=
=20
1030.
 >         Can anyone technically explain to me why conntrack/netfilter=
 does
 >         this? Why can't netfilter just do a second mapping (first=20
mapping was
 >         the one from the STUN connection, line 3)?
 >
 >         This is not a symmetrical NAT!
 >
 >         And please I do my best to explain this, if you need more=20
info or you
 >         don't understand my explanation, I am willing to give more=20
detailed
 >         info, or explain it in a different way, but don't be offensi=
ve,
 >         please.
 >
 >         Thanks.
 >
 >
 >
 >     --
 >     Eliezer Croitoru
 >     https://www1.ngtech.co.il
 >     IT consulting for Nonprofit organizations
 >     eliezer <at> ngtech.co.il
 >
 >
 >
 >
 >
 > --
 > Bye Bye, J=F6rn Krebs
 > --------------------------------------------
 > 64 Queen St., Blackstone 4304
 > Phone: +61731363381
 > Mobile: +61431068955
 > Telefon: +495516345347

--=20
Eliezer Croitoru
https://www1.ngtech.co.il
IT consulting for Nonprofit organizations
eliezer <at> ngtech.co.il



On 11/14/2012 12:51 AM, J=F6rn Krebs wrote:
> Thanks, I really liked your answer that was very helpfull:
>
> I try to explain a few more things to make my situation a bit clearer=
:
> First I have my nice little Android phone (192.168.1.38 here).
> That phone operates in different places, like work, home, customer,
> etc, so I need one config that fits all
> (that's a big problem I know, but I think I solved it for most places=
,
> except my own home network,
> which is very odd, as this is the network I am the admin in, and I ca=
n
> configure everything...)
>
> O.K. so, in this case 192.168.1.38 is my Android phone with CSIPSimpl=
e.
> My PC/router at home is my old linux system, with kernel 3.4.7, so
> fairly recent.
> My home network is 192.168.1.0/24
> And the public IP address of my home system is: 114.XX.234.123
> (That system has two network cards, one internal and one external. Bu=
t
> this system is a router only, I don't want to have any asterisk serve=
r
> on that system!)
>
> The I have a public Xen VoIP Asterisk server, which actually does a
> good job for me: The public IP address is: 122.XX.115.203
>
> And then there is my German VoIP-PSTN-Provider I use to actually do
> phone calls to landlines. (GMX).
> GMX uses a different IP-address everytime, depending on the region yo=
u
> call. So I cannot put static rules in my iptables config.
>
> I live in Australia, and what I try to achieve is NOT to route the RT=
P
> traffic through the Asterisk server (which does work perfectly by the
> way), because of the extra delay I have with it).
> I would like Asterisk to just do the SIP stuff, and when it comes to
> the RTP traffic, I want that RTP traffic to go directly from my
> Android device to GMX, or any other VoIP provider (I actually have
> about 5 different providers, not just GMX)
> But most traffic goes over GMX, so it is my aim to get direct RTP
> working with GMX.
>
> I don't want to include the conntrack log again, as this doesn't seem
> to help explaining the issue.
> So I try it in text form here, as this mailing list doesn't allow any
> HTML code, so I cannot show that in a graphic.
>
> Here is a list of different connections that are used in this case
> (the log I show here is from my linux router box
> 114.XXXXXXX/192.168.1.1):
> 1) STUN: My phone connects to the STUN server stun.sipgate.net via UD=
P
> on ports 44608 and 57890, which is shown in the conntrack log as
> assured
> Phone (src Port 44608) ----------> Router (src Port 44608) ----------=
>
> STUN Server
> Phone (src Port 57890) ----------> Router (src Port 57890) ----------=
>
> STUN Server
> (STUN Server (dst Port 44608) ----------> Router (src Port 44608)
> ----------> Phone)
> (STUN Server (dst Port 57890) ----------> Router (dst Port 57890)
> ----------> Phone)
>
>
> 2) SIP: My Android phone connects to the Asterisk server on the SIP
> ports (not shown here, as this works fine)
> Phone (src Port 5092) ----------> Router (src Port 5092) ----------> =
SIP Server
> (SIP Server (dst Port 5092) ----------> Router (dst Port 5092)
> ----------> Phone)
>
> 3) RTP1: My SIP Server tries to send the RTP traffic back to the
> Android phone (initialised from the SIP protocol) to port 44608
> (that's the same port that has been used by my phone to connect to th=
e
> STUN server !), but that doesn't work, because conntrack/netfilter ha=
s
> mapped the port 44608, that my phone uses as the src port, to src por=
t
> 1030 at the router.
> Asterisk (DST Port 44608) ----------> Router (DST Port 44608) ------F=
AILS---->
> Phone    (SRC Port 44608) ----------> Router (SRC 1030) ----------> A=
sterisk
> (Asterisk, very intelligent "sees" that wrong port mapping, and recti=
fies it!!!)
> Asterisk (DST Port 1030) ----------> Router (DST 1030) ----------> Ph=
one (44608)
>
> And this is the important point: Why does linux does a port mapping
> here? why can't linux just use the same src port externaly that my
> phone uses as the src port (44608), when sending data to my asterisk
> box?
> It re-maps the port my phone uses from 44608 (192.168.1.38) to
> external port 1030 (external IP router 114.XXX.XXX.XXX).
> (But as I said here, because asterisk is pretty intelligent it "sees"
> that and rectifies it's ports. My phone says via the SIP protocol: "I
> am on port 44608, please connect me there", but the actual connection
> from my phone to the asterisk server comes from port 1030, because my
> linux box does a (in my opinion wrong) port mapping), so asterisk
> rectifies the dst port from 44608 to 1030, and lives with that. And i=
t
> works!
>
> 4) RTP2: Now Asterisk tries to "switch" the RTP stream and not be "in
> the middle" anymore, and tells GMX to NOT send the RTP data to the
> asterisk server anymore, but to the router (the Phone). But because
> this is a new connection, asterisk assumes, that this port mapping of
> port 44608 to 1030 is for the Asterisk VoIP server only and tells GMX
> to use the RTP port 44608 that my Phone is using as it's src port for
> sending RTP audio data. At the same time my phone gets the same
> inmormation, "Please send the RTP stream directly to the GMX server
> Port dst port (35642).
> Phone (DST Port 35642, SRC Port 44608) ----------> Router (DST Port
> 35642, SRC Port 1030)   ----------> GMX (WORKS!) (But one way audio
> onlye, because:)
> GMX   (SRC Port 35642, DST Port 44608) ----------> Router (SRC Port
> 35642, DST Port 44608) -----FAILS!----->
>
> See the clash here: The connection should be between: GMX Port 35642
> <-----> Phone Port 44608
> But because linux is in between and does a port mapping that
> connection fails, as linux remaps port 44608 of the port to external
> port 1030,
>
> Is that clearer now?
> Here is a summary of the UDP connections again (see FAILS for the
> errors I have because of the wrong port mapping linux does):
> Phone (src Port 44608) ----------> Router (src Port 44608) ----------=
>
> STUN Server
> (STUN Server (dst Port 44608) ----------> Router (src Port 44608)
> ----------> Phone)
> Phone (src Port 57890) ----------> Router (src Port 57890) ----------=
>
> STUN Server
> (STUN Server (dst Port 57890) ----------> Router (dst Port 57890)
> ----------> Phone)
> Phone (src Port 5092) ----------> Router (src Port 5092) ----------> =
SIP Server
> (SIP Server (dst Port 5092) ----------> Router (dst Port 5092)
> ----------> Phone)
> Asterisk (DST Port 44608) ----------> Router (DST Port 44608) ------F=
AILS---->
> Phone    (SRC Port 44608) ----------> Router (SRC 1030) ----------> A=
sterisk
> Asterisk (DST Port 1030) ----------> Router (DST 1030) ----------> Ph=
one (44608)
> Phone (SRC Port 44608) ----------> Router (SRC 1030) ----------> Aste=
risk
> GMX   (SRC Port 35642, DST Port 44608) ----------> Router (DST 44608)
> -----FAILS!----->
>
> Please let me know, if you have other questions.
> As I said, I can only post Text Mails to this mailing list, so I
> cannot provide any nice pictures.
> I tried my best to provide text-graphics.
>
> Thanks, Joern.
>
> The conntrack log in a more readable form (hope it comes through):
>
> # Here is the STUN-Part
> [NEW] 192.168.1.38:44608      -> 216.93.246.14:3478 |
> 216.93.246.14:3478 -> 114.XX.234.123:44608
> [NEW] 192.168.1.38:57890      -> 216.93.246.14:3478 |
> 216.93.246.14:3478 -> 114.XX.234.123:57890
> [UPDATE] 192.168.1.38:44608 -> 216.93.246.14:3478 | 216.93.246.14:347=
8
> -> 114.XX.234.123:44608 [ASSURED]
> [UPDATE] 192.168.1.38:57890 -> 216.93.246.14:3478 | 216.93.246.14:347=
8
> -> 114.XX.234.123:57890 [ASSURED]
> # STUN ended - Two connections assureds, ports: 44608 and 57890
>
> # Now we try to connect to the VoIP Server source port 44608 and 5789=
0
> ( this might be some ICE related thing, I cannot explain, why my
> client does it, but that's actually not the problem.
> [NEW] 122.XX.115.203:10020 -> 114.XX.234.123 44608 |
> 114.XX.234.123:44608 -> 122.XX.115.203:10020 [UNREPLIED]
> [NEW] 192.168.1.38:57890    -> 122.XX.115.203:10021 |
> 122.XX.115.203:10021 -> 114.XX.234.123:57890 [UNREPLIED]
> # !!!!!!! Look here !!!!!!! That's where it starts! Why do we have a
> port mapping here???
> [NEW] 192.168.1.38:44608     -> 122.XX.115.203:10020 |
> 122.XX.115.203:10020 -> 114.XX.234.123:1030 [UNREPLIED]
> # And from that point on it goes down the drain!
> # Se the port mapping to port 1030!!!???!!!! Why?!
> [UPDATE] 192.168.1.38:44608 -> 122.XX.115.203:10020 |
> 122.XX.115.203:10020 -> 114.XX.234.123:1030
> [UPDATE] 192.168.1.38:44608 -> 122.XX.115.203:10020 |
> 122.XX.115.203:10020 -> 114.XX.234.123:1030 [ASSURED]
> # The connection is assured, because Asterisk is basically listening
> to everything on that port and changes the port it send the data back
> # But my VoIP Provider is not that intelligent. :-((( See the followi=
ng
> [NEW] 192.168.1.38:44608   -> 62.52.147.185:35642  |
> 62.52.147.185:35642   ->114.XX.234.123:1030 [UNREPLIED]
> [NEW] 62.52.147.185:35642 -> 114.XX.234.123:44608 |
> 114.XX.234.123:44608 -> 62.52.147.185:35642 [UNREPLIED]
> [NEW] 62.52.147.185:44609 -> 114.XX.234.123:44609 |
> 114.XX.234.123:44609 -> 62.52.147.185:35643 [UNREPLIED]
> [NEW] 192.168.1.38:57890   -> 62.52.147.185:35643  |
> 62.52.147.185:35643   -> 114.XX.234.123:57890 [UNREPLIED]
>
> On Wed, Nov 14, 2012 at 7:09 AM, Eliezer Croitoru <eliezer@ngtech.co.=
il> wrote:
>>
>> Hi J=F6rn,
>>
>> You must first understand that you description is kind of vague on w=
hat the actual network setup is and you are just referring to specific =
things in the whole picture which what leads every reader to another co=
nclusion.
>>
>> I will try to write you the question that I still dont know the answ=
er for:
>> what is the network path of the packets?(routing)
>> Where is this NAT happening?
>> I will give you an example that can clear up what We need to try to =
help you stay focused:
>> http://wiki.squid-cache.org/ConfigExamples/UbuntuTproxy4Wccp2#Toplog=
y
>>
>> The above diagram shows and describes path and network diagram in a =
way that seems to me good.
>>
>> 192.168.1.38 sends packet to?
>> what external IP this router use? 114.XX.234.123 ?
>> if the IP of the asterisk server is:  122.XX.115.203 then what nat? =
to what direction? on what machine?
>> If it's a xen host that hosts the asterisk server I would say it's o=
ne of the bad choices ever(from my experience) to host VOIP server.
>> The whole question you are asking looks very weird from the conntrac=
k output.
>>
>>  From netfilter\technial point of view fire-walling is not NAT in an=
y way while they both use some common modules.
>> (I dont know how much you know so I am now on the "syn-ack" part of =
the question from you to make sure we get the connection right and on t=
he same src,dst logic)
>>
>> If you do host any SIP service behind a firewall and\or nat you shou=
ld be explicit on what is allowed to the direction of the SIP server.
>>
>> I still dont understand how you managed to capture all this conntrac=
k (topology+machines) data on the same machine.
>>
>> If you do have problem with this specific part:
>>
>>> # The connection is assured, because Asterisk is basically listenin=
g
>>> to everything on that port and changes the port it send the data ba=
ck
>>> # But my VoIP Provider is not that intelligent. :-((( See the follo=
wing
>>> [NEW] 192.168.1.38:44608 -> 62.52.147.185:35642  | 62.52.147.185:35=
642
>>> ->114.XX.234.123:1030 [UNREPLIED]
>>> [NEW] 62.52.147.185:35642 -> 114.XX.234.123:44608 |
>>> 114.XX.234.123:44608 -> 62.52.147.185:35642 [UNREPLIED]
>>> [NEW] 62.52.147.185:44609 -> 114.XX.234.123:44609 |
>>> 114.XX.234.123:44609 -> 62.52.147.185:35643 [UNREPLIED]
>>> [NEW] 192.168.1.38:57890 -> 62.52.147.185:35643 | 62.52.147.185:356=
43
>>> -> 114.XX.234.123:57890 [UNREPLIED]
>>
>> You should configure the RTP and SIP settings right.
>> how exactly the VOIP phone "192.168.1.38" contacts the PSTN provider=
 "62.52.147.185" and why?(make it clear so I and others can understand =
the situation)
>> If you do have Asterisk server then this server should contact the S=
IP\PSTN provider and not the SIP phone.
>>
>> The stun should be and should only be related to the external connec=
tions from the phone to a server in the internet.
>> Any other stuff should be static as possible to assure that the serv=
ice will WORK.
>>
>> You have mentioned:
>>
>> /sbin/iptables -t nat -A POSTROUTING -j MASQUERADE -s 192.168.0.0/16
>> before which is not any mechanism of symmetric nat but more of snat(=
source nat).
>>
>> NAT can never assure you symmetric port to port mapping and especial=
ly when you are natting more then 1000 hosts.
>> There is a great possibility that in such a wide NAT size you will h=
ave problems.
>> two clients can use somehow the same port in the same time.
>>
>> My recommendation is that IF you can use even simple routing tunnel(=
IPIP\GRE) to avoid nat just use it.
>> it's simple to setup and supported on any linux distribution I know =
of.
>>
>> (all the above is based on that I didnt understood the network infra=
structure and is a speculation only until I will know more)
>>
>> You can always contact me on my personal email to send me data you d=
ont want to publish on the public lists.
>>
>>
>> Best Regards,
>> Eliezer
>>
>>
>> On 11/13/2012 1:42 PM, J=F6rn Krebs wrote:
>>>
>>> Hi Eliezer,
>>>
>>> I think your comment is a bit offensive, yes I understand how NAT
>>> works, and yes I know what STUN does,
>>> but in this case it is the NAT firewall who does some unneeded Port=
 mapping!
>>>
>>> Setup:
>>> External IP: 114.XX.234.123
>>> Local Network : 192.168.1.0/24 -> Internal VoIP Phone: 192.168.1.38
>>> STUN Server: 216.93.246.14
>>> Asterisk Server: 122.XX.115.203
>>> VoIP-PSTN Provider: 62.52.147.185
>>>
>>> And what I do is:
>>> Call a number on my Asterisk Server, who then reroutes the call / t=
he
>>> RTP stream directly to my VoIP Phone.
>>> (I tried directmedia and directrtpsetup, both do not work, because
>>> netfilter/conntrack does a port mapping.)
>>>
>>> I though you might be able to read this out of my first email, but =
to
>>> be honest, it was very hard to read,
>>> that's why I shortened the conntrack -E log and made it a bit more
>>> readable, and attach it here:
>>> -------------------------------------------------------------------=
--------------------------------------------------------------------
>>> # Here is the STUN-Part
>>> [NEW] 192.168.1.38:44608 -> 216.93.246.14:3478 | 216.93.246.14:3478=
 ->
>>> 114.XX.234.123:44608
>>> [NEW] 192.168.1.38:57890 -> 216.93.246.14:3478 | 216.93.246.14:3478=
 ->
>>> 114.XX.234.123:57890
>>> [UPDATE] 192.168.1.38:44608 -> 216.93.246.14:3478 | 216.93.246.14:3=
478
>>> -> 114.XX.234.123:44608 [ASSURED]
>>> [UPDATE] 192.168.1.38:57890 -> 216.93.246.14:3478 | 216.93.246.14:3=
478
>>> -> 114.XX.234.123:57890 [ASSURED]
>>> # STUN ended - Two connections assureds, ports: 44608 and 57890
>>>
>>> # Now we try to connect to the VoIP Server source port 44608 and 57=
890
>>> ( this might be some ICE related thing, I cannot explain, why my
>>> client does it, but that's actually not the problem.
>>> [NEW] 122.XX.115.203:10020 -> 114.XX.234.123 44608 |
>>> 114.XX.234.123:44608 -> 122.XX.115.203:10020 [UNREPLIED]
>>> [NEW] 192.168.1.38:57890 -> 122.XX.115.203:10021 |
>>> 122.XX.115.203:10021 -> 114.XX.234.123:57890 [UNREPLIED]
>>> # !!!!!!! Look here !!!!!!! That's where it starts! Why do we have =
a
>>> port mapping here???
>>> [NEW] 192.168.1.38:44608 -> 122.XX.115.203:10020 |
>>> 122.XX.115.203:10020 -> 114.XX.234.123:1030 [UNREPLIED]
>>> # And from that point on it goes down the drain!
>>> # Se the port mapping to port 1030!!!???!!!! Why?!
>>> [UPDATE] 192.168.1.38:44608 -> 122.XX.115.203:10020 |
>>> 122.XX.115.203:10020 -> 114.XX.234.123:1030
>>> [UPDATE] 192.168.1.38:44608 -> 122.XX.115.203:10020 |
>>> 122.XX.115.203:10020 -> 114.XX.234.123:1030 [ASSURED]
>>> # The connection is assured, because Asterisk is basically listenin=
g
>>> to everything on that port and changes the port it send the data ba=
ck
>>> # But my VoIP Provider is not that intelligent. :-((( See the follo=
wing
>>> [NEW] 192.168.1.38:44608 -> 62.52.147.185:35642  | 62.52.147.185:35=
642
>>> ->114.XX.234.123:1030 [UNREPLIED]
>>> [NEW] 62.52.147.185:35642 -> 114.XX.234.123:44608 |
>>> 114.XX.234.123:44608 -> 62.52.147.185:35642 [UNREPLIED]
>>> [NEW] 62.52.147.185:44609 -> 114.XX.234.123:44609 |
>>> 114.XX.234.123:44609 -> 62.52.147.185:35643 [UNREPLIED]
>>> [NEW] 192.168.1.38:57890 -> 62.52.147.185:35643 | 62.52.147.185:356=
43
>>> -> 114.XX.234.123:57890 [UNREPLIED]
>>> -------------------------------------------------------------------=
------------------------------------------------------------------
>>> As you can see, half way through ( Underneath my !!!!!!!! comment)
>>> conntrack/netfilter, linux does a port mapping, and does not use th=
e
>>> internal port 44608, but mapps the port to port 1030, for whatever
>>> reason.
>>> I am pretty sure this port-mapping is unneeded, and it messes up my
>>> VoIP calls, as the providers are thinking my external port is 44608
>>> (that's the port the device uses), but linux maps it to port 1030.
>>> Can anyone technically explain to me why conntrack/netfilter does
>>> this? Why can't netfilter just do a second mapping (first mapping w=
as
>>> the one from the STUN connection, line 3)?
>>>
>>> This is not a symmetrical NAT!
>>>
>>> And please I do my best to explain this, if you need more info or y=
ou
>>> don't understand my explanation, I am willing to give more detailed
>>> info, or explain it in a different way, but don't be offensive,
>>> please.
>>>
>>> Thanks.
>>
>>
>>
>> --
>> Eliezer Croitoru
>> https://www1.ngtech.co.il
>> IT consulting for Nonprofit organizations
>> eliezer <at> ngtech.co.il
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--=20
Eliezer Croitoru
https://www1.ngtech.co.il
IT consulting for Nonprofit organizations
eliezer <at> ngtech.co.il
