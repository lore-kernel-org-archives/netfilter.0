From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: big table tweaks ?
Date: Thu, 15 Sep 2005 09:52:50 -0400
Message-ID: <E656E2CC1C5AEB42ACB00EB83122C7742E2B98@farmer.vikus.com>
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
To: Jan Eidtmann <cmak_@arcor.de>, netfilter@lists.netfilter.org



> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of=20
> Jan Eidtmann
> Sent: Wednesday, September 14, 2005 8:43 AM
> To: netfilter@lists.netfilter.org
> Subject: big table tweaks ?
>=20
> hello,
>=20
> i have one kind of big table with 80.000+ rules. its=20
> referenced in INPUT. lookup (when someone wants to connect)=20
> is kinda slow and system hangs noticable (desktop usage). i=20
> tried preemptive and non_preemptive kernels, its all the=20
> same. so, is there anything i could tweak to make this run smooth?
>=20
> thx in advance,
> jan
>=20
>=20
> note: i am not subscribed...

It would help knowing what you are trying to accomplish with those
80,000 rules. When I build a firewall, I know what each rule is for. I
would have a hard time keeping track of 800 rules, let alone 80,000.

You said this is referenced in INPUT, are you running services on this
host? Is it multi-homed? Are you blocking all the /24 networks of
everybody you don't like? Is -A INPUT -m state --state
RELATED,ESTABLISHED -j ACCEPT the first INPUT rule? Is this a Red Hat
box? (sorry, had to ask)

Derick Anderson

