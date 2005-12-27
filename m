From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: DROP TCP output to HTTP attackers?
Date: Tue, 27 Dec 2005 11:31:24 -0500
Message-ID: <FAC4E024BF776842876169173CE2F01313B78B@mailbox.vikus.com>
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
[ snip ]

> >=20
> > My only comment would be that for proxy users (AOL, for=20
> instance) you=20
> > may end up dropping legitimate traffic. The risk/reward of that is=20
> > something you'll have to determine for yourself.
> >=20
> > Derick Anderson
> >=20
>=20
> I must admit that I have little knowledge of these proxies. =20
> I infer from what you say that different users might present=20
> the same peer ip address.
> Is this true?  If so, perhaps I should set a time limit on the block.

Yes - there may be thousands of users on the same proxy. In my limited
experience it's generally broadband users (and some universities) that
have public IPs tied to a single account. Most others (businesses,
dial-up ISPs) will go through a proxy or at least NAT to a single public
IP and many people use third-party proxies to surf anonymously.

If you're going to set a time limit, it should be real short, like a few
seconds. Most automated attacks take place in less than two or three
seconds on a decent connection, from my experience. This would limit the
timeouts experienced by legitimate users.
=20
> With regard to blocking output in response to attacks,=20
> thereby blocking TCP FIN, are there any opinoins on this?
>=20
> Thanks for your help.
> Mike.
>=20

Not sending the TCP FIN might be advantageous when coupled with your IP
dropping policy since legit clients may retry several times before
giving up. Otherwise your advantage is no response (more stealthy for
scans) vs. the disadvantage of more open connections which will wait a
long time before closing.

Derick Anderson

