From: Robin Wood <robin@digininja.org>
Subject: Re: transparent proxy and iptables (and ebtables) failing
Date: Tue, 13 Oct 2009 22:27:00 +0100
Message-ID: <7de411230910131427t26e7a84cg181329b8c32d62f9@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

2009/10/7 Robin Wood <robin@digininja.org>:
> 2009/10/7 Robin Wood <robin@digininja.org>:
>> Hi
>> I'm trying to setup a transparent proxy so I've got a linux device
>> with two NICs which are bridged using brctl. Traffic flows happily
>> across the bridge so I know it is working fine.
>>
>> Now when I try to setup the iptables rules they are being ignored. The
>> rule I want to use is:
>>
>> iptables -t nat -A PREROUTING -i br-lan -p tcp --dport 80 -j REDIRECT
>> --to-port 3128
>>
>> but nothing gets redirected. I've also tried changing 3128 to a port
>> that is closed to see what would happen, nothing, the packets kept
>> flowing.
>
> Various people have suggested using ebtables rather than iptables
> because I want to act on traffic over the bridge rather than between
> interfaces. If this is correct, how would I rewrite the above rule in
> ebtables speak?

I'm back to playing with this and I've now tried ebtables (which I
hope is covered by this list) and I'm still not managing to trap
traffic. The bridge is as follows

# brctl show
bridge name     bridge id               STP enabled     interfaces
br-lan          8000.001884d0a060       no              eth0.0
                                                        eth0.1

And the two rules I've tried are

# ebtables -L
Bridge table: filter

Bridge chain: INPUT, entries: 1, policy: ACCEPT
-p IPv4 --ip-dst 192.168.0.8 -j DROP

Bridge chain: FORWARD, entries: 1, policy: ACCEPT
-p IPv4 --ip-proto tcp --ip-dport 80 -j DROP

Bridge chain: OUTPUT, entries: 0, policy: ACCEPT

The first I think should intercept all ipv4 traffic going to
192.168.0.8 and drop it, it doesn't.

The second should drop all ipv4 tcp traffic on port 80. Again, this
doesn't work.

Any suggestions as to what could be happening?

Robin
