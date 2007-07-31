From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: two subnets...
Date: Tue, 31 Jul 2007 10:05:43 -0500
Message-ID: <46AF4FC7.1000500@riverviewtech.net>
References: <46ADBDF0.3020200@mp.pl>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46ADBDF0.3020200@mp.pl>
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

On 07/30/07 05:31, Pawel wrote:
> I need to remove 3 machines from one subnet (192.168.0.0/25) to new 
> physical subnet.  I want to add new network card to my linux router 
> and create new subnet (192.168.0.96/29).

Ok...

> My  issuse:  I cannot touch any IPs  of any machine ....

Ah.  Here in lies the rub.

> how to do it?  What is the best solution? (proxy arp, additional 
> routing table?)

Do you really need a new subnet or just a new physical network?  If the 
later is the case, add a new network card to the Linux router and bridge 
that new card with the old card that the computers were on.  Once you 
have the bridge in place, move the IP address that was assigned to the 
old network card to the bridge interface.  This will allow the old 
machines to function as they were as well as the machines that you 
moved.  If you do not want the old machines to be able to talk to the 
ones that you moved, use an EBTables (Bridging) rule to block traffic 
from passing from the old NIC to the new NIC wile still allowing them to 
get to the router the way they need to.

This works *GREAT*!  I have used it a lot of places and have been very 
happy with the results.



Grant. . . .

