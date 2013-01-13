From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: How to use TROXY target only for specific outgoing interface
Date: Mon, 14 Jan 2013 00:33:08 +0200
Message-ID: <50F33624.3010208@ngtech.co.il>
References: <1358067281.1669.27.camel@localhost.localdomain>  <alpine.LNX.2.01.1301131229450.31714@nerf07.vanv.qr> <1358095169.1668.9.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1358095169.1668.9.camel@localhost.localdomain>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Sebastian Poehn <sebastian.poehn@googlemail.com>
Cc: Jan Engelhardt <jengelh@inai.de>, netfilter@vger.kernel.org

If you would give an ip example rather then a sketch I think I have an 
idea on how to do it using some local routing daemon on the router machine.

Another thing to notice is that if you are using tproxy it should be 
used based on a known network data or globally with specific exceptions.
else then these situation you will need to plan some iptables structure 
to fit maybe ipset or any other way of organizing the dynamic tproxy rules.

Eliezer

On 1/13/2013 6:39 PM, Sebastian Poehn wrote:
> For a simple setup this is more than sufficient. But I want to realize
> something with dynamic routing. So to clarify:
>
>          ospf            lan1 ############
> local3 <----> local1 <-------#  ROUTER  # wan
>                               #    +     #-------------> internet
>                local2 <-------#  TPROXY  #
>                          lan2 ############
>
> For me it's not possible to even know every subnet which is on the local
> side. It would even be possible that there is a multi-homed environment
> with e.g. local3 connected to the internet, too. (Thank means that even
> a non-local destination could go from local2, via lan2, lan1, local1 and
> local3 to the "internet" ).
>
> Thank for your reply Jan
