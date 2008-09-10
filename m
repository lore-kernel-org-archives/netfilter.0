From: Brian Ghidinelli <brian@vfive.com>
Subject: Re: What's required for a stateful firewall + ipvs in 2.6 kernel?
Date: Wed, 10 Sep 2008 10:00:06 -0700
Message-ID: <48C7FD16.301@vfive.com>
References: <48C70B10.3040405@vfive.com> <48C7E4C2.9050500@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48C7E4C2.9050500@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>


Grant Taylor wrote:
>> 1. Stateful iptables firewall
>> 2. LVS director (keepalived)
>> 3. DNAT, SNAT and fwmarks
>> 4. Connection synchronization for failover
> 
 > ...
> synchronized / failed over (4) between multiple boxen.  This does not 
> mean that it can not be done, just that it is not going to be documented 
> in the usual locations if it is possible.

That's the issue... there are a lot of posts about LVS and netfilter on 
Austintek.com and other sites but the dates range from 2000 to 2006 or 
so making it hard to figure out what's current.

In sysadmining, I don't really like to be the pioneer. :)  No one else 
has turned an RHEL box into a Firewall + LVS Director?


> It is my (mis)understanding that keepalived does not do the 
> synchronization, rather just the monitoring of things.  Conntrackd will 
> do the synchronization for NetFilter.

I believe keepalived synchronizes the LVS connections between ipvs on 
the two boxes.  There is a config option "lvs_sync_daemon_inteface" for 
this (as I understand it).

This is only half the picture though, and conntrackd appears to solve 
the other half by also keeping netfilter in sync about which connections 
are already established or related so iptables rules don't kill valid 
sessions.

So in the end I suppose the real question is whether or not anyone has 
successfully used the Antefacto patches on RHEL?  I will try the 
lvs-users mailing list for that one...

Thanks for the help Grant,


Brian
