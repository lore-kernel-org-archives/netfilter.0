From: Les Mikesell <les@futuresource.com>
Subject: Re: the impossible "iptables -C" option
Date: Sat, 24 Jul 2004 13:46:22 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1090694781.17721.43.camel@les-home.futuresource.com>
References: <01be01c4710c$440a79e0$5100a8c0@egp>
	 <200407240856.03201.Antony@Soft-Solutions.co.uk>
	 <1090664200.2012.21.camel@grendel>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1090664200.2012.21.camel@grendel>
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
To: Chris Brenton <cbrenton@chrisbrenton.org>
Cc: netfilter <netfilter@lists.netfilter.org>

On Sat, 2004-07-24 at 05:16, Chris Brenton wrote:

> The problem is a majority of the time check would end up reporting "it
> depends". For example what if you try and check what would happen to "a
> packet coming from the Internet to an internal system from 22/TCP to an
> upper port number, with the ACK flag set and "foo" in the payload. You
> may not have a rule that specifically lets this traffic through, but it
> might actually pass if it ends up being a state match due to an initial
> outbound SYN packets. So how iptables would handle this packet "depends"
> on what traffic went by prior to it.

I'm not sure how that affects the ability to report what it would
do with a packet "right now" and why, or the users need for this
report when trying to debug a problem.  I have a situation where
I can see strange results with tcpdump and would like to know
what combination of rules is causing it.

---
  Les Mikesell
   les@futuresource.com




