From: Yury Bokhoncovich <byg@center-f1.ru>
Subject: Re: Is DIVERT w/o forwarding feasible?
Date: Wed, 11 Sep 2002 20:39:47 +0700 (NOVST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0209111953130.19450-100000@panda.center-f1.ru>
References: <3D7EFBCF.70406@fugmann.dhs.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D7EFBCF.70406@fugmann.dhs.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anders Fugmann <afu@fugmann.dhs.org>
Cc: netfilter@lists.netfilter.org

Hello!

On Wed, 11 Sep 2002, Anders Fugmann wrote:

> >
> > I need an advice for this topic: is diverting without forwarding feasible?

> Err, please explain why you do not want forwarding enabled. If this is

Because rule #1: "People makes mistakes". Disabled forwarding gives more
strict and reliable control under possible traffic. There are a few books
where this topic discussed (including O'Reilly's).

>
> You say that you have ssh-tunnels to the systems.
> ssh supports a socks mode. This means that when the client ssh'es to the
> firewall, ssh can be set to act as a local socks server, tunneling all
> packets to the server, making them seem like they originate from the
> server itself. This works just like a VPN, and there is no need to setup
> alot of different tunneling rules. On the client a sock-client should be

OK. Thanks! It sounds interesting. Hm...though it's not so convenient as
"transparent" border gateway (and it lacks some extra work on WSs). There
are also such things as SMB and the kins.:(

SOCKS suck. They stink bad after work.:)

>
> While talking of VPN's. Have you considered ipsec or other VPN systems?
>
> >
> >  I.e. can I change this:
> > "if the kernel does not have forwarding enabled, or it doesn't know how to
> > forward the packet, the packet is dropped"
> > (sorry ,quote from HOWTO) to something like
> > "if the kernel does not have forwarding enabled AND NO SPECIAL DIVERT
> > RULES SPECIFIED, or it doesn't know how to forward the packet, the packet
> > is dropped" ?
> Technically yes. But you would have to spend alot of time coding, and
> understading networking traffic. In essence what you want it to create a
> VPN module for netfilter to be installed on the server and some client
> program to encapsulate packets and send them to the server, which seems
> to me as re-inventing the wheel. (When there are Ferraris out there for
> free, why build your own skoda?)

I didn't catch exactly what you mean as "skoda" but I should note that I
gonna combine the wheel and the skate to get something new ;). I just
gonna add a missed (IMHO) functionality (alike PVCs do). BTW, when
diving deep inside iptables I've felt de jevu: ghost of TLI.:-) And ole
good ipchain was more suitable to tweak packets as I want, right?8-)

OK, me and my colleague had already recognized that there is no out-of-box
solution yet. Alas and sigh but not too bad: we'd just to dig around
PREROUTING filter or so, right?8)

-- 
WBR, Yury Bokhoncovich, Senior System Administrator, NOC of F1 Group.
Phone: +7 (3832) 106228, ext.140, E-mail: byg@center-f1.ru.
Unix is like a wigwam -- no Gates, no Windows, and an Apache inside.



