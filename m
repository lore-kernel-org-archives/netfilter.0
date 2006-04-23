From: Robby Workman <netfilter@rlworkman.net>
Subject: Re: Adaptive stealthing/unstealthing of port 113
Date: Sun, 23 Apr 2006 13:11:26 -0500
Message-ID: <444BC34E.3040407@rlworkman.net>
References: <79328ea80604230451w61a266f3w59da83ef8dce2540@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <79328ea80604230451w61a266f3w59da83ef8dce2540@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Asfand Yar Qazi wrote:
> 
> I wanna do [Adaptive Stealthing] on my ADSL firewall!
> 
> How can I do this?  I realise I could just write a custom module in C,
> but you guys probably know of a way to do it with the existing tools.


Well, I'm far from an expert on this, and I'm aware of at least
one other individual who's been (casually) working on doing
something along those lines, but here's what I've worked up:

It (relatively) trivial to do this on a box that's directly
connected to the internet with something like this:

> # Put an entry in /proc/net/ipt_recent/IDENT with the destination address of
> # outgoing SYN packets to SMTP (25 & 587) and IRC (6660:6670 & 7000)
> # Adjust port numbers as needed
> iptables -A OUTPUT -o eth0 -p tcp --sport 1024:65535 -m multiport --dports 25,587,6660:6670,7000 \
> --syn -m state --state NEW -m recent --set --rdest --name IDENT -j ACCEPT
> 
> # Check incoming traffic on port 113 to see if the source address matches the 
> # one recorded on outgoing requests, and that it arrives within ten seconds
> # If so, accept it; othewise, hit next rule and progress toward chain POLICY
> iptables -A INPUT -i eth0 -p tcp --dport 113 -m state --state NEW --syn -m recent \
> --rcheck --rsource --seconds 10 --name IDENT -j ACCEPT

That would essentially open port 113 for ten seconds, but only
for the address to which a packet was sent that might require it
to be opened.

To do this on a firewall/gateway, I'm just about convinced that
there's not a (good) way to do it without coding a (or adding to
an existing) helper module.  I know someone on this list has done
some preliminary work on one, but I don't know if he wants it
made public, so I'll let him decide whether to make himself
known.  Anyway, to do this without a helper module, you could use
a combination of the above rules and midentd (or some other
identd daemon that behaves similarly).

With all that said, I do wonder this: why are you so insistent
upon having the illusion of stealth?

RW

-- 

http://rlworkman.net

