From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Allow station addresses to remain intact during masquerade
Date: Sun, 6 Apr 2003 10:18:11 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304061118.11158.netfilter@newkirk.us>
References: <20030406103623.40748.qmail@web20713.mail.yahoo.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030406103623.40748.qmail@web20713.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Reuven Kohanim <rkohanim@yahoo.com>, netfilter@lists.netfilter.org

On Sunday 06 April 2003 06:36 am, Reuven Kohanim wrote:
> Hello,
> I currently work with ipchains to setup NAT from my
> private network to the internet. Before getting to the
> MASQ line I had a few  forward rules for letting a few
> stations to get to a server in my DMZ with their
> original IP address intact (i.e. not NATted). I need
> to do this to allow those stations to work the
> X-protocol with the sever set in my DMZ.
>
> I have tried to upgrade to iptables. No matter what I
> have tried those stations go out with the NAT address.
> After having studied the flow charts of how a packet
> traverses the chains it seems to me that I am out of
> luck and no matter what I do the packet will end up in
> the nat table of iptables and therefore its address
> will get masqueraded. Am I wrong? Can anyone tell me
> how to aviod masquorading those few stations when
> working with my server. The SNAT will not do since I
> need to preserve their original address.

If you need to SNAT other traffic going to the server in the DMZ but NOT=20
SNAT traffic from select sources, you can:

iptables -t nat -A POSTROUTING -o $DMZIF -s a.b.c.d -j ACCEPT
iptables -t nat -A POSTROUTING -o $DMZIF -s a.b.c.e -j ACCEPT
iptables -t nat -A POSTROUTING -o $DMZIF -t SNAT --to $DMZIFIP

Obvious substitutions for your environment would apply, but the basic=20
idea is to ACCEPT those particular connections, then SNAT what remains.

> If I am not in the correct place for asking this
> question I would appreciate it if someone would point
> me to the right forum.

Precisely the correct place.  :^)

> Thanks,
> Reuven

j


