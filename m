From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Port Scanner
Date: Wed, 5 Nov 2003 14:19:47 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311051419.hA5EJtr13138@agate.rockstone.co.uk>
References: <60101.200.180.170.253.1068041679.squirrel@www.alcidesmaya.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <60101.200.180.170.253.1068041679.squirrel@www.alcidesmaya.com.br>
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
To: Lista de Mail netfilter <netfilter@lists.netfilter.org>

On Wednesday 05 November 2003 2:14 pm, Leandro Takashi Hirano wrote:

> How does this rule work?
>
> iptables -A FORWARD -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit ?limit
> 1/s -j ACCEPT

It means that any packets which have the RST flag set, and the SYN, ACK, FIN 
flags cleared, will only be allowed *through* the firewall at a maximum rate 
of one packet per second.

> Is it safe to use only this rule to avoid port scanners?

Depends what you mean by "safe" and "avoid" :)

Here are some observations on the above rule:

1. It is in the FORWARD chain, therefore it has no effect on people port 
scanning the firewall itself (it would need to be in the INPUT chain to 
affect that).

2. One packet per second will be ACCEPTed.   What happens to the other 
packets (and whether anything gets returned to the scanner) depends on the 
other rules following this one in the chain.

3. The rule only applies to packets with RST set, and SYN, ACK, FIN clear.   
Therefore it will incfluence the outcome of a RST port scan, but have no 
effect on a FIN scan, or a SYN scan.

I think in order to answer your question we first need to know:

 - what response do you want someone to get when they attempt to port scan 
your system?

Regards,

Antony.


-- 

"It is not the strongest of the species that survive, nor the most 
intelligent, but the ones most responsive to change."

 - Charles Darwin
                                                     Please reply to the list;
                                                           please don't CC me.

