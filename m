From: "Allain Yoann" <Yoann.Allain@thomson.net>
Subject: RE: 26sec+forwarding, bug or PEBKAC?
Date: Wed, 6 Apr 2005 14:36:10 +0200
Message-ID: <9C1918067C3BC14C9C351C206D8A8437372FF2@rennsmail03.eu.thmulti.com>
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
To: netfilter@lists.netfilter.org


> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Allain Yoann
> Sent: mercredi 6 avril 2005 10:54
> To: netfilter@lists.netfilter.org
> Subject: Re: 26sec+forwarding, bug or PEBKAC?
>=20
> On Tue, 31 Mar 2005 22:16:40, rsnel at cube.dyndns.org wrote
>=20
> >Hello list,
> >
> >I hope this is the right list, as my problem appears to be about both
> >iptables and (native (as in: managed with setkey)) IPSec.
> >
> >Short version:
> >
> >packets from ipsec tunnel seem to get lost before they enter the the
> >FORWARD chain with kernel 2.6.11. There is no problem with 2.6.8-2-k6
> >(Debian kernel with 26sec) and there is no problem with ipsec turned
> >off.
> >

...

> >This happens with linux-2.6.11 (vanilla). The ping works if IPSec is
> >turned off (i.e. setkey -F -P on cube and toppie). And it also works
> >in 2.4.27-2-k6 (a Debian kernel (which has 26sec patched in)).
> >
> >So, is it a bug, feature, or just misconfiguration? Can you
reproduce?
> >I would appreciate any insight on this problem.
> >
> >Thanks.
> >
> >Greetings,
> >
> >Rik.
>=20
> Hello Rik,
>=20
> I got the same problem, with the same kernel version. So I'm asking
you
> if you resolved it and if someone of the kernel has been awared of
this
> problem.
> I've tried to debug it with an UML version but didn't succeed.
>=20
> Greetz
>=20
> Yoann

Hi again,

I solved the problem:
Since the kernel 2.6.10, we must set a "fwd" policy in the same way we
did for the "in" policy on each host-end of the tunnel.

I just found one reference on the web:
http://www.ipsec-howto.org/x277.html (one line in the middle)

I hope others newbies like me won't lose too much time on it...

Yoann


