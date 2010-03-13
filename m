From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: drop dhcp request from a particular mac address, after a dhcp
 relay
Date: Sat, 13 Mar 2010 20:29:12 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1003132023260.16126@aurora.sdinet.de>
References: <937499.80494.qm@web31506.mail.mud.yahoo.com> <4B9B4860.5010509@chello.at> <hngcvl$e12$1@dough.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <hngcvl$e12$1@dough.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Nichols <rnicholsNOSPAM@comcast.net>
Cc: netfilter@vger.kernel.org

On Sat, 13 Mar 2010, Robert Nichols wrote:

> As for iptables, if you're using a high-level firewall builder to
> generate the rules, then yes, it will probably reload the entire rule
> set if you make any change.  If you work at a lower level and use the
> 'iptables' command directly, then only the rule you add or change is
> affected.  You can confirm that quite easily by running "iptables -vnL"
> before and after the change and observing that the packet counts for
> the other rules do not get reset.

No, this is not correct.

The iptables command downloads the whole ruleset from the kernel, 
including current counter values, modifies the downloaded version, and 
then uploads the whole resulting ruleset (again, with counter 
values) into the kernel again.

This "download whole ruleset, modify in userspace, upload" cycle is why 
iptables-restore is so much faster than multiple calls to the iptables 
program - it only downloads once, applies all changes from the input, 
and then uploads back to the kernel once.

c'ya
sven-haegar

-- 
Three may keep a secret, if two of them are dead.
- Ben F.
