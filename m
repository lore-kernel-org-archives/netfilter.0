From: Alex Bligh <alex@alex.org.uk>
Subject: Re: SNAT using the same internal address multiple times
Date: Thu, 7 Feb 2013 09:21:18 +0000
Message-ID: <F39A895F-6E7F-4B38-BC6E-738ABDB0F321@alex.org.uk>
References: <738ED808-0B35-4645-9D73-3CB3B5CBC4D7@alex.org.uk> <1360147947.2455.0.camel@BEWS005.euractiv.com>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1360147947.2455.0.camel@BEWS005.euractiv.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jimmy Thrasibule <thrasibule.jimmy@gmail.com>
Cc: Alex Bligh <alex@alex.org.uk>, netfilter@vger.kernel.org

Jimmy,

On 6 Feb 2013, at 10:52, Jimmy Thrasibule wrote:

>> Is it possible to use SNAT like this? (what I'm really asking is whether one can use the ingress interface as part of the NAT tuple):
>> 
>>                  LINUX
>>   eth0 <-------- ROUTER ----------- 10.0.1.0/24
>>                  \\\\\\\------------ 10.0.1.0/24
>>                   \\\\\\------------ 10.0.1.0/24
>>                    \\\\\------------ 10.0.1.0/24
>>                     \\\\------------ 10.0.1.0/24
>>                      \\\------------ 10.0.1.0/24
>>                       \\------------ 10.0.1.0/24
>>                        \------------ 10.0.1.0/24
>> 
>> Each private / internal address is the same on every interface. I plan to use
>> unnumbered interfaces and proxy ARP at the linux level.
>> 
> 
> Hi Alex,
> 
> I don't really get what you are trying to achieve. Can you detail a
> little bit more?

A typical use case: consider all the downstream interfaces are veth
interfaces into either a network container (separate namespaces) or
bridge interfaces into a VM. Let's assume you want to number the
ethernet interface in the container/VM with the same IP address (*)
(10.0.1.1/24 in the above example) and the router will act both
as default route and proxy ARP for things apparently on the same
subnet. Assume the only requirement is for outbound connectivity
through eth0.

There's no reason in theory (I think) why such a NAT should not
work. Outbound packets get NATted to the IP of eth0 saving
the inbound interface in the NAT table. Inbound packets are matched
against the NAT table, have their destination rewritten to the
original source address, and a routed directly out the interface
from which the relevant inbound connection came, rather like a
static interface route.

My question is does iptables support this?


(*) = why on earth would I want to do this? Suppose you have a huge
number of VMs which can live migrate between physical machines. Without
this, IP addressing needs to be globally unique across all VMs
across all physical machines. This is somewhat tedious.

-- 
Alex Bligh




