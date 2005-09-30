From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: iptables spof address problem
Date: Fri, 30 Sep 2005 14:14:04 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0509301406070.19019@filer.marasystems.com>
References: <E656E2CC1C5AEB42ACB00EB83122C7742E2EC6@farmer.vikus.com>
	<433C2F1F.9070003@neostrada.pl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <433C2F1F.9070003@neostrada.pl>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Piotr Holubniak <piotr.holubniak@neostrada.pl>
Cc: netfilter@lists.netfilter.org, Derick Anderson <danderson@vikus.com>

On Thu, 29 Sep 2005, Piotr Holubniak wrote:

> In described by me scenario, attacker doesn't need to spoof MAC address to be 
> unvisible, it is enaught to spoof IP. So funcjonality of "security port" is 
> very limited. I belive that netfilter should allways display real MAC 
> address. I don't know how to changet it.

iptables sees the MAC address as it was received by the Linux box.

A hacker spoofing is not invisible in a "security port" enabled network. 
He can always be traced to his exact port from the sending MAC address as 
the switch prevents him from sending packets with another source MAC.

However, if the packet travels via a router before it reaches the firewall 
then the original MAC addressing is implicitly lost by the routing (this 
is a fact, nothing to be done about), and in such case tracing of the 
actual user becomes a little harder at the firewall. But it can still be 
traced to the originating switch port by looking at the packet in (or 
before) the router.

>> It's like printing out two copies of the same paper on two different
>> copiers. Which one came from which copier? You can't tell. In fact it
>> would probably be easier to figure that out as opposed to MAC spoofing.

Bad example. Paper copiers are not exact and it is possible to determine 
which copy was made on which copier by analyzing the errors in the copy.

Regards
Henrik

