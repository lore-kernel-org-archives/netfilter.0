From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: trouble setting default route for load-balancing routing tables
Date: Sun, 20 Nov 2011 08:53:07 -0600
Message-ID: <op.v482atdzx1lyi3@debiandesk2.net>
References: <op.v4721hs0x1lyi3@debiandesk2.net>
 <1321798603.2382.987.camel@andybev-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1321798603.2382.987.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: netfilter@vger.kernel.org

On Sun, 20 Nov 2011 08:16:43 -0600, Andrew Beverley <andy@andybev.com> wrote:

> On Sat, 2011-11-19 at 20:11 -0600, Lloyd Standish wrote:
>> Hi Everyone,
>>
>> I'm configuring a load-balancing netfilter router.  It does round-robin load balancing over 2 external interfaces, eth0 and eth1.  The natted LAN is on eth4.  eth0 is attached to table T0, and eth1 uses table T1.
>>
>> I am unable to add default routes to the routing tables T0 and T1.  Here is the output from my bash script that sets up the router:
>>
>> + ip route flush table T0
>> + ip route add 192.168.100.0/24 dev eth0 src 192.168.100.10 table T0
>> + ip route add default via 192.168.100.11 table T0
>> RTNETLINK answers: No such process
>
> I see nothing wrong with your rules. That error implies that the kernel
> doesn't know what 192.168.100.11 is, but it's clearly accepted it for
> the default route in the main routing table. Has anything changed
> between you writing the rules above and writing the rules for the main
> table?

These are the rules taken straight from my bash script.  I have spent hour after hour searching the Internet for clues on this, and finally gave up at 1:00 AM this morning.

>
> Is the IP address for eth0 correctly configured at this point? An
> incorrect netmask will cause the error above.

Moments after reading your question about eth0 being configured at the point the default gateway for the table is created, I checked that, and saw eth0 was NOT yet configured!  I just changed the order of the commands, and it worked!:

+ ip route flush table T1
+ ip route add 192.168.90.0/24 dev eth1 src 192.168.90.10 table T1
+ ip rule add from 192.168.90.10 table T1
+ ip route add 192.168.50.0/24 dev eth4 table T1
+ ip route add 127.0.0.0/8 dev lo table T1
+ ip route add 192.168.90.0/24 dev eth1 src 192.168.90.10
+ ip route add default via 192.168.90.1 table T1

Thanks a million!  Now I'll check to see if these rules (added later in the script) are working:

+ ip rule add to 200.122.146.32/27 table T1
+ ip rule add to 200.91.79.0/27 table T1

These are supposed to route all traffic to IPs in those subnets through table T1, overriding load-balancing for those destinations.

<snip>

>>   However,
>>  it ignores my rules which should direct certain traffic over a
>>  particular interface.
>
> I assume that you have no need to keep the same connection stream on the
> same interface? If you do, you can use netfilter marks (and netfilter
> connection tracking) to do the load balancing instead, as described on
> this page:

I may have to do that, but from what I've read, rule like the ones I posted above are supposed to be evaluated before the default "nexthopping" route in table main, because of the rules numbering, and that's the way my rules appear:

root@debiandesk2:/home/lloyd/data/traffic_shaping# ip rule show
0:	from all lookup local
32762:	from all to 200.91.79.0/27 lookup T1
32763:	from all to 200.122.146.32/27 lookup T1
32764:	from 192.168.90.10 lookup T1
32765:	from 192.168.100.10 lookup T0
32766:	from all lookup main
32767:	from all lookup default

My script has to reconfigure the firewall when an uplink fails and again when it recovers connectivity.  I used a program called lsm (link status monitor, http://lsm.foobar.fi/) for this.  I think this will be useful to others.  When I get it all working I'll post it on my website and post here.
