From: "Piszcz, Justin Michael" <justin.piszcz@mitretek.org>
Subject: RE: Destination Nat
Date: Wed, 2 Jun 2004 11:20:44 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5D3C2276FD64424297729EB733ED1F76062437F7@email1.mitretek.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Alistair Tonner <Alistair@nerdnet.ca>, netfilter@lists.netfilter.org

Does anyone know how the data is processed?
Does it perform a lookup if it is, ie: icmp,tcp,udp etc or does it store
it in numeric form?

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Alistair
Tonner
Sent: Wednesday, June 02, 2004 11:14 AM
To: netfilter@lists.netfilter.org
Subject: Re: Destination Nat

On June 2, 2004 07:19 am, John A. Sullivan III wrote:
> -p 6 is the same as -p tcp only a little faster as it does not have to
> look up tcp in the protocols file and translate it from tcp to 6.  UDP
> would be -p 17, ICMP -p 1, ESP -p 50, etc.

	That lookup would only be done when the rule was posted or
loaded.
	Thus - the time saving is only on loading the rule. =20
	I believe that the rule data is *all* stored in numeric form ...
	But I could be completely wrong on that front.

	Alistair.
>
> On Tue, 2004-06-01 at 23:38, John Black wrote:
> > thanks, ill give it a try tomorrow when i get to work.  what is the
-p 6?
> > ----- Original Message -----
> > From: John A. Sullivan III <john.sullivan@nexusmgmt.com>
> > To: <black@arbbs.net>
> > Cc: <netfilter@lists.netfilter.org>
> > Sent: Friday, May 28, 2004 8:56 PM
> > Subject: Re: Destination Nat
> >
> > > If I understand you correctly and remember your original rule,
then I
> > > think you have it backward.  If you are changing the destination,
you
> > > probably want to change it from the public address to the private
> > > address:
> >
> > john




