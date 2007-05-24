From: Pat Riehecky <prieheck@iwu.edu>
Subject: Re: Conntrack rule timeout problem
Date: Thu, 24 May 2007 09:16:53 -0500
Message-ID: <1180016213.6265.41.camel@thales.lan>
References: <1179765250.12001.18.camel@thales.lan>
	<465437E1.9030600@freemail.hu> <1179927731.28690.16.camel@thales.lan>
	<46546B8B.9040705@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46546B8B.9040705@freemail.hu>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"
To: =?ISO-8859-1?Q?G=E1sp=E1r?= Lajos <swifty@freemail.hu>
Cc: netfilter@lists.netfilter.org

That is an excellent article!

I attempted to simplify the oddities I am seeing to avoid being overly
complex, but it seems that was in error....

Here is a packet that was caught on its way out of my server, it cannot
be part of a FORWARD chain as my FORWARD chain looks like this

:FORWARD DROP [0:0]
-A FORWARD -j LOG --log-prefix "Default DROP (FORWARD): "=20
-A FORWARD -j DROP=20

Simply put the answer to any forward is "NO"

The packet is :
Default DROP (OUTPUT): IN=3D OUT=3Deth0 SRC=3D192.168.12.74 DST=3D66.28.2=
42.99
LEN=3D344 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D13688 DF PROTO=3DTCP SPT=3D=
60155 DPT=3D80
WINDOW=3D5840 RES=3D0x00 ACK FIN URGP=3D0

It tries for a while and then gives up.  This feels identical to the
input scenario.  The last packet seems to not be getting through as
RELATED/ESTABLISHED.  After studying the flow with iptstate=20
(a bit poorly, but it was a start) this seems to occur when a connection
is closed - but not when all connections are closed.  This leads me to
believe that it has to be related to conntrack.

Is my reasoning on this flawed?
Pat

On Wed, 2007-05-23 at 18:27 +0200, G=C3=A1sp=C3=A1r Lajos wrote:
> Pat Riehecky =C3=ADrta:
> > I am about 90% certain that I am not being scanned as a bunch of the
> > dropped packets are coming from places like the New York Times,
> > Microsoft, and Google.  Admittedly they could be spoofed IP addresses=
.
> > but the packets are all coming from 80 or 443 and they are all destin=
ed
> > for TCP Ports in the ephemeral range.  Additionally in my squid logs =
I
> > have a corresponding entry requesting data from that server.
> >
> >  =20
> Well... Read this:
>=20
> http://www.hackinthebox.org/modules.php?op=3Dmodload&name=3DNews&file=3D=
article&sid=3D10640&mode=3Dthread&order=3D0&thold=3D0
>=20
> The interesting part starts at *"Camouflaging your ip address"...*
> > All evidence I have points to some sort of conntrack timeout.
> > Occasionally I can find the IP addresses in the output from iptstate,
> > but...=20
> >
> > Thanks for the ideas, any chance for more theories?
> > Pat
> >  =20
> Swifty
>=20


