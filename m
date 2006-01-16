From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: Conntrack and DNS
Date: Mon, 16 Jan 2006 08:01:02 -0500
Message-ID: <FAC4E024BF776842876169173CE2F0132CB183@mailbox.vikus.com>
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

=20

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of=20
> Carlos Pastorino
> Sent: Saturday, January 14, 2006 6:38 AM
> To: netfilter@lists.netfilter.org
> Subject: Fwd: Conntrack and DNS
>=20
> No one has any idea about this?
>=20
> Thanks,
>=20
> Carlos Pastorino
>=20

Give me the full output of iptables-save and I'll give it a shot.
Although it doesn't seem to be your problem, consider adding TCP port 53
(domain) as well since long DNS replies get sent over TCP.

Derick Anderson

