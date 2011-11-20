From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: trouble setting default route for load-balancing routing tables
Date: Sun, 20 Nov 2011 09:10:19 -0600
Message-ID: <op.v4823hgfx1lyi3@debiandesk2.net>
References: <op.v4721hs0x1lyi3@debiandesk2.net>
 <1321798603.2382.987.camel@andybev-desktop>
 <op.v482atdzx1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <op.v482atdzx1lyi3@debiandesk2.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: netfilter@vger.kernel.org

<snip>
> Thanks a million!  Now I'll check to see if these rules (added later in the script) are working:
>
> + ip rule add to 200.122.146.32/27 table T1
> + ip rule add to 200.91.79.0/27 table T1
>
> These are supposed to route all traffic to IPs in those subnets through table T1, overriding load-balancing for those destinations.
>
> <snip>
>
>>>   However,
>>>  it ignores my rules which should direct certain traffic over a
>>>  particular interface.

Now that the default routes are set in tables T1 and T0, the above rules to "override" the load-balancing appear to work perfectly.  The router will ONLY send packets to T1 (eth1) for those subnets, even though that interface is "weighted" to receive a lot less traffic:

+ ip route add default scope global nexthop via 192.168.100.11 dev eth0 weight 92 nexthop via 192.168.90.1 dev eth1 weight 7

Now for tests with multiple connections... :)
