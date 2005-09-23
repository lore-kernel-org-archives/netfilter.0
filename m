From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: IPTABLES drops packages for existing rules
Date: Fri, 23 Sep 2005 08:14:39 -0500
Message-ID: <200509230814.39994.rob0@gmx.co.uk>
References: <4333D76B.9030900@net-m.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4333D76B.9030900@net-m.de>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Friday 23 September 2005 05:22, Iulian Topliceanu wrote:
> There are plenty of ACCEPT rules, and in the end a general DENY

"DENY"? Is that an ipchains target?

> to drop everything that didn't match the ACCEPT rules (obviously)
>
> There are plenty of NAT rules as well, portforwading and stuff like.

Not knowing what those rules are, I cannot help you. Of course if it's 
as huge and complex as I suspect it is I probably wouldn't even try. I 
have work to get done today.

> Now, *sometimes* but just *sometimes*, ICMP and TCP packages are
> simply matching the general DENY rule and dropped, though there is a
> rule that says that LAN hosts can communicate without restrictions
> between them (there are 8 subnets)

So you have seen some kind of pattern. Try LOG for packets before 
the ... well, you said "DENY" but I am not so sure. The string DENY 
(case insensitive) is not in my iptables(8) manual. LOG only what 
matches your pattern.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

