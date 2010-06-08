From: Thanasis <thanasis@asyr.hopto.org>
Subject: Re: Strange problem with HTTPS POST (maybe) through router from Linux
Date: Wed, 09 Jun 2010 00:46:33 +0300
Message-ID: <4C0EBA39.5070809@asyr.hopto.org>
References: <201006082203.22238.tvrtko@ursulin.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201006082203.22238.tvrtko@ursulin.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tvrtko Ursulin <tvrtko@ursulin.net>
Cc: netfilter@vger.kernel.org

on 06/09/2010 12:03 AM Tvrtko Ursulin wrote the following:
>
> Hi all,
>
> Not really sure it is appropriate for this mailing list but I have a hunch it 
> could be netfilter related, or at least people who could know something about 
> it are likely to visit this place. :)
>
> I have a small home network behind a cheap ADSL router and a bizarre problem 
> where I am not getting responses from some web sites in some situations. I 
> suspect it is when a POST needs to go over the connection because it is always 
> when I need to log in somewhere over HTTPS. Also it happens when a number of 
> unrelated sites.
>
> This only happens from Linux! Just today I tried four different distributions 
> on two different machines and it is a total pattern. From Windows it all works 
> fine. Also I tried three or four browsers on Linux and all behave exactly the 
> same.
>
> I had a look at the iptables setup on the router (see below) and it looks 
> reasonable (at least short) to me, but it have been some years since I last 
> used it so my knowledge is a bit thin here.
>
> Or could it be that something has changed in recent kernels which could make 
> the router unhappy and lose packets?
>
> Anything more I could try to diagnose this? Any hints are appreciated!
>
> Regards,
>
> Tvrtko
This usually happens when the firewall(s) does not allow path MTU
discovery because it is configured to filter/drop ICMP.
Take a look here:
http://www.znep.com/~marcs/mtu/
http://www.netheaven.com/pmtu.html
Try setting the MTU to a small value like:
ifconfig eth0 mtu 1000
and if that solves the problem, then fix your firewall(s)
