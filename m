From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: tarpit before or after adding chain?
Date: Sat, 17 Dec 2005 09:27:11 -0800
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE582900B59EB@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Georgi Alexandrov <georgi.alexandrov@gmail.com>, netfilter@lists.netfilter.org

We have a class /21 block so it's more than a few a day for us.  So I
just do it for general purposes.  But yes, you do not have to drop
connection tracking for this.  In our case, it's a couple per second and
our connection tracking gets filled up pretty quick.=20

But just because he is running Linux doesn't make this invalid.  We use
Linux boxes to slow people from hitting the windows boxes with their
afflicted boxes.  So it suddenly makes sense to do what he is doing if
he is using it in that capacity.

When these rules go off on our boxes we use it to build out temporary
filter rules as well using some scripts.  =20

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Georgi Alexandrov
> Sent: Saturday, December 17, 2005 1:18 AM
> To: netfilter@lists.netfilter.org
> Subject: Re: tarpit before or after adding chain?
>=20
> Gary W. Smith wrote:
>=20
> >This should also work as well.  We tarpit all data which should never
> >come through our firewalls.  We also disabled tracking for the same.
We
> >don't want the firewall wasting resources on this garbage.  Another
> >trick that we do is we also dedicate a high/low IP for catching
things
> >like SQL, HTTP, VNC, RDC, etc.  This was things walking the network
will
> >sometimes get hung, if they are not threaded.
> >
> >
> I don't think that his *one or two per day* cmd.exe automatic scans
will
> get "through his firewall",
> or will "waste resources".
> Maybe filling your firewall with those useless rules will waste more
> resources? ;-)
>=20
> *Think again* (as seen in the national geographic channel)
>=20
>=20
> regards,
> Georgi Alexandrov


