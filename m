From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Understanding conntrack: Delete and manual readd of same entry
 possible?
Date: Tue, 29 Dec 2009 18:40:38 +0100
Message-ID: <4B3A3F16.6060005@netfilter.org>
References: <4AC9A668.3050009@ait.ac.at> <4B32A248.9070403@netfilter.org> <4B39DCFD.8070808@ait.ac.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B39DCFD.8070808@ait.ac.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Roman Fiedler <roman.fiedler@ait.ac.at>
Cc: netfilter@vger.kernel.org

Roman Fiedler wrote:
> Thanks for the patch. When I've played with the same problem at home I've
> guessed that it is something with sequence numbers and that setting 
> tcp-liberal
> in a netlink test application is a workaround for the DROP. But I did not
> bring it to that point that I could create a clean patch because there were
> still some loose ends. Perhaps someone could help me to fix some of these:
> 
> a) When conntrackd inserts the entries, does it set the liberal also? If 
> yes,
> is it correct, that a failover via conntrackd would disable sequence number
> tracking for all existing entries?

Yes, this is the way it works by now, but it would be easy to make a 
patch not to disable it. I'm going to prepare one now that 
conntrack-tools 0.9.14 is out. I'll let you know, you may want to help 
me doing some testing.

> b) Does the netlink api support sequence number parameters? If not, 
> should it?

IIRC the kernel already supports it, but user-space support for 
libnetfilter_conntrack and conntrackd is still missing.

> c) If the sequence numbers are not set by the conntrack utility, where 
> do the
> values in the kernel space come from? Are they all 0 or is it uninitialized
> memory from user or kernel space?

Not sure what you mean. Currently, we are setting the 
IP_CT_TCP_FLAG_BE_LIBERAL flag so window tracking is disabled for 
entries created via ctnetlink.

I'm going to look into this so we may have it for the next 
conntrack-tools release.
