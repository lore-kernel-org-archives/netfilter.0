From: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Subject: Re: simple question
Date: Wed, 27 Apr 2005 12:50:28 +0200
Message-ID: <1403218a05042703502786f182@mail.gmail.com>
References: <a0f69e50504270335efe7915@mail.gmail.com>
Reply-To: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a0f69e50504270335efe7915@mail.gmail.com>
Content-Disposition: inline
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
To: Askar <askarali@gmail.com>, netfilter <netfilter@lists.netfilter.org>

Yes or No, depends on your rules !!

On 4/27/05, Askar <askarali@gmail.com> wrote:
> hi list
>=20
>         If I put  "iptables --policy FORWARD ACCEPT" , still I need a lin=
e i-e
>=20
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>=20
> Regards
>=20
> Askar
> --
> I love deadlines. I like the whooshing sound they make as they fly by.
> Douglas Adams
>=20
>=20


--=20
Mohamed Eldesoky
www.eldesoky.net
RHCE

