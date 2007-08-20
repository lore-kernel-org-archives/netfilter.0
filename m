From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: REJECT target not as policy
Date: Mon, 20 Aug 2007 22:27:55 +0200
Message-ID: <46C9F94B.7010503@plouf.fr.eu.org>
References: <20070820135206.GA18644@bart.bertram-scharpf.homelinux.com>	<200708201608.39032.r.laban@ism.nl>	<46C9B8A2.5040201@plouf.fr.eu.org><20070820174642.GA22613@bart.bertram-scharpf.homelinux.com>	<46C9E0E4.2080200@plouf.fr.eu.org>
	<000801c7e35d$f7d39210$0101000a@tanjian>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000801c7e35d$f7d39210$0101000a@tanjian>
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

Rob Sterenborg a =E9crit :
>=20
> You could emulate a REJECT policy by having this as the very last rules=
:
>=20
> $ipt -A INPUT -p tcp -j REJECT --reject-with tcp-reset
> $ipt -A INPUT -j REJECT
>=20
> (I thought it was like this..)

What was like what ?

> But, if you dynamically add rules then you have to take care of at/from
> which position you insert/delete them.

A user-defined chain comes in handy. Jump into it before the REJECT=20
rules and add the dynamic rules in it.

iptables -N input
iptables -A INPUT -j input
iptables -A INPUT -j REJECT

iptables -A input blah...

