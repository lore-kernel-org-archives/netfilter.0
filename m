From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: missing module for tcp-flags match?
Date: Fri, 22 Sep 2006 16:45:41 +0200
Message-ID: <4513F715.4090509@plouf.fr.eu.org>
References: <5bb00b3f0609201654w100cdc33vf8fa674477ed1274@mail.gmail.com>
	<5bb00b3f0609220655n7a888c4bt4d1ed714f5193545@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5bb00b3f0609220655n7a888c4bt4d1ed714f5193545@mail.gmail.com>
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

Henning Sprang a =E9crit :
> Sorry for having posted this message twice. I did't see it coming back
> through the list, and realized I sent it from the wrong address.

Messages sent with an address which is not subscribed to the list must=20
wait to be approved by a list manager, this can take some time.

> I then sent it again from the address whic is actually subscribed.
> Now that I wondered why even the second mail didn't come back to me, I
> looked in the list archive and saw that the mail actually came through
> the list, even twice. I wonder why I didn't get a copy, because all
> other lists I know send copies of mails also to the sender himself -
> is the netfilter list different in this?

There is an option to not receive a copy of your own messages, maybe you=20
enabled it.

> When tyring to set up the rule:
>=20
> iptables -A INPUT --protocol tcp --tcp-flags ALL SYN,ACK -j DROP
>=20
> I only get the error:
>=20
> iptables: No chain/target/match by that name
>=20
> When I remove the tcp-flags part, the rules is accepted. I assume to
> be missing a kernel module for tcp-flags match, but have no idea which
> module this could be. Which Kernel module is required for getting
> tcp-flags matches?

AFAIK, there is no specific module for --tcp-flags. It is a standard tcp=20
match, like --dport and --sport. I see no reason why you get an error.

