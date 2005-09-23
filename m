From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: PPTP/IPSec multiple clients behind iptables  NAT
Date: Thu, 22 Sep 2005 19:23:10 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE582900B57D0@pxtbenexd01.pxt.primeexalia.com>
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
To: Salim <salim.si@askey.com.tw>, netfilter@lists.netfilter.org

You need to down patch-o-matic but the problem is that RH 2.4 kernel is
a hybrid kernel (uses much of 2.6 in it).  I am running the patch on
RHES 4.

Gary

> -----Original Message-----
> From: Salim [mailto:salim.si@askey.com.tw]
> Sent: Thursday, September 22, 2005 7:24 PM
> To: Gary W. Smith; netfilter@lists.netfilter.org
> Subject: Re: PPTP/IPSec multiple clients behind iptables NAT
>=20
> Thanks Gary.
>=20
> My kernel is Red Hat 2.4.25.
> Could you please give more details about the patch?
>=20
> ----- Original Message -----
> From: "Gary W. Smith" <gary@primeexalia.com>
> To: "Salim" <salim.si@askey.com.tw>; <netfilter@lists.netfilter.org>
> Sent: Friday, September 23, 2005 10:03 AM
> Subject: RE: PPTP/IPSec multiple clients behind iptables NAT
>=20
>=20
> PPTP requires a patching of the kernel and a recompile of the kernel
and
> iptables (against the new kernel headers) to make this work.  It also
> matters which kernel version you are using.  There have been
> miscellaneous problems with different kernels report.  I believe many
> have been fixed though.
>=20
> Gary Smith
>=20
> > -----Original Message-----
> > From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> > bounces@lists.netfilter.org] On Behalf Of Salim
> > Sent: Thursday, September 22, 2005 6:58 PM
> > To: netfilter@lists.netfilter.org
> > Subject: PPTP/IPSec multiple clients behind iptables NAT
> >
> > I am using iptables 1.3.3
> >
> > I had some problems with multiple clients behind NAT(a simple
> MASQUERADE
> > rule is set) connecting to the same VPN server. ONly one client can
> > connect
> > at a time.
> > I have enables the CONFIG_IP_NF_PPTP and CONFIG_IP_NF_CT_PROTO_GRE
> options
> > in kernel.
> >
> > I have read a few posts about this issue in the list from as early
as
> in
> > 2003. But could not find a conclusion.
> >
> > Could you guys please clarify? Is this scenario supported by
iptables?
> If
> > not, is there a way to get around this issue?
> >
> > thanks
> > Salim
> >


