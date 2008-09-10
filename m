From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: What's required for a stateful firewall + ipvs in 2.6 kernel?
Date: Wed, 10 Sep 2008 10:16:18 -0500
Message-ID: <48C7E4C2.9050500@riverviewtech.net>
References: <48C70B10.3040405@vfive.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48C70B10.3040405@vfive.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 09/09/08 18:47, Brian Ghidinelli wrote:
> I'm trying to get a handle on whether or not it's possible to set up the 
> following on a redundant pair of boxes:
> 
> 1. Stateful iptables firewall
> 2. LVS director (keepalived)
> 3. DNAT, SNAT and fwmarks
> 4. Connection synchronization for failover

You should easily be able to get SPI (1), NAT (3), and failover (4) 
between multiple systems.  However I'm not sure if you will get LVS (2) 
to play properly in this or not.  Traditionally LVS worked independently 
/ completely out side of IPTables (1 and 3) and thus was not able to be 
synchronized / failed over (4) between multiple boxen.  This does not 
mean that it can not be done, just that it is not going to be documented 
in the usual locations if it is possible.

> * Do the antefacto patches allow netfilter to access connections managed 
> by ipvs and support DNAT, SNAT and fwmarks used in the LVS configuration?

Based on the (below) referenced web page from Julian, yes to some extent 
it does..

> 2. Setup conntrackd - will mirror the connection information 
> synchronized by keepalived at the netfilter level.  Will conntrackd work 
> on RHEL/CentOS 5.2?

It is my (mis)understanding that keepalived does not do the 
synchronization, rather just the monitoring of things.  Conntrackd will 
do the synchronization for NetFilter.

As far as whether or not conntrackd will work on RHEL/CentOS, it should. 
  I don't know of any reason you can't compile it and get it to work. 
You may have to change some underlying libraries if versions are not 
correct (I don't know b/c I run different distro(s)).

> Are libntnetlink or libnetfilter_conntrack required?  I have been 
> reading all day but don't yet follow how all of the pieces go together. 

I don't know.  If you read the documentation with conntrackd you should 
be able to find out if libnetlink / libnetfilter are needed or not.  I 
would not be surprised if you need libnetfilter.



Grant. . . .
