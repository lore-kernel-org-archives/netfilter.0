From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nfqueue ethernet packet frame capture
Date: Thu, 18 Mar 2021 01:39:36 +0100
Message-ID: <20210318003936.GA23475@salvia>
References: <CADtAAp7ReZoa1kLSm4oc7um9-vQ_XUnq9t80mN4T8igZQjyxUA@mail.gmail.com>
 <20210317143713.GA3781@salvia>
 <CADtAAp7Da8BtAK2zvhnT-RTG1myzbZ6k0xZgmifhsuYLAukDCQ@mail.gmail.com>
 <20210317155251.GA1140@salvia>
 <20210317155309.GB1140@salvia>
 <20210317155414.GA1197@salvia>
 <CADtAAp55F0KjqS6VCT4NZwzAG5XCk+Z__vum_suL+E2o5tDo9w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CADtAAp55F0KjqS6VCT4NZwzAG5XCk+Z__vum_suL+E2o5tDo9w@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ilker <ilkery@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, Mar 17, 2021 at 08:49:18PM +0300, ilker wrote:
> What i get from indev from a sample capture are as follows;
> indev_name = *
> outdev_name = wlan0
> physindev_name = *
> physoutdev_name = *

I see, so you'd like to catch the packet from the output path.

> nfq_get_physindev_name returns device name on my host. I can retrieve
> wlan0 mac but this would be the MAC address on my host. (I am testing
> my application on PC for now but the target is a router as you said)
> 
> What I am looking for is a destination MAC address. e.g. when I
> capture the network on the same host via libpcap, I get following dump
> 17:29:34.575912 AA:AA:AA:AA:AA:AA > BB:BB:BB:BB:BB:BB, ethertype IPv4
> (0x0800), length 1197: (tos 0x0, ttl 57, id 37046, offset 0, flags
> [DF], proto TCP (6), length 1183)
> 
> where AA:AA:AA:AA:AA:AA is the gateway_MAC_address that my PC
> connected and BB:BB:BB:BB:BB:BB is the wlan_interface_mac of my PC.
> My aim is to capture my gateway mac address (AA:AA:AA:AA:AA:AA) as a
> destination MAC from my PC via NFQUEUE. (like tcpdump example)
> 
> Is that possible?

The problem is that the MAC address is not yet know from the output
path (postrouting hook) since it comes before the neighbour layer.
So the MAC address is not yet know.

You could catch the packet via nfqueue and then send a query to obtain
the destination MAC address by the IP destination through rtnetlink
(neighbour cache lookup from userspace).

An alternative would be to have netfilter egress hook (layer 2 MAC
information is already available from there) and add nfqueue support
too, but that's not available upstream.
