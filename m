From: Alex Bligh <alex@alex.org.uk>
Subject: Re: SNAT using the same internal address multiple times
Date: Thu, 7 Feb 2013 20:39:11 +0000
Message-ID: <7E0B2326-5799-4BC0-B28E-A0DCCDAEB601@alex.org.uk>
References: <738ED808-0B35-4645-9D73-3CB3B5CBC4D7@alex.org.uk> <1360147947.2455.0.camel@BEWS005.euractiv.com> <F39A895F-6E7F-4B38-BC6E-738ABDB0F321@alex.org.uk> <1360256176.2455.15.camel@BEWS005.euractiv.com>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1360256176.2455.15.camel@BEWS005.euractiv.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jimmy Thrasibule <thrasibule.jimmy@gmail.com>
Cc: Alex Bligh <alex@alex.org.uk>, netfilter@vger.kernel.org


On 7 Feb 2013, at 16:56, Jimmy Thrasibule wrote:

> OK, the problem here is to keep your interface MAC address when sending
> a packet. You have the `bonding` driver to group interface but I don't
> think it permits such a thing as it is more for load-balancing.

Towards the VM? It doesn't care about the originating MAC. The destination
MAC should be in the neighbor table in the normal way.

>> (*) = why on earth would I want to do this? Suppose you have a huge
>> number of VMs which can live migrate between physical machines. Without
>> this, IP addressing needs to be globally unique across all VMs
>> across all physical machines. This is somewhat tedious.
> 
> But in any case, how would you set up your virtual machines as they need
> an IP address?

I could configure them statically. Actually what I'd do is use an extremely
lightweight tiny DHCP server I have written that would simply answer with
the same IP address for any query. Given they all have the same IP address,
this seems satisfactory.

-- 
Alex Bligh




