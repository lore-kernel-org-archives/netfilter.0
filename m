From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Logging Aliased Interfaces.
Date: Sun, 20 Oct 2002 23:07:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021020220703.MATH17202.mta01-svc.ntlworld.com@there>
References: <000001c27880$d9ee8630$05290a0a@vaio>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c27880$d9ee8630$05290a0a@vaio>
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
To: netfilter@lists.netfilter.org

On Sunday 20 October 2002 10:37 pm, Andy Wood wrote:

> I am running a firewall with multiple IPs aliased to the external
> interface.  Each IP is forwarded to a virtual web in the DMZ.
>
> 	My problem is that it appears, unless I'm doing something wrong,
> if the destination address is one of the aliased IPs I can only log and
> assign rules in PREROUTING.  I have complex logging setup in some custom
> chains, but cannot jump to them from PREROUTING nor assign rules to them
> in any other chain.
>
> iptables -A INPUT -p tcp --dport 111 -d 80.80.80.155 -i eth0 \
> 			-j LOG --log-prefix "SUN RPC: "
> 	This will LOG (if it was -j <USER CHAIN> it would jump)
>
> iptables -A INPUT -p tcp --dport 111 -d 80.80.80.157 -i eth0 \
> 			-j LOG --log-prefix "SUN RPC: "
> 	This will not log (if it was -j <USER CHAIN> it would not jump)
>
> iptables -A PREROUTING -p tcp --dport 111 -d 80.80.80.157 -i eth0 \
> 			-j LOG --log-prefix "SUN RPC: "
> 	This will LOG (it cannot be -j <USER CHAIN>...only LOG, DNAT and
> DROP I think)

If you are able to log packets in the PREROUTING chain but not the INPUT 
chain then it implies that they are not being recognised as local packets, 
and are therefore going to the FORWARD chain instead.

Question: do the packets addressed to 80.80.80.157 seem to be getting 
processed by this box okay, suggesting that they have traversed the INPUT 
chain ?

Suggestion: try putting a LOGging rule in the FORWARD chain to see if that's 
where they're going instead.

Observation: you said at the top of your email:

> I am running a firewall with multiple IPs aliased to the external
> interface.  Each IP is forwarded to a virtual web in the DMZ.

What are your 'forwarding' (presumably DNAT) rules - they must be in the 
PREROUTING chain - are they causing the dest addr to be changed so the 
packets no longer go to the local machine ?

If you still have problems, post your entire ruleset (ideally the simplest 
subset which demonstrates the problem) so we can see everything that's going 
on.   Please post the commands which set up the rules, not the output of 
iptables -L etc.

Antony.
 

PS: The sig below is randomly generated, and therefore entirely fortuitous on 
this occasion :-)

-- 

90% of network problems are routing problems.
9 of the remaining 10% are routing problems in the other direction.
The remaining 1% might be something else, but check the routing anyway.

