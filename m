From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: Multiple Internal Networks
Date: Thu, 26 May 2011 16:14:04 +1200
Message-ID: <d3ba0062463314b5d587ca6190ff05ae@treenet.co.nz>
References: <BANLkTik71rCYn0hQ1CavBmDGo_1NtZX0aA@mail.gmail.com>
 <alpine.LNX.2.01.1105260027130.20213@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1105260027130.20213@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Aaron Clausen <mightymartianca@gmail.com>, netfilter@vger.kernel.org

 On Thu, 26 May 2011 00:28:27 +0200 (CEST), Jan Engelhardt wrote:
> On Thursday 2011-05-26 00:01, Aaron Clausen wrote:
>
>>I just can't wrap my head around this one.
>>
>>What I have is a router with three interfaces:
>>
>>eth0 - External interface (IP address retrieved DHCP)
>>eth1 - Internal interface (trusted) - can access Internet and 
>> anything
>>on eth2 network
>>eth2 - Internal interface (untrusted) - can only access Internet
>>
>>What the heck is the iptables commands to get this to work?
>
> This does not look like an iptables issue.


 I thought that would be:

  # allow eth2 to respond to eth1 connections
  iptables -t filter -A FORWARD -i eth2 -o eth1 -m state --state 
 ESTABLISHED,RELATED -j ACCEPT

  # block others from eth2 to eth1
  iptables -t filter -A FORWARD -i eth2 -o eth1 -j REJECT


 On top of whatever route entries are needed for the subnets to link up.

 AYJ
