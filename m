From: Optimum Wireless Services <wilson@optimumwireless.com>
Subject: Re: My ongoing problem
Date: Thu, 10 Mar 2011 08:50:45 -0400
Message-ID: <1299761445.3623.4.camel@debian-laptop.OptimumWireless>
References: <1299684268.4757.6.camel@debian-laptop.OptimumWireless>
Reply-To: wilson@optimumwireless.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1299684268.4757.6.camel@debian-laptop.OptimumWireless>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Wed, 2011-03-09 at 11:24 -0400, Optimum Wireless Services wrote:
> Hi guys.
> 
> Today I noticed something that might be the answer to why my internet
> connection tends to get slow from time to time.
> 
> tcviewer shows:
> 
>  2:1251               <  512000bit -  614000bit >    576.8 kbit/s
> ( 49pps)
>  2:1067               <  512000bit -  614000bit >    430.5 kbit/s
> ( 39pps)
>  2:1013               <  512000bit -  614000bit >    155.5 kbit/s
> ( 21pps)
>  2:961                <  512000bit -  512000bit >     38.2 kbit/s
> ( 42pps)
>  2:1101               <  512000bit -  614000bit >     34.9 kbit/s  (
> 7pps)
>  2:1155               <  512000bit -  614000bit >      6.2 kbit/s  (
> 1pps)
>  2:1345               <  512000bit -  614000bit >      4.5 kbit/s  (
> 4pps)
>  2:1211               <  512000bit -  614000bit >      3.0 kbit/s  (
> 1pps)
>  2:1003               <  512000bit -  614000bit >      2.2 kbit/s  (
> 1pps)
> 
> 
> which means not many users are really online.
> 
> iptraf shows that my WAN interface is almost maxed to 14580kbits/sec and
> my internal iface traffic is only at 1673kbits/sec which tells me that:
> 
> 1. traffic passing through squid (checked the access.log) and is showing
> traffic to the user with 2:1251 class:
> 
> 172.16.100.139   
>  http://s9.videobb.com/s2?v=t8sVz3gItZpm&r=1&t=1299677838&u=& ....   44
> Mb 1h 24m 56s 
>  http://s56.videobb.com/s2?v=obSt3vOWf0cd&r=1&t=1299677906&u= ....   71
> Mb 1h 23m 57s 
>  http://s68.videobb.com/s2?v=LMiY4UGsGhMy&r=1&t=1299677969&u= ....   30
> Mb 1h 22m 24s 
> 
> 2. Since, I'm shapping or throlling the user's speed to 512kbits then
> all traffic coming in is hogging my line.
> 
> I thought that when an established connection was being throttle that my
> gateway will be the "manager" for this connection and as a result it
> would control the speed at what the server is serving the file to the
> user in my lan.
> 
> This is an user or two that's hogging my line imagine when 30 or more
> are connected simultanously.
> 
> I'm thinking of installing a mikrotik to balance our 3 5mbps lines and
> throtle connections like that to 100kbits... 
> 
> What can I really do to fix this? 
> 
> Thanks in advanced for your time and help.


It looks like the problem have something to do with squid configuration.
What I think is hapenning is that when a user requests a big file squid
tries to dowload it as fast as possible using all the bandwidth
available causing this the hogging on the line. I had the
max_object_size to 512MB I changed it to 64MB to check if that might
ease the problem but, I don't see any changes. What config option should
I change to prevent squid to download the file as fast as is doing now?

Or 

Could it be something else?

Thanks.

