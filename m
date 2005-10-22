From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: IP  Forwarding
Date: Sat, 22 Oct 2005 14:53:28 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510221450350.32674@filer.marasystems.com>
References: <43595BFA.1070200@airmail.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43595BFA.1070200@airmail.net>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Jerry Alexander <jerrya@airmail.net>
Cc: netfilter@lists.netfilter.org

On Fri, 21 Oct 2005, Jerry Alexander wrote:

>         I cannot get IPTABLES FORWARDing to work when the machines are 
> directly
> connected via a twisted cable.

What should be forwarded from where?

>        Does FORWARDing only work with a router between the machines in 
> question?

No, but it only works when YOU act as a router for something going from 
somewhere to somewhere else via you.

>        If not, how can I get it to work?   I see the packets coming into the 
> box(ethereal)
> but none going out.

Does it work if you don't load any iptables rules?

If not your basic networking is not properly set up/configured.

If it works without iptables then your iptables ruleset is not properly 
constructed, most likely dropping the traffic.

Regards
Henrik

