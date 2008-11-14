From: John Haxby <john.haxby@oracle.com>
Subject: Re: www.adobe.com
Date: Fri, 14 Nov 2008 09:30:27 +0000
Message-ID: <491D4533.5030501@oracle.com>
References: <20081113075231.50345b2c@gmail.com>	<491BFB25.3000800@plouf.fr.eu.org>	<20081113105205.7496faf5@gmail.com>	<491C0DD8.6080103@plouf.fr.eu.org> <20081113120030.1f039cb6@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20081113120030.1f039cb6@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: TheOldFellow <theoldfellow@gmail.com>
Cc: netfilter@vger.kernel.org

TheOldFellow wrote:
> On Thu, 13 Nov 2008 12:22:00 +0100
> Pascal Hambourg <pascal.mail@plouf.fr.eu.org> wrote:
>
>   
>> The problem may lie in your router, your network interface card or its 
>> driver. Anyway it does not seem to be related to netfilter/iptables, as 
>> tcpdump sees the packet as malformed before it enters the netfilter 
>> code. Can you try with another router, machine, kernel or network 
>> interface ?
>>     
>
> Yes, but it will take time to arrange.  It's very strange that it only
> occurs on that range if IP addresses, which are also very similar to
> the 192.168.0.0/16 private address range.  I wonder if this would
> improve if I changed the address range used on the ADSL router -
> firewall to, say, 172.20.1.0.  If it's software/firmware in the router
> or NIC that might avoid it.
>   

It's perhaps not that strange.   I had a similar problem a little while 
ago -- the networks guy had a set of blacklisted addresses in the router 
that was rather out of date.   He blamed his predecessor :-)

jch
