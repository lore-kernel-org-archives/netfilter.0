From: Joel Newkirk <firewalldude@newkirk.us>
Subject: Re: DNATing packets sent to the NATing box
Date: Sat, 13 Dec 2003 23:55:34 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071377734.2091.928.camel@alpha.newkirk.us>
References: <20031214005212.GA8217@tinuviel.compendium.com.ar>
Reply-To: firewalldude@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031214005212.GA8217@tinuviel.compendium.com.ar>
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
To: horape@tinuviel.compendium.com.ar
Cc: netfilter@lists.netfilter.org

On Sat, 2003-12-13 at 19:52, horape@tinuviel.compendium.com.ar wrote:
> I've a system that at its core has an UDP proxy that's the performance
> bottleneck. I wanted to use the DNAT kernel facilities to replace my
> code with the very tuned one on netfilter.
> 
> I'm adding a rule that says something like this:
> 
> /sbin/iptables -t nat -A PREROUTING -d myip -p udp -m udp --dport 5000 -j DNAT
> 		--to-destination otherip:18918

Try:

/sbin/iptables -t nat -A PREROUTING -d myip -p udp --dport 5000 -j DNAT
--to otherip:18918

And ensure you are letting traffic for -d otherip -p udp --dport 18918
through FORWARD chain.

> but the rule never see the packets (they never got to the chain)
> 
> I assume that it's because I've a socket listening on udp:5000, and it seems

Nope.

> reasonable what's happening... I'd like to add a PREPREROUTING chain that
> is processed before deciding if the packet is for a local socket, can somebody
> give me a hint on where to look for it?

If it's for local, it can be seen in Mangle Prerouting, then Nat
Prerouting, then Mangle Input, then Filter Input.

> Saludos,
> 					HoraPe
> ---
> Horacio J. Pea
> horape@compendium.com.ar
horape@uninet.edu

j



