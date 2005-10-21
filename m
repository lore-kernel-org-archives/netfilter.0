From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: how to let recursive nameserver through
Date: Fri, 21 Oct 2005 05:00:22 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510210458081.8952@filer.marasystems.com>
References: <4357F50E.20907@lists.theorb.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4357F50E.20907@lists.theorb.net>
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
To: iptables-user@lists.theorb.net
Cc: netfilter@lists.netfilter.org

On Thu, 20 Oct 2005 iptables-user@lists.theorb.net wrote:

> I have a 3-leg router/firewall and would like to run a recursive caching
> nameserver (djb's dnscache) on it, but can't figure out how to get it
> past the firewall to query upstream nameservers.

It needs to be allowed to universially query port 53 on UDP and TCP 
(OUTPUT), and responses also needs to be let back (INPUT -m state --state 
ESABLISHED is usually sufficient for the latter).

> I can't even figure out where to try to put a rule for this, or how to
> write it.  Since it's an address ON the router it wouldn't be on the
> FORWARD chain, right?
>
> I'm totally baffled.  Anybody have any ideas where to begin debugging this?

Make sure you always log dropped packets, with a log tag telling you which 
rule caused the packet to be dropped/rejected.

tcpdump is also your friend.

Regards
Henrik

