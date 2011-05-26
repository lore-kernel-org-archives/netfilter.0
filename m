From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Multiple Internal Networks
Date: Thu, 26 May 2011 09:21:58 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1105260902500.20213@frira.zrqbmnf.qr>
References: <BANLkTik71rCYn0hQ1CavBmDGo_1NtZX0aA@mail.gmail.com> <alpine.LNX.2.01.1105260027130.20213@frira.zrqbmnf.qr> <d3ba0062463314b5d587ca6190ff05ae@treenet.co.nz>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d3ba0062463314b5d587ca6190ff05ae@treenet.co.nz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amos Jeffries <squid3@treenet.co.nz>
Cc: Aaron Clausen <mightymartianca@gmail.com>, netfilter@vger.kernel.org

On Thursday 2011-05-26 06:14, Amos Jeffries wrote:

> On Thu, 26 May 2011 00:28:27 +0200 (CEST), Jan Engelhardt wrote:
>> On Thursday 2011-05-26 00:01, Aaron Clausen wrote:
>>
>>> I just can't wrap my head around this one.
>>>
>>> What I have is a router with three interfaces:
>>>
>>> eth0 - External interface (IP address retrieved DHCP)
>>> eth1 - Internal interface (trusted) - can access Internet and anything
>>> on eth2 network
>>> eth2 - Internal interface (untrusted) - can only access Internet
>>>
>>> What the heck is the iptables commands to get this to work?
>>
>> This does not look like an iptables issue.
>
>
> I thought that would be:
>
> # allow eth2 to respond to eth1 connections
> iptables -t filter -A FORWARD -i eth2 -o eth1 -m state --state
> ESTABLISHED,RELATED -j ACCEPT
>
> # block others from eth2 to eth1
> iptables -t filter -A FORWARD -i eth2 -o eth1 -j REJECT
>
>
> On top of whatever route entries are needed for the subnets to link up.

Knowing is better than thinking :)
What is required depends on the preexisting system state that you have 
at the time you run the commands.
