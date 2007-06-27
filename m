From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: ipt_account / iptables 1.3.8
Date: Wed, 27 Jun 2007 20:16:33 +0200
Message-ID: <4682A981.3090608@plouf.fr.eu.org>
References: <1182962627.16585.6.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1182962627.16585.6.camel@localhost>
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

Hello,

Thomas Jacob a =E9crit :
>=20
> It appears that ipt_account has vanished from
> iptables 1.3.8 (it was still there in 1.3.7) could
> someone please comment on the why?
>=20
> The changelogs do not mention anything about it

They do, in a rather laconic way though :

<quote>
- Remove extensions for unmaintained/obsolete patchlets
</quote>

AFAIK, the concerned extensions are : fuzzy, nth, random (both=20
superseded by statistic), ROUTE, account, BALANCE, childlevel,=20
connlimit, dstlimit, FTOS, IPMARK, ipv4options, IPV4OPTSSTRIP, mport,=20
NETLINK, osf, psd, record_rpc, rpc, TARPIT, TCPLAG, time, TRACE, u32, XOR=
.

