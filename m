From: Whit Blauvelt <whit@transpect.com>
Subject: Re: SNAT "invalid argument"
Date: Mon, 4 Aug 2003 15:56:14 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030804195613.GA8638@free.transpect.com>
References: <20030804185601.GA8546@free.transpect.com> <06a001c35abb$cfcf0120$1100000a@busbydev>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <06a001c35abb$cfcf0120$1100000a@busbydev>
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
Content-Transfer-Encoding: 7bit
To: David Busby <busby@pnts.com>
Cc: netfilter@lists.netfilter.org

Hi David,

Interesting, since in this document:

http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-6.html#ss6.1

I read (and directly paste from there):

## Change source addresses to 1.2.3.4.
# iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to 1.2.3.4

But anyway:

# iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 207.136.236.68
iptables: Invalid argument

And also:

# iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables: Invalid argument

Now, that second failure has nothing to do with whether the current syntax
is --to (per the HOWTO I see) or --to-source (per the version you report).
The root of both problems is bound to be the same here.

How you're seeing different text in the same document on the official site
(and with Rusty's name on it) is curious. In any case the problem I'm seeing
has a different basis. ;(

Whit

On Mon, Aug 04, 2003 at 12:08:38PM -0700, David Busby wrote:
> In this doc
> http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-6.html#ss6.1 it says
> use --to-source, not --to
> 
> /B
> ----- Original Message ----- 
> From: "Whit Blauvelt" <whit@transpect.com>
> To: <netfilter@lists.netfilter.org>
> Sent: Monday, August 04, 2003 11:56
> Subject: SNAT "invalid argument"
> 
> 
> > Hi,
> >
> > I've been using SNAT for some time on several systems. However on a system
> I
> > just built I get the following response:
> >
> > # iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to 1.2.3.4
> > iptables: Invalid argument
> >
> > That's with 1.2.3.4 replaced by a real IP (or not).
> >
> > This is driving me up the wall since "Full NAT"  support is compiled into
> > the 2.4.21 kernel. The iptables version is 1.2.8. The only thing different
> > in the kernel options from what I've used before is that I also included
> > "NAT of local connections" - haven't tried to use that yet though.
> >
> > iptables is otherwise working fine. -j MASQUERADE (also compiled in) also
> > gives me an "Invalid argument" - so it does look like something's wrong in
> > the NAT section, but damned if I know what.
> >
> > Whit
> >

