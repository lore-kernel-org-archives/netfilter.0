From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: dig doesn't work
Date: Sun, 13 Mar 2005 09:20:13 -0800
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F0199C5@pxtvjoexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: Mohamed Eldesoky <eldesoky.lists@gmail.com>, netfilter <netfilter@lists.netfilter.org>, EBTables Users <ebtables-user@lists.sourceforge.net>

Did you apply all of the RH specific patches as well or did you use the
vanilla kernel.  I had exactly that problem where there are several
things compiled to use RH's modified glibc.  To get around that you MUST
apply all of the patches in the same order that they do in the
SRPMS/SPECS file.

RHES3 is a hybrid kernel (which I found out when everything segfaulted)
that uses many of the 2.6 networking features.  As a result it's heavily
incompatible from vanilla sources.

My suggestion is that you make a chance to the vanilla source, diff it,
create a patch and append it to the RH kernel Spec file.  That works for
most of the stuff that I have done.

Hope that helps.

Gary

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Mohamed Eldesoky
> Sent: Sunday, March 13, 2005 5:23 AM
> To: netfilter; EBTables Users
> Subject: dig doesn't work
>=20
> I use RHEL3AS
> Patched my system for ebtables, using 2.4 kernels.
> Now the dig command gives segmentation fault
> Did it occure to anyone  ??
> --
> Mohamed Eldesoky
> www.eldesoky.net
> RHCE


