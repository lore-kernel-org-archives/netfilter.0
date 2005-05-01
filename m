From: Dean Anderson <dean@av8.com>
Subject: Re: ICMP types
Date: Sat, 30 Apr 2005 23:29:05 -0400 (EDT)
Message-ID: <Pine.LNX.4.44.0504302320540.990-100000@cirrus.av8.net>
References: <8a79f08aaeef.8aaeef8a79f0@vsnl.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <8a79f08aaeef.8aaeef8a79f0@vsnl.net>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: varun_saa@vsnl.net
Cc: netfilter@lists.netfilter.org

Necessary messages: (never block)
        3 Destination Unreachable
                (block code 4 and break PATH MTU)
                (other codes are "Nice")

Good Messages: (never harmful)
        11 Time to live Exceeded

Nice messages: (sometimes harmful)
        4 Source Quench
        8/0 Echo Request/Reply
        12 Parameter Problem
        13/14 Timestamp Request/Reply
        15/16 Information Request/Reply


Dangerous (ought to be blocked, unless you know you need it;
                in that case tightly restricted)
        5 Redirect


There was also recently an IOS patch released that exploited type 3 code 4
(fragmentation needed--used in Path MTU Discovery) packets to reduce the
MTU size to nearly nothing.  To do this, one needs the correct port
numbers of a TCP connection, but this isn't all that hard to get in some
cases. I don't recommend blocking type 3 code 4, but the attack can still
be recognized, and the TCP stack can reject unrealisticly small PMTU 
sizes.

It might be handy to have a filter that recognizes this PMTU attack and 
blocks it dynamically.  

		--Dean

On Sat, 30 Apr 2005 varun_saa@vsnl.net wrote:

> Hello,
>       As I understand there are more one 
> type of ICMP ping.
> 
> What are these types and should they
> all be allowed in iptables rules ?
> 
> Thanks
> 
> Varun
> 
> 
> 
> 

-- 
Av8 Internet   Prepared to pay a premium for better service?
www.av8.net         faster, more reliable, better service
617 344 9000   



