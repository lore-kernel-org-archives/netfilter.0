From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: Fwd: VoIP conntrack issue
Date: Wed, 14 Nov 2012 03:43:19 +0200
Message-ID: <50A2F737.6060403@ngtech.co.il>
References: <CABY2qi9ge+3jkt5ePM-iZU2XycBic6orCvjF63WArCvjWPS4og@mail.gmail.com> <201211122202.02082.neal.p.murphy@alum.wpi.edu> <CABY2qi9-dYnr8AkTmoeQZgbxM02T=OFw0-FKZoyt+_N6xHuJgA@mail.gmail.com> <50A213B1.4050601@ngtech.co.il> <CABY2qi86ntiYHDzaSeyEwy8vVSy8z8gc+uc8B8EANvya7m6f8w@mail.gmail.com> <50A2A903.3050702@ngtech.co.il> <CABY2qi8w6eDME-OUYM_5Y8Pk63TxBudoHkC54EdzHtuEwQGjZQ@mail.gmail.com> <CABY2qi_SsfZWzD5=ycNoSVGCCP5YqWro23rJe9THTrLpeEXmww@mail.gmail.com> <50A2EF09.5030002@ngtech.co.il> <CABY2qi8tfLaP05Y2227nn8ZsaPF2DVeozJd1SjQpxePnFXzVHA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CABY2qi8tfLaP05Y2227nn8ZsaPF2DVeozJd1SjQpxePnFXzVHA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?J=F6rn_Krebs?= <jk@smartbyte.de>
Cc: netfilter <netfilter@vger.kernel.org>

Hey J=F6rn,

You seem to not understand yet what MASQUERADE means.
I have tried to explain it to you but...

NAT is not suppose to do what you are saying but more to allow specific=
=20
function which your usage and UDP protocols in general have problem=20
since they based on L2 for each packet which cannot be a basis for=20
connection establishment and other part that exists in TCP.

Connection tracking should have capabilities to make things more simple=
=20
in some cases but in this specific case the only full solution will be=20
to DNAT the RTP stream.

The best thing I can recommend you that will make sense to you is "how=20
nat works"
cisco has a nice doc on it here:
http://www.cisco.com/en/US/tech/tk648/tk361/technologies_tech_note09186=
a0080094831.shtml

look at the category: Dynamic NAT and Overloading Examples.

if the device has static ip in the network from dhcp use iptables with =
dnat.

Regards,
Eliezer

On 11/14/2012 3:31 AM, J=F6rn Krebs wrote:
> Hi Eliezer,
>
> I think I missed to explain something here: RTP is not one packet
> send, RTP is more like a stream of data,
> and with this stream it can happen, that open packet arrives before a=
nother.
> (That's why the log shows the connection from GMX to my host first,
> before my phone sends data to that host, but this is more by luck.
> Usually my phone should try to establish a connection to GMX first (s=
o
> to say "open" the NAT for that IP port combination), and then GMX
> should  send data "back".)
>
> So when I say I have a connection from GMX to my Phone, at the same
> time the phone tries to establish a connection the other way around,
> but the SIP protocol is managing the ports.
> So over SIP both clients (GMX and my phone) agree to operate on
> specific ports. Lets say 2000 for GMX and 3000 for my phone.
>
> The firewall is expected to do a symmetric NAT, which means if my
> phone sends data to GMX port 2000 and it is using port 3000 as the
> source port, it is expected that the router uses the same port as his
> external port
> .... because, when GMX send it's RTP stream back it will use port 300=
0
> as the destination port (because they agreed on the port in the SIP
> session, GMX does not detect the port it gets data from!!!!)
> The NAT then should already have a rule, because my internal client o=
f
> cause send data to GMX port 2000 using port 3000 as the source port,
> because both clients agreed up on in the initial SIP negotiation
> phase.
> And that's my complaint. Linux is changing the ports. It is using a
> different source port for the internal connection to GMX, changing it
> to 1030.
>
> This port change is not like a symmetrical NAT should behave, and I
> like to know why linux is changing the port and not using the source
> port of the client, and how can I avoid this kind of behaviour?
>
> I think you are just looking at the problem from a different angle.
>
> Thanks, Joern.

--=20
Eliezer Croitoru
https://www1.ngtech.co.il
IT consulting for Nonprofit organizations
eliezer <at> ngtech.co.il
