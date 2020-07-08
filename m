From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: nftables: masquerading not applied consistently
Date: Wed, 8 Jul 2020 12:32:18 +0200
Message-ID: <cc19ddc3-f489-6bee-a6d6-60fc76ee5127@thelounge.net>
References: <CANvSZQ-TM-2qs4s8QiiFQmqQG_bebn1ptwHEa3atJm7yxii_BQ@mail.gmail.com>
 <20200707231034.GC32005@breakpoint.cc>
 <CANvSZQ_W2zhudKEYVo7mcMcMFF9JQO-vSz599TECmkU2gZXB3g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CANvSZQ_W2zhudKEYVo7mcMcMFF9JQO-vSz599TECmkU2gZXB3g@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thilo-Alexander Ginkel <thilo@ginkel.com>
Cc: netfilter@vger.kernel.org



Am 08.07.20 um 09:28 schrieb Thilo-Alexander Ginkel:
> On Wed, Jul 8, 2020 at 1:10 AM Florian Westphal <fw@strlen.de> wrote:
>> On first pass (wireguard decap), packet x is picked up by
>> connection tracking and then has NAT applied to it.
>> As no matching NAT rule exists, the connection gets a 'do nothing'
>> binding.    When packet comes back, it will match the existing
>> 'do nothing' connection and the nat table is never consulted.
>>
>> If thats the case, you will either need to turn off contrack for packets
>> coming from wireguard (use 'notrack' keyword in raw table) or, if you
>> need nat for this part as well, place the two rounds the packet takes in
>> different connection tracking zones, so that the packet coming back
>> from gw01/vlan252 is seen as a new flow, rather than an old packet
>> matching a known connection.
> 
> As the WireGuard interface in question doesn not need NAT, I'll try
> the "notrack" approach.

what about limit your NAT rules to the interface where you need it? on
our nat router we have 3 interfaces

* lan
* wan
* vpn

NAT is strictly limited to "wan" and so any wireguard related traffic
would never hit as well as lan-lan forwarding

Chain PREROUTING (policy ACCEPT 15 packets, 2524 bytes)
num   pkts bytes target     prot opt in     out     source
 destination
1       14  2464 NETMAP     all  --  *      *       0.0.0.0/0
 172.17.0.0/24        to:172.16.0.0/24

Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source
 destination
1        0     0 NETMAP     all  --  *      wan     172.16.0.0/24
 0.0.0.0/0            to:172.17.0.0/24
