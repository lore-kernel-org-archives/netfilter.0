From: Vigneswaran R <vignesh@atc.tcs.com>
Subject: Re: Wrong routing when combining ip rule with SNAT
Date: Thu, 19 Sep 2013 14:55:38 +0530
Message-ID: <523AC312.4080300@atc.tcs.com>
References: <8761u59uit.fsf@vostro.rath.org> <52379693.80707@ngtech.co.il> <87li2w9scf.fsf@vostro.rath.org> <5239401A.4020108@atc.tcs.com> <87r4cmc922.fsf@rath.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <87r4cmc922.fsf@rath.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org, Nikolaus Rath <Nikolaus@rath.org>

On 09/18/2013 11:21 PM, Nikolaus Rath wrote:
> Vigneswaran R <vignesh@atc.tcs.com> writes:
>> On 09/17/2013 06:28 AM, Nikolaus Rath wrote:
>>> Hi Eliezer,
>>>
>>> I have a VPN connection, and I want to tunnel everything through the VPN
>>> node -- except, of course, the VPN connection itself.
>>>
>>> The hard part is to also tunnel non-VPN connections to the VPN node
>>> itself. In other words how do I make sure that every connection to the
>>> external ip of the VPN node is tunneled through its internal ip --
>>> except for the packets that form the tunnel itself?
>>>
>>> My idea was install a default route to the internal ip of the VPN node,
>>> use iptables to mark the VPN connections and then set up a special
>>> routing table for those. But maybe there's an easier way?
>> * What is the internal IP of the VPN node? Is it 192.168.12.1 (and
>> ebox is the VPN node)?
>>
>> * How the nodes are connected? Is it something like,
>>
>>     vostro <---> ebox <---> [Internet]
>>
>> If so, where is 192.168.17.1 located.
> Ok, you asked for it. Here's my attempt at ASCII art :-).
>
>
> vostro  <--[192.168.17.0/24]--> evil-nat-dpi-firewall-box
>    ^                                        ^
>    |                                        |
>    |                                    [Internet]
>    |                                        |
>    |                                        |
>    `---[192.168.12.0/24]---> ebox <---------'

This is better :-)

> So vostro is connected to some local network (e.g. 192.168.17.0/24, but
> that changes depending on where I am) and to the VPN
> (192.168.12.0/24). The local network is connected to the internet using
> some (typically overly restricive) NAT box. ebox is connected to the
> internet and to the VPN. I'm establishing the VPN by setting up an HTTP
> tunnel through the internet to ebox.
>
> Once the tunnel is established, I want that almost packet goes from
> vostro to the internet to go through the VPN -- including packets
> destined for ebox's public ip, but excluding packets that are destined
> to port 80 of ebox's public ip (because they form the tunnel itself).

Ok. It seems using SNAT as suggested by Pascal on another mai, is 
better. So, overall,

* Mark the packets destined to VPN_EXT_IP:80 to differentiate it from 
the rest of the traffic
* Reroute the rest of the traffic via 'rath' Interface, using policy routing
* SNAT/MASQUERADE the packets going out via 'rath' Interface to have the 
correct source IP


Regards,
Vignesh
>
>
> Best,
> Nikolaus
>    

