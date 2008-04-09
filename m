From: "Eric B." <ebenze@hotmail.com>
Subject: Re: Success routing mark'ed packets - but still confused why it didn't work the first time....
Date: Wed, 9 Apr 2008 16:32:21 -0400
Message-ID: <ftj951$3cv$1@ger.gmane.org>
References: <ftgq9j$mf$1@ger.gmane.org> <alpine.LNX.1.10.0804090612580.2229@fbirervta.pbzchgretzou.qr>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

"Jan Engelhardt" <jengelh@computergmbh.de> wrote in message 
news:alpine.LNX.1.10.0804090612580.2229@fbirervta.pbzchgretzou.qr...
>
> On Wednesday 2008-04-09 00:06, Eric B. wrote:
>>And without any way of "seeing" whether the outgoing packets were marked, 
>>I
>>couldn't tell why they weren't being routed properly (BTW - is there a way
>>to "see" the mark on the packet in the log?)
>
> LOGMARK :p

Ah yes - back to the fun part about having to work on a fixed disto - ie: 
RHEL4. :)


>>My solution was to use the mangle Output table to mark all the outgoing
>>packets with their source being the virtual ip.  Once I did that, success.
>>My outgoing packets are properly redirected out the appropriate gateways.
>
> Make sure you do not set a mark in an input/prerouting
> chain so that it accidentally hits the routing rule
> because that would mean incoming packets are diverted
> before they reach the machine.

But isn't that exactly what you are doing in your NF-Cookbook.txt?  You 
have:
-t mangle -A PREROUTING -j CONNMARK --restore-mark
Isn't that setting the mark in the prerouting table?  Or do you do it that 
way since the local routing table is the first table, and any packets 
destined for this machine will be accepted anyhow?


>>However my question now is the root of my confusion.  If a packet is 
>>mark'ed
>>in the Preroute mangle table, is that mark not supposed to be maintained
>>throughout the life of the packet,
>
> The mark is maintained during the life of the packet (until you change it
> of course).
>
>> including the machine's response to that
>>packet?
>
> Response is a new packet. Only the ctmark (connection mark)
> can "survive" here.

Do the ip rules based on the fwmark work on the individual packet's mark 
value or the conntrack mark, or both?

Thanks for the clarification!

Eric



