From: "giovanni costagliola" <giovanni.costagliola@nexusat.it>
Subject: R: POSTROUTING
Date: Wed, 18 Feb 2004 19:14:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BFEIJHPOPCCMOPEKHHMOAEEHCOAA.giovanni.costagliola@nexusat.it>
References: <4033A9DE.4030009@divx.team.lv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4033A9DE.4030009@divx.team.lv>
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
To: capsx@divx.team.lv, Netfilter <netfilter@lists.netfilter.org>

??

try to explain what you mean.

*g

*g> -----Messaggio originale-----
*g> Da: netfilter-admin@lists.netfilter.org
*g> [mailto:netfilter-admin@lists.netfilter.org]Per conto di capsx
*g> Inviato: mercoledi 18 febbraio 2004 19.07
*g> A: Netfilter
*g> Oggetto: Re: POSTROUTING
*g> 
*g> 
*g> 
*g> iptables -N LOCAL_NET <- new chain
*g> iptables -A INPUT -i eth1 -s 10.0.0.9 -j LOCAL_NET <- add adress to 
*g> chain LOCAL_NET
*g> 
*g> is there something wrong ?
*g> 
*g> 
*g> -[capsx]-
*g> 
*g> 
*g> Alexis wrote:
*g> > But, this is not right, LOCAL_NET is not a target, you need at least to
*g> > create a new chain called LOCAL_NET to use it as a target.
*g> > 
*g> > Im not shure if you can use a chain as a match.
*g> > 
*g> > 
*g> > 
*g> > On Wed, 2004-02-18 at 12:08, capsx wrote:
*g> > 
*g> >>Hello!
*g> >>
*g> >>Is it possible in POSTROUTING as source to specify a chain:
*g> >>
*g> >>f.e.
*g> >>
*g> >>iptables -N LOCAL_NET
*g> >>iptables -A INPUT -i eth1 -s 10.0.0.9 -j LOCAL_NET
*g> >>
*g> >>iptables -t nat -A POSTROUTING -o eth0 -s LOCAL_NET -j SNAT --to ip.ad.re.ss
*g> 
*g> 

