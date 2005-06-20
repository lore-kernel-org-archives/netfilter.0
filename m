From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: iptables leaking blocked ip addresses.
Date: Tue, 21 Jun 2005 00:29:27 +0200 (CEST)
Message-ID: <Pine.LNX.4.62.0506210019551.2906@mercury.sdinet.de>
References: <49bf7d7050620083448c1dee9@mail.gmail.com>
	<200506201055.25861.rob0@gmx.co.uk>
	<49bf7d7050620091748a270fc@mail.gmail.com>
	<Pine.LNX.4.62.0506202125290.28510@mercury.sdinet.de>
	<49bf7d705062013236f4e105a@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <49bf7d705062013236f4e105a@mail.gmail.com>
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
To: "terry l. ridder" <artisticforge@gmail.com>
Cc: netfilter@lists.netfilter.org

On Mon, 20 Jun 2005, terry l. ridder wrote:

> On 6/20/05, Sven-Haegar Koch <haegar@sdinet.de> wrote:
>> On Mon, 20 Jun 2005, terry l. ridder wrote:
>>
>>>>> one example of the leak is below:
>>>>>
>>>>> 200.0.0.0/8 is dropped if the destination port is 25 (smtp).
>>>>
>>>> iptables-save(8) output, please. What you posted here doesn't tell us
>>>> much.
>>>>
>>>
>>> while i have reservations concerning posting the output of iptables-save
>>> i have placed it on my web server:
>>>
>>> http://204.238.34.206/iptables-save-20jun2005.txt
>>
>> You are filtering in the nat table.
>>
>
> yes, i am.
>
>> The nat table gets only the first packet from each connection (the one
>> that would match -m state --state NEW).
>>
>
> that is incorrect. the nat table is getting all packets.

no, it's not.

please have a look at "man iptables":

     nat:
           This  table  is  consulted  when a packet that creates a new
           connection is encountered.  It consists of three  built-ins:
           PREROUTING  (for  altering packets as soon as they come in),
           OUTPUT (for altering locally-generated packets before  rout-
           ing),  and  POSTROUTING  (for  altering  packets as they are
           about to go out).

Note the "is consulted when a packet that creates a new connection is 
encountered" - once for every new connection, not for all following 
packets.

>> A retransmit from the blocked IP will not be a new connection,
>> so it will pass through your rules.
>
> again this is incorrect.

no - once a connection entry in /proc/net/ip_conntrack is created, a 
restransmit will match this entry even if it's a tcp-syn again.

netfilter-connections are different from tcp connections.

>> And on your comment to another mail that you are not using connection
>> tracking:
>> This is wrong. If you have the nat table, you must have ip_conntrack
>> loaded - and if its loaded it tracks your connections, even if you
>> dont use -m state at all. There is no iptables nat without connection
>> tracking.
>
> i may have been looking at the wrong window, i will check on that.

thr textfile referenced your other mail contains IP_NF_CONNTRACK=m for 
your firewall - connection-tracking is at least built.

And if you load the nat support (aka iptable_nat module) the ip_conntrack 
module will be loaded, too.

Look at the module-dependencies in your /lib/modules/`uname 
-r`/modules.deb, mine says:

/lib/modules/2.6.10-ac10-aurora/kernel/net/ipv4/netfilter/iptable_nat.ko: 
/lib/modules/2.6.10-ac10-aurora/kernel/net/ipv4/netfilter/ip_conntrack.ko 
/lib/modules/2.6.10-ac10-aurora/kernel/net/ipv4/netfilter/ip_tables.ko

meaning that to load iptable_nat.ko the modules ip_conntrack.ko und 
ip_tables.ko need to be loaded.

c'ya
sven

-- 

The Internet treats censorship as a routing problem, and routes around it.
(John Gilmore on http://www.cygnus.com/~gnu/)

