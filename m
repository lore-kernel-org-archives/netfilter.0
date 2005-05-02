From: Daniel Lopes <lopsch@lopsch.com>
Subject: Re: rules for skype
Date: Mon, 02 May 2005 17:36:57 +0200
Message-ID: <42764919.60507@lopsch.com>
References: <20050502150901.DAEF39E9F4@dd6816.kasserver.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050502150901.DAEF39E9F4@dd6816.kasserver.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Seferovic Edvin schrieb:
> I think that you can stop ALL https connections with squid.. if you wan=
t of
> course... but then, I dont know if there is such way as you described i=
t. A
> very good ACL implementation is squidGuard.
>=20
> But hey.. why do you want to stop skype?
>=20
> Regards,
>=20
> Edvin Seferovic
>=20
I can also block https by blocking port 443 that=B4s not the point. The=20
point is to block "bad" 443 port traffic and let "good" traffic pass.

