From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: dnatting
Date: Tue, 12 Jul 2005 16:19:59 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE58290742E@pxtbenexd01.pxt.primeexalia.com>
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
To: Steven M Campbell <Netfilter@SCampbell.net>, Netfilter ML <netfilter@lists.netfilter.org>

I agree with everything that has been said BUT I must also interject.  A
lot small business and many home users who get one or two IP's usually
don't have a second DNS floating around.  For larger organizations I
would definitely use the split DNS.  We do that at a couple locations
when we can.

As for this case, I think it's completely acceptable. =20

Since this does indeed work I think it should be documented as a viable
solution (which I think it's in the fine print on one of the docs that I
read before).



> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Steven M Campbell
> Sent: Tuesday, July 12, 2005 2:03 PM
> To: Netfilter ML
> Subject: Re: dnatting
>=20
>=20
> So, having put a few of these negative forth allow me to suggest an
> alternative.  Split DNS, with split dns you will create a name, for
> example theserver.myplace.com and have a split view of it, that is,
> folks on the inside will get the inside address and folks on the
outside
> will get the outside address.  No special routing is then required and
> you can use the server internally without any of the above issues.   I
> totally agree with Jason in suggesting that you investigate your name
> server rather than doing this bi-directional NAT.
>=20
>=20


