From: Piers Finlayson <pdf@dataconnection.com>
Subject: RE: port forwarding with one interface to trace traffic?
Date: Thu, 22 Jan 2004 15:33:24 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <37701240971DD31193970000F6CCB9F704CB8072@duke.datcon.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Also be warned that many "hubs" on the market are actually switches.  I find
this terribly annoying.

Cheers,
Piers

-----Original Message-----
From: Rasca [mailto:rasca-ml@triad.de]
Sent: 22 January 2004 13:37
To: Jeffrey Laramie
Cc: netfilter@lists.netfilter.org
Subject: Re: port forwarding with one interface to trace traffic?


Hi,

Jeffrey Laramie schrieb:
> 
>>
>> 3. Connect a hub (not a switch) to the printer's ethernet cable (or to 
>> the Mac's ethernet cable), and plug the Linux machine running ethereal 
>> into the hub, so you can sniff the packets off the wire without any NAT.
>>  
>>
> 
> This is dangerously OT, but what's the difference? I always thought that 
> the difference between a switch and a hub was simply a matter of 
> internal plumbing that affected how the pipes were connected and had no 
> effect on the actual tcp/ip connections. I've used them interchangeably 
> and haven't seen a difference. Maybe someone has a link that could 
> educate me more better! :-)

A "hub" broadcasts all packets to all port. And yes - that was
the way I choosed, cause it's more simple to setup (I found an
old hub..) and it's working.

thx to Antony.

cu
  rasca

-- 
_______________________________________________________________
| Triad Berlin Projektgesellschaft mbH | http://www.triad.de/ |


