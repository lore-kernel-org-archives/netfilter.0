From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: --limit 5/m doesn't work
Date: Wed, 23 Mar 2005 12:36:19 -0600
Message-ID: <4241B723.9050204@riverviewtech.net>
References: <000001c52f53$ed3f3220$1500a8c0@itasam>
Reply-To: gtaylor@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <000001c52f53$ed3f3220$1500a8c0@itasam>
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
To: netfilter@lists.netfilter.org

(I'll try replying to the mail list so others can see this too.)

Andy, something to keep in is that the limit that is in place is an average of 5 packets in 60 seconds, thus a packet could be matched every 12 seconds.  Something else to keep in mind is that this rule will only match based on the criteria you give it, thus if you don't have your default policy set to DROP or an explicit rule to drop the packets they will always accept by default.  According to the man page limit will support inverse matches but I can not get it to work so give it a try as follows:

iptables -A INPUT -i eth0 -m limit ! --limit 5/m --limit-burst 5 -j DROP

If that does not work you will need to do something like this:

iptables -A INPUT -i eth0 -m limit --limit 5/m --limit-burst 5 -j ACCEPT
iptables -A INPUT -i eth0 -j DROP

Alternatively you could make a new chain and do something like this.

iptables -N NewChain
iptables -A INPUT -i eth0 -j NewChain
iptables -A NewChain -i eth0 -m limit --limit 5/m --limit-burst 5 -j RETURN
# Put any additional match limits you want here that you want to use the default below on.
iptables -A NewChain -j DROP

In this scenario you could have other limits that you wanted to apply between the 3rd and 4th line.  You pass (all) traffic to the NewChain cain of rules and any thing that is acceptable will be returned back to the INPUT chain and continue processing from there.  You will then have a default action of DROP in the NewCahin if they packets are not explicitly RETURNed.



Grant. . . . 

Andy Samuel wrote:

> Dear All
> 
> I have this rule :
> iptables -A INPUT -i eth0 -m limit --limit 5/m --limit-burst 5 -j ACCEPT
> 
> When I tried to ping my Linux box from a Windows box, :
> ping -t 192.168.12.1 
> 
> The reply always come within less than 1 ms.
> I'm actually expecting many timeouts because iptables would drop my
> package, but the reply always come within less than 1 ms and no timeouts
> at all.
> Am I expecting something wrong ?
> 
> Thank you all in advance.
> Andy


