From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Round Robin Load Balancing
Date: Mon, 11 Aug 2003 21:00:01 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C0A5@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

>With that regard it doesn't matter if the routing desision has already =
been made or not...
I would've thought it does matter as your packet has gone through all =
the proper chain paths and now it's about to leave into the ethernet and =
your now forcing it back through routing and out again through another =
interface.. unless the patch jumps a bit or something...

OK the URL makes the point, as you saw my example was all there was so I =
kinda hard coded that what it was supposed to be used in... =
(PREROUTING)..
I guess it couldn't hurt trying it though.. ;P

Has anybody tried marking the packets and then using iproute2 instead of =
the ROUTE patch to go via a different ethernet??

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au
=20

-----Original Message-----
From: Ramin Dousti [mailto:ramin@cannon.eng.us.uu.net]
Sent: Monday, August 11, 2003 5:26 PM
To: George Vieira
Cc: Javier Govea; netfilter@lists.netfilter.org
Subject: Re: Round Robin Load Balancing


On Mon, Aug 11, 2003 at 08:30:20AM +1000, George Vieira wrote:

> Hate to burst your bubble

Hey, don't worry...

> but isn't the ROUTE module being used a _little_ too late.

No, not really. At least not according to:

http://www.netfilter.org/documentation/pomlist/pom-extra.html#ROUTE

> I mean, it's suppose to reroute to a new device but your using it in =
POSTROUTING which means it's to late to reroute it (basically leaving =
the interface and out to the internet)...
>=20

That is the traditional routing, but this module _forces_ the packet to =
go
wherever you want... With that regard it doesn't matter if the routing
desision has already been made or not...

Ramin

> >From memory, the ROUTE module is supposed to be used in PREROUTING on =
the internal interface so that it doesn't hit the routing table yet and =
the rule modifies which interface to go out on..
>=20


