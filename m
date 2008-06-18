From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: multiprimary conntrackd setup
Date: Wed, 18 Jun 2008 15:05:44 +0200
Message-ID: <48590828.2060206@netfilter.org>
References: <279239c70806170402j47f89251s2379d0909c1bca0e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <279239c70806170402j47f89251s2379d0909c1bca0e@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sebastian Vieira <sebvieira@gmail.com>
Cc: netfilter@vger.kernel.org

Sebastian Vieira wrote:
> Hi,
> 
> I must be looking in the wrong places for documentation but so far i'm
> unable to find it. I'm trying to set up a multiprimary (active-active)
> conntrackd on 2 firewalls. I have conntrackd running on both nodes and
> 'conntrackd -s' shows that mcast is working. However, i still have to
> do a manual 'conntrackd -c;conntrackd -R' to sync both tables (as
> would be proper in a failover / active-backup situation). Other than
> enable  CacheWriteThrough , i couldn't find anything on multiprimary
> setup.

What kind of active-active? There are two kind:
a) symmetric or flow-based: the packets are always handled by the same
firewall replica. In this case, you only have to call conntrackd -c
during the failover (which is usually done by your HA manager such as
keepalived).

b) asymmetric or packet-based: typical case of OSPF setups, there is no
guarantees that the packet is handled by the same firewall replica as
OSPF may change the routes at any time. In that case, you have to enable
the CacheWriteThrough. However, from the design point of view,
conntrackd suits better in the scenario a).

> If someone could point me to the correct documentation, i would
> be very happy indeed :)

There's no documentation on active-active setups yet but there will be
some at some point for sure. Anyway, I'd appreciate if you can write it.
Feel free to ask whatever you need.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
