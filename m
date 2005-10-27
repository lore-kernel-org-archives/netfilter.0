From: "Seferovic Edvin" <edvin.seferovic@kolp.at>
Subject: RE: Forward internal packets as though they're external
Date: Fri, 28 Oct 2005 01:55:42 +0200
Message-ID: <14619.4740817466$1130518574@news.gmane.org>
References: <436167A2.2030301@jonheese.com>
Reply-To: edvin.seferovic@kolp.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <436167A2.2030301@jonheese.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

You welcome :P 

But please tell us why do you actually want BT in your LAN? Any good
reasons, or just for fun?

Regards,

Edvin

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Jon Heese
Sent: Freitag, 28. Oktober 2005 01:50
To: netfilter@lists.netfilter.org
Subject: Re: Forward internal packets as though they're external

Ah, I was so caught up in iptables, I wasn't even thinking about 
routing.  Just tried adding a route on Castor to Webster through Router, 
and it works.  Thanks for all the help, Rob and Edvin.

Regards,
Jon Heese

Seferovic Edvin wrote:
> Why don't you tell Castor all packages to Webster over the router? Adding
an
> extra route shouldn't be a problem, and the connection tracking would work
> in this way... this way you will need an SNAT over the router to
Webster...
> 
> Regards,
> 
> Edvin
> 
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Jon Heese
> Sent: Freitag, 28. Oktober 2005 01:32
> To: netfilter@lists.netfilter.org
> Subject: Re: Forward internal packets as though they're external
> 
> Okay, so I assume you're saying I should try:
> 
> iptables -vt nat -A POSTROUTING -p tcp --dport 6969 -s 192.168.0.0/24 \
>      -d 192.168.0.100 -j SNAT --to 65.9.134.4
> 
> Tried that and got no errors running the firewall/nat script, but still 
> no go connecting to 65.9.134.4:6969 from 192.168.0.101.
> 
> I thought about the scenario, and I think I see why it's not working:
> 
> A SYN packet from Webster addressed to 65.9.134.4:6969 goes to the 
> router, and the router sends it to Castor because of its DNAT chain. 
> Castor gets this packet with a source address of Webster 
> (192.168.0.101), and sends back an ACK directly to Webster across the 
> local segment, so the packet never has to even cross the router, and 
> therefore the SNAT rule I added above is never met.  Webster sees the 
> ACK from Castor and throws it away, since it never knowingly tried to 
> connect to Castor.
> 
> So, it seems there is no simple way to do what I want to do here with 
> iptables.  I suppose I'll have to figure out a clever DNS scheme to take 
> care of this.
> 
> If anyone has any ideas, no matter how complicated, I'd certainly be 
> interested in hearing them.
> 
> Regards,
> Jon Heese
> 
> /dev/rob0 wrote:
> 
>>On Thursday 2005-October-27 09:38, I wrote:
>>
>>
>>>Perhaps you need a SNAT rule in POSTROUTING:
>>
>>
>>That's probably correct.
>>
>>
>>
>>>iptables -vt nat -A PREROUTING -p tcp --dport 6969 -s 192.168.0.0/24
>>>\ -d 192.168.0.100 -j SNAT --to 65.9.134.4
>>
>>
>>The example, obviously, is not correct. Copy/paste/PEBKAC error.
> 
> 
> 



