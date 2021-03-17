From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nfqueue ethernet packet frame capture
Date: Wed, 17 Mar 2021 16:53:09 +0100
Message-ID: <20210317155309.GB1140@salvia>
References: <CADtAAp7ReZoa1kLSm4oc7um9-vQ_XUnq9t80mN4T8igZQjyxUA@mail.gmail.com>
 <20210317143713.GA3781@salvia>
 <CADtAAp7Da8BtAK2zvhnT-RTG1myzbZ6k0xZgmifhsuYLAukDCQ@mail.gmail.com>
 <20210317155251.GA1140@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20210317155251.GA1140@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ilker <ilkery@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, Mar 17, 2021 at 05:41:53PM +0300, ilker wrote:
> it only gives the source MAC address:(
> I need the destination MAC address.. I will use
> src_mac+dst_mac+ethertype and reconstruct the full ETH header.
> I tried
> nfq_get_physindev_name
> nfq_get_physoutdev_name
> nfq_get_indev_name
> nfq_get_outdev_name
> 
> but neither of them gave me a MAC.
> A libpcap fanboy said that netfilter can not and libpcap can give.. I
> don't want to convert my code to pcap that is why I am looking for a
> solution.

nfq_get_indev_name provides the input device. From userspace, you can
retrieve the destination MAC from the indev. The ethernet protocol is
coming in the ->hw_protocol field.
