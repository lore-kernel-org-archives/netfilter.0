From: Kishore Dharmavaram <kishored@servgate.com>
Subject: RE: Memory leaks in ip_conntrack?
Date: Fri, 7 Nov 2003 15:39:49 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <EFBADA8C200C2B418DA39734FD15475B0B2044@skat.sky.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Hi,

I suspect ip_conntrack is holding memory for connections even after those
connections expired or cleared; There are only 21 entries in
/proc/net/ip_conntrack but /proc/slabinfo shows 131072 active entries. I
don't understand what happened to (131072-21)=131051 entries?.

Thanks,
-Kishore

-----Original Message-----
From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]
Sent: Friday, November 07, 2003 2:59 PM
To: 'netfilter@lists.netfilter.org'
Subject: Re: Memory leaks in ip_conntrack?


On Friday 07 November 2003 10:21 pm, Kishore Dharmavaram wrote:

> Hi All,
>
> I have a Linux box running 2.4.20 kernel with netfilter(ip_conntrack)
> compiled-in. When I do stress test on the box I find from /proc/slabinfo
> that ip_conntracks have reached maximum value 131072 and box stopped
> processing to any traffic, but strange thing is there are only 21 entries
> in /proc/net/ip_conntrack.
>
> My question is why are there only 21 entries in "/proc/net/ip_conntrack"
> when /proc/slabinfo shows 131072 entries, does this indicate memory leaks
> in netfilter code?
>
> Please provide me some insight, hints into the problem, is there any way I
> can find out rest of ip_conntracks.
>
> Note: There are application proxies, squid(Http), POP, SMTP, FTP, running
> on the Linux box.

ip_conntrack should not use more than a few hundred bytes per connection 
being tracked.

Squid will use a lot of memory given the opportunity.
What are you using for a pop proxy?
I assume by smtp proxy you mean sendmail, exim, qmail etc, and for ftp
you're 
using frox?
These last shouldn't use much in the way of memory unless there's a problem.

In order to pin the memory usage down to iptables please try the system 
without the proxies running (by the way, what do you mean by "stress test"?)

and see if the situation is the same.

Antony.

-- 

There are two possible outcomes.

If the result confirms the hypothesis, then you've made a measurement.
If the result is contrary to the hypothesis, then you've made a discovery.

 - Enrico Fermi
                                                     Please reply to the
list;
                                                           please don't CC
me.

