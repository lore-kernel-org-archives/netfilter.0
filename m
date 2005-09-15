From: "Baake, Matthias" <m.baake@porta.de>
Subject: RE: big table tweaks ?
Date: Thu, 15 Sep 2005 14:09:44 +0200
Message-ID: <201E6F5AC48C274996A5AD8304FAEF860BFCFE@p001ex03.porta.local>
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
To: Jan Eidtmann <cmak_@arcor.de>
Cc: "Netfilter (E-Mail)" <netfilter@lists.netfilter.org>

hi,

try to split up your input rules into some custom chains that the =
packets have=20
not a really long way to traverse your input chain thats what i would =
do..

greets
matthias

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of=20
> Jan Eidtmann
> Sent: Wednesday, September 14, 2005 2:43 PM
> To: netfilter@lists.netfilter.org
> Subject: big table tweaks ?
>=20
>=20
> hello,
>=20
> i have one kind of big table with 80.000+ rules. its referenced in
> INPUT. lookup (when someone wants to connect) is kinda slow and system
> hangs noticable (desktop usage). i tried preemptive and non_preemptive
> kernels, its all the same. so, is there anything i could tweak to make
> this run smooth?
>=20
> thx in advance,
> jan
>=20
>=20
> note: i am not subscribed...
>=20
>=20

