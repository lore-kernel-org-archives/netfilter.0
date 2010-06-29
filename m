From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: ebtables mac update
Date: Tue, 29 Jun 2010 09:57:31 -0500
Message-ID: <4C2A09DB.6030205@riverviewtech.net>
References: <1277808205.3791.17.camel@casper.meteor.dp.ua>	 <4C29E8B4.5060205@plouf.fr.eu.org> <1277821770.4006.33.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1277821770.4006.33.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 06/29/10 09:29, =F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB=
 wrote:
> Linux box runs some services and have 3 interfaces, 2 of them are=20
> bridged to br0 and one is left for separate local segment. So it is a=
=20
> router between br0 and eth2 and a bridge between eth0, eth1.

Will you please clarify what interface the Zyxel bridge is connected to=
?=20
   (I'm guessing that it's connected to either eth0 or eth1, but I'd=20
like some clarification.)

What is connected to the other two interfaces?

> This is brctl showmacs, right?

I don't know the command off the top of my head, but I know there is a=20
command to have the bridge show what MAC addresses are associated with=20
what bridge ports.

> So, this is exactly the same logic that switches use, right?

Should be, yes.

> Can you confirm that if MAC (frame with source MAC) pops up on port=20
> different from the one it was seen previous time then the port for=20
> that MAC get updated?

Should be, yes.

> What then "brctl setageing" for?

That should set the aging / expire timer for MAC addresses that have no=
t=20
been seen in a while.  (How long the MAC has to be quite before it is=20
flooded again.)

> It may happen that rebooting the modems brings port link down and the=
=20
> bridge may clear the MAC-port table on that port. This is similar to=20
> what Zyxel support told me.

Agreed.  See my previous reply about a way to test this.

> In my case on moved box I'm unable to make connections or even ping.

This is contrary to how every Linux bridge that I have used ever=20
behaved.  I'm thinking that the Zyxel is at least part of the problem.=20
That being said, it is very unlikely but there could be some sort of=20
weird interaction between the Zyxel and Linux bridging that combined is=
=20
causing a problem.

> Besides that it is a server, iptables is used to restrict access for=20
> separate local segment at eth2 (allow access to Internet and not to=20
> local net). Ebtables is empty now, but I wanted to be able to filter=20
> bridge traffic if that matters someday.

Remember that it is possible for IPTables to filter bridged traffic.=20
(It depends if an option is enabled in the kernel.)  So IPTables could=20
be interfering with out you knowing it.

Will you please provide the output of "iptables-save" (sanitized if nee=
ded).



Grant. . . .
