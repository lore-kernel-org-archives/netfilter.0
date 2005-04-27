From: Askar <askarali@gmail.com>
Subject: Re: simple question
Date: Wed, 27 Apr 2005 16:58:03 +0600
Message-ID: <a0f69e50504270358398f221d@mail.gmail.com>
References: <a0f69e50504270335efe7915@mail.gmail.com>
	<1403218a05042703502786f182@mail.gmail.com>
Reply-To: Askar <askarali@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1403218a05042703502786f182@mail.gmail.com>
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
To: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Cc: netfilter <netfilter@lists.netfilter.org>

you mean if I have rules like

iptables -P FORWARD ACCEPT

iptables -A FORWARD -p tcp --dport 22 -j ACCEPT=20

Then putting ESTABLISHED,RELATED thing will helps?
however why should I put ACCEPT rules in FORWARD when the default
policy for it is already to accept everything.

thanks and regards

Askar
On 4/27/05, Mohamed Eldesoky <eldesoky.lists@gmail.com> wrote:
> Yes or No, depends on your rules !!
>=20
> On 4/27/05, Askar <askarali@gmail.com> wrote:
> > hi list
> >
> >         If I put  "iptables --policy FORWARD ACCEPT" , still I need a l=
ine i-e
> >
> > iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> >
> > Regards
> >
> > Askar
> > --
> > I love deadlines. I like the whooshing sound they make as they fly by.
> > Douglas Adams
> >
> >
>=20
> --
> Mohamed Eldesoky
> www.eldesoky.net
> RHCE
>=20


--=20
I love deadlines. I like the whooshing sound they make as they fly by.
Douglas Adams

