From: Georgi Alexandrov <tehlists@hotpop.com>
Subject: Re: Block outbound host to specific port(s) using Masq./NAT?
Date: Wed, 05 Jan 2005 14:41:36 +0200
Message-ID: <41DBE080.2050204@hotpop.com>
References: <5dda57be050103135225b4e665@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5dda57be050103135225b4e665@mail.gmail.com>
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


If you're getting into "greping" packets payload for different 
apps/services, you can try layer 7 filtering - 
http://l7-filter.sourceforge.net/

regards,
Georgi Alexandrov


Jerry2A wrote:

>Hello - this is probably a dumb question....I'm using iptables for my
>home network (DSL) and I have masquerading, some port forwarding,
>etc., etc., and everything works great...EXCEPT....I have a situation
>where I occaisionally want to block outbound traffic from a certain
>host inside to a certain destination IP and/or port.  For example, I'd
>like to block one host from within my network from using Instant
>Messenger but still allow web surfing.  I've been able to dynamically
>block ALL outbound access to the internet but I'm unable to restrict
>access to certain destination ports.
>
>So this works:
>iptables -A INPUT -s 10.1.1.10 -j DROP
>iptables -A OUTPUT -d 10.1.1.10 -j DROP
>iptables -A FORWARD -d 10.1.1.10 -j DROP
>
>And I thought I could do something like this:
>iptables -A OUTPUT -s 10.1.1.10 -p tcp -m tcp --dport 5190 -j DROP
>iptables -A FORWARD -d 10.1.1.10 -p tcp -m tcp --dport 5190 -j DROP
>....but it has no effect.
>
>I've tried different combinations of "-d and -s" and "--dport and
>--sport" just to see if I was doing something backwards....no dice.  I
>was wondering if I needed to set up some kind of pre or post routing
>because of the masquerading?
>
>Any help would be appreciated.
>
>Thanks!
>
>Jerry A.
>
>
>  
>


