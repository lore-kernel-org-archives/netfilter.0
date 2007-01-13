From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: Need to solve a NAT problem, any takers.
Date: Sat, 13 Jan 2007 00:17:37 -0800
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE5829024EF92@pxtbenexd01.pxt.primeexalia.com>
References: <57F9959B46E0FA4D8BA88AEDFBE5829024EF8A@pxtbenexd01.pxt.primeexalia.com>
	<45A871ED.9070500@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
In-Reply-To: <45A871ED.9070500@riverviewtech.net>
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
Content-Type: text/plain; charset="us-ascii"
To: Grant Taylor <gtaylor@riverviewtech.net>, Mail List - Netfilter <netfilter@lists.netfilter.org>

Grant,

That would definitely solve the DNS part of the problem. =20

Pascal Hambourg questioned why I really need to replicate the external
view to an internally only machine.  After we sat down today we found
that this really didn't need to be done as the secondary DNS server is
colocated somewhere else.  The internal lookup could never really happen
on the internal network with the confirmation that it's in now.  As long
as our internal DNS never references the external block we are fine.

FWIW it would be nice to be able to hit the public IP from within the
firewall but it's not the end of the world in this case.

Gary Wayne Smith

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Grant Taylor
> Sent: Friday, January 12, 2007 9:45 PM
> To: Mail List - Netfilter
> Subject: Re: Need to solve a NAT problem, any takers.
>=20
> On 01/11/07 21:35, Gary W. Smith wrote:
> > Internally our DNS server are split giving us internal IP's when
queried
> > internally and external's when queried externally.  This works fine.
> > Our second DNS server internally slaves the primary.  Because we are
> > using this split functionality when it slaves the internal IP's it
gets
> > the internal IP configuration.  Works great.  But in order to
replicate
> > the external range it must do so by replicating from the external
IP.
> > This fails at the IP's is NAT'd in by port only.  Years ago we
solved
> > this by running a second POSTROUTING rule and an OUTPUT rule on the
> > firewall.  When I load these rules now
>=20
> I know this is not an IPTables / NAT answer, but I think it may
possibly
> be an answer to your need.  What if you add a different subnet to your
> two DNS servers that each of them consider to be for the external
view.
>   Tell your secondary to contact the primary on it's IP in this
external
> view subnet.
>=20
> Just a thought.
>=20
>=20
>=20
> Grant. . . .


