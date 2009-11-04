From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: ipt ROUTE
Date: Wed, 04 Nov 2009 14:56:38 +0100
Message-ID: <4AF18816.201@chello.at>
References: <917815.12910.qm@web24108.mail.ird.yahoo.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <917815.12910.qm@web24108.mail.ird.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

aidan mcgurn wrote:
> Hi,
> (apologies in advance - don't seem to have the option to reply within the same thread so re-sending this)
> thanks for the response.
> I had looked through the archives and did again but i'm fairly new to netfilters iptables and i can't see 
> any other way of routing using dst:port via different gateways besides using the ipt ROUTE lib.
>
> That been the case, can u please directme on how to build the ipt_ROUTE kernel object for this or is it a patch thats required?
> As i said i downloaded 1.3.5 iptables code from netfilter and did a make but it only builds the shared objects, no kernel objects which
> i presume i need to install a ipt_ROUTE.ko to get the -j ROUTE option to work?
> alternatively is there any iptables package which includes this?
>
>   
Hello,

ipt_ROUTE has been removed, some functionality moved to the TEE  target 
from xtables-addons (but that's not what you need).

The way to do it, is to use the MARK target to set marks (--set-mark 
0xX), like i.e:
iptables -t mangle -A PREROUTING -i eth1 -p tcp --dport 22 -j MARK 
--set-mark 0x1

Then use the iproute utility to add routing tables/rules per gateway i.e.

echo X GW1 >> /etc/iproute2/rt_tables
...
ip route add table X <whatever-route>
....
ip rule add from all fwmark 0x1 table X
...

It should not be hard to find valuable examples on the internet. i.e:
http://linux-ip.net/html/adv-multi-internet.html
http://lartc.org/howto/lartc.rpdb.html

Regards

Mart
