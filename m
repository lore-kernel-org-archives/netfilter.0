From: Patrick McHardy <kaber@trash.net>
Subject: Re: iptables MARK + ip rule fwmark on locally generated packets
Date: Fri, 22 Jan 2010 11:53:45 +0100
Message-ID: <4B5983B9.2010106@trash.net>
References: <20100122100755.GB23731@ioi.dk> <4B597967.3060603@trash.net> <20100122103118.GG23731@ioi.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100122103118.GG23731@ioi.dk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fredrik Ax <frax@axnet.nu>
Cc: netfilter@vger.kernel.org

Fredrik Ax wrote:
> On Fri, Jan 22, 2010 at 11:09:43AM +0100, Patrick McHardy wrote:
> 
>> Fredrik Ax wrote:
>>> Hi guys,
>>>
>>> I'm a pretty experienced Linux / network developer and administrator,
>>> but I can't get my head around this one.
>>>
>>> The long story is that I have a box used as router/fw/proxy running
>>> Debian Squeeze with a customized 2.6.32 x86_64 kernel having three
>>> interfaces (eth2,eth3,eth4) on the same external subnet. One of the
>>> interfaces is used for doing masquerading of other
>>> subnets. Masquerading (not snat) is chosen because the interfaces are
>>> on dhcp, and I don't want to have to rewrite the fw rules each time I
>>> get a new addr ... already have enough with dhclient-hooks for fixing
>>> the routing tables dns-updates, etc ;-) What I basically want to do is
>>> make the proxy's request to go out the same ifc as the masqueraded
>>> packets getting a src addr of s41.s42.s43.s44. Other locally generated
>>> packets should get a src addr s21.s22.s23.s24.
>>>
>>> To accomplish this I'm using iptables to mark all, to port 80, locally
>>> generated tcp packets:
>>>
>>> % iptables -t mangle -vnL OUTPUT
>>> Chain OUTPUT (policy ACCEPT 3234 packets, 2254K bytes)
>>>  pkts bytes target     prot opt in     out     source               destination         
>>>  1114  181K MARK       tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           tcp dpt:80 MARK set 0x4 
>>>
>>> I have verified that the iptables rule marks them fine enough.
>>>
>>> Then the ip rule with prio 99 below should then catch them and route
>>> according to table eth4 below. That rule however does, for some reason
>>> not match those packets, instead they are routed according to table
>>> eth2 below (prio 200 rule), getting src addr s21.s22.s23.s24.  If I
>>> disable that rule they are routed according the the prio 300 rule
>>> (getting src addr s31.s32.s33.s34).
>>>
>>> ...
>>>
>>>
>>> What am I doing wrong here?
>> Source address selection happens before the packet is even generated,
>> so iptables marking in OUTPUT can't affect it.
> 
> So, to accomplish this I would have to oute it through a dummy
> interface to make iptables able to mark it before it goes out?

You need some criteria for your routing rules that is available
when the socket is routed. That's everything but the packet mark.
Using a seperate device will work.

For ethernet, the macvlan device might be a good choice if you
don't mind using different MAC addresses for each IP.
