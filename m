From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Routing and PREROUTING
Date: Mon, 12 Jul 2004 16:15:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407121615.43145.Antony@Soft-Solutions.co.uk>
References: <20040712145806.GA30044@itstud.chalmers.se>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040712145806.GA30044@itstud.chalmers.se>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Monday 12 July 2004 3:58 pm, Erik Wikstr=F6m wrote:

> Hi again
>
> I'm probably thinking to much here but I've got a bit of a problem with
> allowing traffic from my local network out to the Internet. Currently
> I've got the following rules which should do that:
>
> # Allow traffic from LAN to WAN
> $IPT -t nat -A PREROUTING -i $LAN -s $LOCAL_NET -j ACCEPT

This makes me *very* suspicious - why do you have an ACCEPT rule in a nat=
=20
table?

I hope it doesn't mean you have a DROP policy....?

nat tables are for doing Network Address Translation, not for filtering. =
 =20
ACCEPT is a filtering action.

> $IPT -t filter -A FORWARD -i $LAN -o $WAN -s $LOCAL_NET -j ACCEPT
> $IPT -t nat -A POSTROUTING -o $WAN -s $LOCAL_NET -j MASQUERADE

Those two look fine to me.

> My problem is with the first rule, where I'm using the "nat" table but
> I'm not doing any NATing, more like filtering since I only pass some
> packets. And filtering is not supposed to be done in the "nat" table bu=
t
> on the other hand there is no filter table in PREROUTING.

Okay, so at least you recognise that you shouldn't be doing it...

> But the alternative would be to have a ACCEPT policy in the
> PREROUTING-chain and do all the filtering in the FORWARD-chain,

Correct :)

> which is kind of unnecessary since a number of packets would then have =
to
> travel through a number of rules (larger than the number of rules in th=
e
> PREROUTING-chain) just to be droped in the end.

What's the problem with that?

> So is my rule OK to use or would you do in any other way?

The absolutely important, vital, essential point is not to have a default=
 DROP=20
policy in a nat table (eg PREROUTING), as the system simply will not work=
 if=20
you do.

Since you are not allowed to have a default DROP policy, it makes it kind=
 of=20
pointless to have ACCEPT rules....

Stick to what you know is right - do NAT in the nat tables, and do Filter=
ing=20
in the filter tables :)

Regards,

Antony.

--=20
The difference between theory and practice is that in theory there is no=20
difference, whereas in practice there is.

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


