From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrack and conntrackd
Date: Sun, 02 Sep 2007 11:04:55 +0200
Message-ID: <46DA7CB7.9020707@netfilter.org>
References: <56FFE36FCA3A3842AE12EE8B3A32229D1B681A@exbbc.stromtelecom.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <56FFE36FCA3A3842AE12EE8B3A32229D1B681A@exbbc.stromtelecom.cz>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Filka Michal <Michal.Filka@sitronicsts.com>
Cc: netfilter@lists.netfilter.org, netfilter-failover@lists.netfilter.org

Filka Michal wrote:
> I've problem when using conntrack and conntrackd.=20
>=20
> I tried to create a record using conntrack. But, I didn't see the record
> in conntrackd cache neither on MASTER even BACKUP. However, I can see
> the record in conntrack (conntrack -L)
>=20
> Does it meen that conntrackd isn't able to synchronize manually created
> conntrack records?

The appropriate patches need to go into kernel for this. I sent a patch
for this, look for:

[PATCH 7/8][CTNETLINK] send conntrack events on ctnetlink actions

Although it is still under discussion.

--=20
"Ser=E1 preciso viajar por los ojos de los idiotas" -- Poeta en Nueva York
-- Federico Garc=EDa Lorca.

