From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: How to filter packets resulting from hosts with dynamic
	IP-address
Date: Tue, 06 Feb 2007 08:55:35 -0600
Message-ID: <45C896E7.3010105@riverviewtech.net>
References: <200702061042.21497.frank.petran@inpho.de>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200702061042.21497.frank.petran@inpho.de>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

Frank Petran wrote:
> As far as I have understood it, filters can act on IP-addresses but not 
> on hostnames. Since the originating IP-address changes, all I am left 
> with is the known hostname. As far as I have understood it, filters can 
> act on IP-addresses but not on hostnames. I would like to do a hostname 
> lookup based on the name registered at dyndns.org and compare that with 
> the IP-address of the incoming traffic.


You are correct in the fact that IPTables will not use host names during 
normal operations.  This is because the in kernel rules only support IP 
addresses.  The IPTables command will translate names to IPs for you 
when you add the rules to the kernel though.

With this in mind, my best bet is for you to create a sub chain that is 
for each specific client.  Use some sort of port knocking setup that 
will trigger some process on your firewall to re-run that user's portion 
of the IPTables script.  This script would need to flush the user's sub 
chain and repopulate it with current IP addresses.  I know that this is 
sub optimal, but I think it would work.

Another option might be to look at writing some sort of user space 
daemon that you could have IPTables pass the packets to and return a yes 
/ no to the kernel.  However, this would be duplicating some of / a lot 
of the effort that has gone in to IPTables and thus again sub optimal as 
far as development is concerned.



Grant. . . .

