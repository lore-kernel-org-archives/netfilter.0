From: Bob Miller <bob@computerisms.ca>
Subject: Re: iptaccount/shaping
Date: Thu, 01 Sep 2011 12:47:56 -0700
Message-ID: <1314906476.28901.608.camel@worklian.computerisms.bob>
References: <1314894806.28901.574.camel@worklian.computerisms.bob>
	 <20110901201918.390de5b4@catus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110901201918.390de5b4@catus>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: netfilter@vger.kernel.org

On Thu, 2011-09-01 at 20:19 +0200, Marek Kierdelewicz wrote:
> >Hello,
> 
> Hi,

Marek, thank you *very* much for your response.

> 
> >I have a firewall that provides internet to two networks, a private one
> >...
> >My question is: is it somehow possible I am leaking data on my outside
> >port that would trigger the ISP counter but not iptaccount?  Is there
> >some layer 2 traffic of which I am not aware that would tell the ISP
> >what the intended traffic before shaping might be?  I have been dumping
> >and analyzing traffic for hours and found nothing, but maybe there is
> >something I don't know about that would explain this.
> 
> First of all try to compare isp data with what you see on ethernet
> interface connected to that isp:
> ip link show -s dev ethX
> 
> You should get something like this:
> 
>     RX: bytes  packets  errors  dropped overrun mcast   
>     714301652  713443   0       0       0       3494   
>     TX: bytes  packets  errors  dropped carrier collsns 
>     79328329   501677   0       0       2       0
> 
> Stats show actual data sent/received (since reboot) including layer2
> headers. Gathered data should exacly match your isp stats.
> 
I think this is exactly the kind of tool I am looking for.  
When I ran the command I found my numbers didn't add up to even close to
what bandwidth usage should have been since last reboot, and a bit of
investigation says that is because the byte count will wrap.  This will
require some creativity to use this tool properly, but should provide at
least some of the answers I seek.  
Thank you again :)

   
-- 
Bob Miller
334-7117/660-5315
http://computerisms.ca
bob@computerisms.ca
Network, Internet, Server,
and Open Source Solutions

