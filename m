From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: forwarding to an external ip
Date: Thu, 13 Jan 2005 11:22:36 -0500 (EST)
Message-ID: <52539.142.169.215.10.1105633356.squirrel@142.169.215.10>
References: <20050112170926.GA4744@digicit.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050112170926.GA4744@digicit.nl>
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
To: Roderik van Heijst <roderik@digicit.nl>
Cc: netfilter@lists.netfilter.org

On Wed, January 12, 2005 12:09 pm, Roderik van Heijst said:
> hi there,

hi

> [...]
> ... Nopez. Honestly, I can't understand what's making the difference ..
> must be due to
> different kernels, but this is user-space right .. should work the same=
?

What do you mean by `but this is user-space' ?

> I'm sorry if i sound frustrated, but i am.

Against what ? 8)

>
> iptables -F
> iptables -t nat -F
> iptables -t nat -A PREROUTING -p tcp -i ppp0 --dport 1111 -j DNAT --to
> 131.155.228.4
> iptables -t nat -A POSTROUTING -p tcp --dport 1111 -j MASQUERADE
> iptables -L
> iptables -t nat -L

Quick comment : May I guess you have static external ip ?

If you do, use SNAT instead of MASQUERADE.

>
> Now for the difference that i can spot which may have to do with this:
> phex uses 2.4.20 whereas boron has 2.4.24.

Shouldn't matter.

> A subtle difference (at least that's what it seems to me) is that phex
> preroutes things from ppp0 while boron should
> do that from eth0, maybe that can be the problem? i don't see how, but
> that doesn't surprise me anymore by now.

That, obiviously, is a problem. The packet will never get DNAT'ed
(because it doesn't match your rule) if you specified it should
come from ppp0 where, in fact, it comes from eth0.

> I hope any of you can bravely
> come up with some sort of answer that should push me into the right
> direction of solving this .. well .. i don't know what it is. Aargh!

Maybe I missed something ?

>
> oh and happy newyear.

Thanks

HTH,

Samuel


