From: Filip Sneppe <filip.sneppe@cronos.be>
Subject: Re: NAT IP POOL!
Date: 05 Dec 2002 12:45:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039088743.489.31.camel@xbox>
References: <3DEF3465.4070003@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DEF3465.4070003@libero.it>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Blizzards <blizzards@libero.it>
Cc: netfilter@lists.netfilter.org

On Thu, 2002-12-05 at 12:11, Blizzards wrote:
> Hi list!
> 
> 
> Those are my questions:
> 
> A)I need to SNAT a subnet 192.168.1.0/24 with 172.16.1.0/24.
> I use this tule:
> iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -j SNAT --to 172.16.1.0/24
> This is ok, but when i nat an address, i must create an ip alias on ethn 
> an my nat box for this to work. Ok.
> When i use few address no problem at all, but using a pool of address (a 
> subnet or an interval of ip address), i must create 254 aliases for the 
> interface or there was a better method?
> B)Iptables Nat a pool of address with 1:1 method like cisco nat?
> If yes, when no more address 1:1 are avaiable for connections, can i
> se a PAT address like cisco nat?
> Or iptables works differently balancing the load of ip address used?
> 

Hi,

You probably want to look at the NETMAP target that is in patch-o-matic.
SNAT and DNAT targets will do some loadbalancing. You'll get weird
results with your setup.

With NETMAP you can do source NAT and destination NAT of whole subnets
with a strict 1:1 mapping.

Regards,
Filip


