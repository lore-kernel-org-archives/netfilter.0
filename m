From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: logging and droping bad tcp packets
Date: Mon, 17 Oct 2005 09:26:19 -0400
Message-ID: <FAC4E024BF776842876169173CE2F013287A@mailbox.vikus.com>
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
To: edvin.seferovic@kolp.at, netfilter@lists.netfilter.org

=20
> Hi,
>=20
> =20
>=20
> I would like to log and drop bad TCP packets on all my=20
> interfaces... but in my eyes it means that I would have to=20
> write every rule three times. Is there a way to simplify this=20
> or should I really write those rules for every interface.. or=20
> can I just enter eth+ in the input chain for all my ethernet=20
> interfaces?=20
>=20
>=20
> Thank you in advance
>=20
> =20
>=20
> Regards,
>=20
> =20
>=20
> Edvin Seferovic
>=20

Just don't specify an interface and the rule will apply to all of them.
Put the 'bad tcp packets' ruleset at the top of your INPUT/FORWARD chain
(whichever is appropriate) before you start doing your interface
specific rules. For purposes of logging (and are you planning to read
the logs?) you won't be able to make an interface-specific label but
otherwise everything should work fine.

Derick Anderson

