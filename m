From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: load balance [OT?] [Solution]
Date: Mon, 30 Jun 2008 09:26:24 -0500
Message-ID: <4868ED10.3020506@riverviewtech.net>
References: <1214492735.4427.6885.camel@kr0sty>	 <4866ECB1.2040903@riverviewtech.net> <1214832757.19463.40.camel@kr0sty>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1214832757.19463.40.camel@kr0sty>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 06/30/08 08:32, Martin wrote:
> That's right, the ping part is to keep gateways in the arp table, so 
> arpinging them'd be the same as normal ping for the case. Probably (I 
> didn't tested it) adding MAC and IP with arp should work too.

(See below.)

> May be I'm missing something, but what do you mean with "kernel's 
> DGD"?

DGD or Dead Gateway Detection, is a mechanism built in to the kernel 
that allows the kernel to detect if a gateway / router to a given (set 
of) destination(s) is no longer functioning and subsequently fall back 
to a different gateway.

I have had the following test network in place and experienced failures 
using standard pings in a very weird way.


        +-----+ A.1                       A.2 +-----+
  C.254 |    0+-----(Switch)-----(Switch)-----+0    | D.254
-------+1 A  |                               |  B 1+-------
        |    2+-------------------------------+2    +
        +-----+ B.5                       B.6 +-----+

(Think of this configuration as two separate buildings (C & D) with two 
different connections tying them together, one slow wireless (B) and one 
new Metro Ether (A).  As far as the A and B systems are concerned these 
are just simple ethernet connections.)

I had the above scenario set up between two buildings with the A system 
pinging both of the B systems interfaces (A.2 and B.2).  If I 
disconnected the cable connecting between the two switches both system A 
and B would still have link between them selves and their respective 
switch, however the channel between the two systems would be non functional.

After about 45 - 90 seconds (depending on how tings were configured) the 
kernels on either system would realize that the link between systems A 
and B using the A (Metro Ether) network was down and fall back to 
routing all traffic out over the B (wireless) network.  So when system A 
pinged the A.2 interface on the B system the traffic would go out across 
the wireless network, loop through the B system and hit the A.2 
interface on the B system.

Where as if I used arping to do the testing, the kernel's routing table 
(and thus DGD) was ignored giving an accurate test of the link state 
even if the kernel had routed around the link failure between the switches.

(The above configuration used a stock kernel with two equal routes 
(metric of 0) entered in reverse priority to get things to work.)



Grant. . . .
