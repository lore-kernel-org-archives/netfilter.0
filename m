From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: the impossible "iptables -C" option
Date: Sat, 24 Jul 2004 06:16:40 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1090664200.2012.21.camel@grendel>
References: <01be01c4710c$440a79e0$5100a8c0@egp>
	 <200407240856.03201.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407240856.03201.Antony@Soft-Solutions.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>

On Sat, 2004-07-24 at 03:56, Antony Stone wrote:
>
> I understand it to mean "check what would happen to a packet of this type if 
> it went through the ruleset"

Yup, that's what it did under ipchains. :)

> > What is "packet payload"? How does it make the "--check" option impossible
> > to be implemented?
> 
> It makes it impossible to implement --check because there's no way to provide 
> the payload on the command line.

Not quite true as you would just use a sting match, same as you would in
a filtering rule.

The problem is a majority of the time check would end up reporting "it
depends". For example what if you try and check what would happen to "a
packet coming from the Internet to an internal system from 22/TCP to an
upper port number, with the ACK flag set and "foo" in the payload. You
may not have a rule that specifically lets this traffic through, but it
might actually pass if it ends up being a state match due to an initial
outbound SYN packets. So how iptables would handle this packet "depends"
on what traffic went by prior to it.

The check option has said it would be implemented "real soon now" since
iptables was alpha code. I'm guessing the option will never happen. Its
just a carry over from ipchains. ;-)

HTH,
C





