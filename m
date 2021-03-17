From: ilker <ilkery@gmail.com>
Subject: Re: nfqueue ethernet packet frame capture
Date: Wed, 17 Mar 2021 20:49:18 +0300
Message-ID: <CADtAAp55F0KjqS6VCT4NZwzAG5XCk+Z__vum_suL+E2o5tDo9w@mail.gmail.com>
References: <CADtAAp7ReZoa1kLSm4oc7um9-vQ_XUnq9t80mN4T8igZQjyxUA@mail.gmail.com>
 <20210317143713.GA3781@salvia> <CADtAAp7Da8BtAK2zvhnT-RTG1myzbZ6k0xZgmifhsuYLAukDCQ@mail.gmail.com>
 <20210317155251.GA1140@salvia> <20210317155309.GB1140@salvia> <20210317155414.GA1197@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M9Py232JoYPbUg1IbTepw+/ppXusZff3N0thqDofzmA=;
        b=TKyMHbssIfbmfs9rMj0BaSTd8GeTAZAUMXBKoB6SfIH6KJMzKv8xdRJBAOWAd1ZDPF
         9miXiE0TV5iDh74MPRdsNFvKJeqWTFIKJdw1Qa8MpoTA5aScjobCuc4iaUY+3FDwoXet
         4CYwHwQKoLDDOAlbyxhAqUcIvQ/cnQFnmVrCzo+cfwb6KQ6h1xwyrLGmmtZTVbG0SVJt
         ferFChMNXUQ9CYaXtnVM16MMndytNdHDeEBOzzfXapRiYgKX6tNs+zFcRThdPErAkbNG
         O7/JxOmW/2IfGAb2wZDWels/ezHVIcYWo2Z/W7Qu2VulXg1auDz3p74iVEhbK05F38vc
         HA5g==
In-Reply-To: <20210317155414.GA1197@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

What i get from indev from a sample capture are as follows;
indev_name = *
outdev_name = wlan0
physindev_name = *
physoutdev_name = *

nfq_get_physindev_name returns device name on my host. I can retrieve
wlan0 mac but this would be the MAC address on my host. (I am testing
my application on PC for now but the target is a router as you said)

What I am looking for is a destination MAC address. e.g. when I
capture the network on the same host via libpcap, I get following dump
17:29:34.575912 AA:AA:AA:AA:AA:AA > BB:BB:BB:BB:BB:BB, ethertype IPv4
(0x0800), length 1197: (tos 0x0, ttl 57, id 37046, offset 0, flags
[DF], proto TCP (6), length 1183)

where AA:AA:AA:AA:AA:AA is the gateway_MAC_address that my PC
connected and BB:BB:BB:BB:BB:BB is the wlan_interface_mac of my PC.
My aim is to capture my gateway mac address (AA:AA:AA:AA:AA:AA) as a
destination MAC from my PC via NFQUEUE. (like tcpdump example)

Is that possible?

Thanks for your help
regards,

On Wed, Mar 17, 2021 at 6:54 PM Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>
> On Wed, Mar 17, 2021 at 04:53:09PM +0100, Pablo Neira Ayuso wrote:
> > On Wed, Mar 17, 2021 at 05:41:53PM +0300, ilker wrote:
> > > it only gives the source MAC address:(
> > > I need the destination MAC address.. I will use
> > > src_mac+dst_mac+ethertype and reconstruct the full ETH header.
> > > I tried
> > > nfq_get_physindev_name
> > > nfq_get_physoutdev_name
> > > nfq_get_indev_name
> > > nfq_get_outdev_name
> > >
> > > but neither of them gave me a MAC.
> > > A libpcap fanboy said that netfilter can not and libpcap can give.. I
> > > don't want to convert my code to pcap that is why I am looking for a
> > > solution.
> >
> > nfq_get_indev_name provides the input device. From userspace, you can
> > retrieve the destination MAC from the indev. The ethernet protocol is
> > coming in the ->hw_protocol field.
>
> I'm assuming your setup is a router, then destination MAC can be
> infered.
