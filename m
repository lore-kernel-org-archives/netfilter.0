From: Joe Pruett <joey@clean.q7.com>
Subject: Re: iptables, ipsec, and host2host
Date: Fri, 30 Jan 2009 13:50:48 -0800 (PST)
Message-ID: <alpine.LRH.2.00.0901301342230.1946@q7.q7.com>
References: <alpine.LRH.2.00.0901281117320.7781@q7.q7.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.00.0901281117320.7781@q7.q7.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Wed, 28 Jan 2009, Joe Pruett wrote:

> i have been scouring the net and i can't find any clues to whether i can do 
> filtering after ipsec has decrypted a packet on a host2host connection. 
> net2net goes through the filters a second time, but host2host doesn't seem to 
> do that.  is there some other method i can use to filter the traffic after 
> being decrypted?

ok, i'm following up to myself.  i dug into the kernel source (for 
redhat/centos 5) and have found that there don't appear to be any hooks in 
the ah4.c or esp4.c code to pass packets back through netfilter after 
decapsution/decryption.  from what i can tell tunnel mode (net2net) gets 
the double pass through netfilter only because of the use of the ip-ip 
protocol and ipip.c does a netif_rx call after decapsulation.

so maybe i should go dig into the current (from linus) kernel sources to 
see if there have been any changes.  but i'm hoping that someone here 
might know if there is a reason that ah/esp packets aren't passed through 
netfilter again after being decapsulated/decrypted?  or should i go find 
the ipsec mailing list?

my underlying goal is for a monitoring system that i want to be able to 
see into customer sites via ipsec, but i don't want them to be able to 
come back over the ipsec connection to my system.  i could setup tunnels 
to each site, but host2host is really more what i want.
