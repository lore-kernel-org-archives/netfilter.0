From: =?iso-8859-1?Q?Andr=E9_Paulsberg-Csibi_=28IBM_Consultant=29?= 
	<Andre.Paulsberg-Csibi@evry.com>
Subject: RE: bursts of INVALID packets
Date: Mon, 2 May 2016 07:26:00 +0000
Message-ID: <f466f86a838e4ea289d1d66b097ec431@CCDEX021.corp.corpcommon.com>
References: <20160429195129.2e5b9d27@playground>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20160429195129.2e5b9d27@playground>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi Neal ,

Typically , not always , many IPTABLES FIREWALLS have very simple rules=
 going OUT from "self" ignoring state leaving the host .
( If this is incorrect , I think is more of an long semantic discussion=
 .)
Either way , that would most likely be the reason you are experiencing =
this issue ,

=46rom a more practical standpoint , any and all firewalls cannot "dete=
ct" closed connection ...
=2E.. it can only compare sessions with the ones that are recorded in t=
he connection table .
As soon as any connection is deleted from connection table , it is no l=
onger VALID/KNOWN from a technical standpoint .
How your firewall handles these "packets" then is up to your rules , an=
d if you allow them going out from one self
via OUTPUT filter chain but block them going in another host via the IN=
PUT filter chain you will experience some=20
packets being blocked as INVALID only when going into the hosts .
( so yes you can change this behavior to also block "unknown" session g=
oing out , just make sure you allow "known" sessions first )


Best regards
Andr=E9 Paulsberg-Csibi
Senior Network Engineer=20
=46ault Handling
IBM Services AS
andre.paulsberg-csibi@evry.com
M +47 9070 5988



-----Original Message-----
=46rom: netfilter-owner@vger.kernel.org [mailto:netfilter-owner@vger.ke=
rnel.org] On Behalf Of Neal P. Murphy
Sent: 30. april 2016 01:51
To: netfilter@vger.kernel.org
Subject: bursts of INVALID packets

Kernel: 3.4.112
Iptables: 1.4.21
System: Smoothwall Express 3.1

This isn't exactly a problem; it's more of an oddity that raises some q=
uestions.

Take two linux systems. Using ssh (and a shell script), transfer /dev/z=
ero from one to /dev/null on the other. With a decent system and 100Mb =
NICs, they should climb to about 97Mb/s in and out. Very nice. Now inte=
rrupt one with CTRL/C. All of a sudden, a burst of INVALID RST packets =
arrives at (at least) one side. The number of packets in the burst can =
be from few to many.

I surmise that one side buffered a bunch of packets and continued to tr=
ansmit them after the transfer was interrupted. The other side received=
 these packets, noted the now-closed connection, and sent RST packets b=
ack. The one side, upon receiving the RST packets, marked them INVALID =
and logged them. All is working as expected.

This leads to my questions. Can (or could, or should) netfilter detect =
that outgoing packets belong to closed conns and mark them INVALID? Sho=
uld netfilter be able to detect and drop INVALID packets on output? Or,=
 as an alternative, should netfilter be able to see that a conn is clos=
ed and mark outgoing packets INVALID so that rules can handle them? Is =
it worth the CPU cycles to do this?

Dropping INVALID packets on input (mangle:PREROUTING) works marvelously=
=2E

Of course, if the outgoing packets have already left netfilter and are =
queued for transmission, netfilter is out of the loop and cannot stop t=
hem.

Aside, I've bumped SWE3.2 to iptables 1.6.0; but it'll be a long while =
before 3.2 is releasable.

Thanks,
Neal
--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
