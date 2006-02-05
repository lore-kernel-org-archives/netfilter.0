From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: 2 DSL connection
Date: Sun, 5 Feb 2006 10:10:13 -0800
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE582900B5B5E@pxtbenexd01.pxt.primeexalia.com>
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
To: varun <varun_saa@rediffmail.com>, netfilter@lists.netfilter.org

It is possible, as already stated, you should look at lartc.  It does
get a little tricky if you need to dnat/snat those static IP's
internally.  We have done just that (two DSL's) for a couple clients.

In our case we don't equalize the outgoing routes but rather have then
going out a single route.  The second DSL is used for incoming VPN and
remote desktop connections.  This way if people are sending/reciving
large email or downloading/uploading a bunch of files, the people using
the VPN are unaffected by it.



> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of varun
> Sent: Sunday, February 05, 2006 6:25 AM
> To: netfilter@lists.netfilter.org
> Subject: 2 DSL connection
>=20
> Hello,
>=20
> I want to use 2 DSL connections on one
> system.
>=20
> eth0 - DSL1 with static IP
>=20
> eth1 - DSL2 with static IP
>=20
> eth2 - LAN
>=20
> I would like all traffic from eth2(LAN)
> to be distributed equally between DSL1
> and DSL2.
>=20
> Is it possible to do that using iptables  ?
>=20
> Thanks in advance
>=20
> Varun
>=20


