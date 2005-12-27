From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: DROP TCP output to HTTP attackers?
Date: Tue, 27 Dec 2005 08:03:34 -0500
Message-ID: <FAC4E024BF776842876169173CE2F01313B76B@mailbox.vikus.com>
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
To: netfilter <netfilter@lists.netfilter.org>

=20

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of=20
> Michael D. Berger
> Sent: Friday, December 23, 2005 3:50 PM
> To: netfilter
> Subject: DROP TCP output to HTTP attackers?
>=20
> Using -j QUEUE, I DROP http packets that I don't like, and I=20
> DROP all subsequent packets from the offending ipAddress. =20
> Using ethereal, I note that when I DROP, I send tcp FIN=20
> packets.  Therefore, I added -j QUEUE to the OUTPUT filter,=20
> and I block all OUTPUT to the offending ipAddress, including=20
> the tcp FIN packets, as confirmed with ethereal.  I just=20
> deployed this in the last 30 minutes.  My preliminary=20
> observation, thanks to an obliging attacker, is that I get=20
> less follow-up junk with the OUTPUT filter blocked, although=20
> there did appear to be a few anomalies, that I assume are to=20
> to timing issues.
>=20
> Any opinions on this procedure?
>=20
> Thanks,
> Mike.
> --
> Michael D. Berger
> m.d.berger@ieee.org=20
>=20

My only comment would be that for proxy users (AOL, for instance) you
may end up dropping legitimate traffic. The risk/reward of that is
something you'll have to determine for yourself.

Derick Anderson

