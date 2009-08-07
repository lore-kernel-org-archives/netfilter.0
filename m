From: Thomas Jacob <jacob@internet24.de>
Subject: Re: types of NAT with netfilter
Date: Fri, 07 Aug 2009 14:10:01 +0200
Message-ID: <1249647001.29388.25.camel@enterprise.ims-firmen.de>
References: <cfeab66d0908070422i40b6efb9x901d3d839a6fee03@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cfeab66d0908070422i40b6efb9x901d3d839a6fee03@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: netfilter@vger.kernel.org

On Fri, 2009-08-07 at 16:52 +0530, ratheesh k wrote:
> Hi ,
> 
>  I have a linux router with  only one rule
> 
>   iptables -t nat -A POSTROUTING -i eth0 -o eth1 -j MASQUERADE
> 
> 
>  What i understood is (by googling net ) is that  adding this will
> give symmetric nat support to my router , is it true  ???.

Yes

>  1. To have  " full cone nat" support  what should i do ??  Is it same
> as DMZ configuration ??
>
>  2 . restricted nat and port restricted nat cannot be implemented
> using iptables ???

These are all technically inferior to symmetric NAT, and are AFAIK
not provided by netfilter/iptables.

I suggest you describe in detail(!) what you want to achieve to the list
(possibly with ASCII diagrams) and then maybe people can help
you out.


>  3 . i installed windows STUC and tested . Test results show it is a
> portrestricted nat ... But if i make default policy for wan INPUT and
> wan PREROUING as REJECT , test  got failed ??? is it iptables
> dependend ??
> 
> Thanks,
> atheesh


