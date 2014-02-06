From: Alex Bligh <alex@alex.org.uk>
Subject: Re: iptables: Distinguishing packets from bridge-nf-call-iptables
Date: Thu, 6 Feb 2014 00:58:32 +0000
Message-ID: <7A426D4F-5833-467D-9DBE-CF137450DEB2@alex.org.uk>
References: <BC2A25BE-4E4F-4270-855A-E0D092F4A7C0@alex.org.uk> <52F2264C.2060500@chello.at>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <52F2264C.2060500@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mart.frauenlob@chello.at
Cc: Alex Bligh <alex@alex.org.uk>, netfilter list <netfilter@vger.kernel.org>


On 5 Feb 2014, at 11:53, Mart Frauenlob wrote:

> On 05.02.2014 12:24, Alex Bligh wrote:
>> I am trying to run two pieces of software X and Y on a linux box.
>> 
>> X assumes /proc/sys/net/bridge/bridge-nf-call-iptables is set to 1. I am not able to modify this.
>> 
>> Y assumes /proc/sys/net/bridge/bridge-nf-call-iptables is set to 0. This is my software and I can modify it.
>> 
>> I want to adapt my rules for Y so that it copes with /proc/sys/net/bridge/bridge-nf-call-iptables=1 by ignoring (in the iptables rule) any traffic which is purely bridged, and simply doing the ebtables rules on these packets.
>> 
>> In the iptables rules, how do I differentiate ip forwarded traffic from bridged traffic? The bridge interfaces may or may not carry IP addresses.
>> 
> 
> -m physdev ... ?

Ah "-m physdev --physdev-is-bridged" - thanks

If I want to return to ebtables checking etc. (i.e. do nothing) I take it -j ACCEPT
will do this (i.e. ACCEPT does not mean 'override ebtables rejection')?

-- 
Alex Bligh




