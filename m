From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: NAT/POSTROUTING rules doesn't match packets (SOLVED?)
Date: Mon, 10 Oct 2005 00:06:19 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510100003030.30581@filer.marasystems.com>
References: <20051004070925.7E2783C65565@mailgate.informatik.haw-hamburg.de>
	<200510072133.37280.marek.zachara@conexe.pl>
	<200510072144.57493.marek.zachara@conexe.pl>
	<200510072159.16784.marek.zachara@conexe.pl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510072159.16784.marek.zachara@conexe.pl>
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
To: Marek Zachara <marek.zachara@conexe.pl>
Cc: netfilter@lists.netfilter.org

On Fri, 7 Oct 2005, Marek Zachara wrote:

> As a workaround, is there a way to manually clean up conntrack table

There is two methods

   a) Unloading the ip_conntrack module

   b) Using the newly released conntrack tools (requires kernel support).

> i'd put it in the boot scripts to assure such problems doesn't happen 
> again. I know i can put a iptable rule to block all incoming UDP traffic 
> for 3 minutes after boot-up (so the entries get cleaned), but this makes 
> the router useless for these 3 minutes ...

The entry SHOULD NOT appear in conntrack until there is a route of some 
kind for the destination.

Unless you are dependent on dynamic address information on eth1 you could 
load your whole iptables ruleset before any of the networking is started. 
Or at least make sure ip_conntrack is not loaded before the NAT rules are 
created.

Regards
Henrik

