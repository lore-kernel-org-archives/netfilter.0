From: Rainer Arnst <Rainer.Arnst@ee-consultants.de>
Subject: Re: IPSec Transport Mode
Date: Fri, 09 Jul 2004 17:38:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1089387536.4237.20.camel@PCA-ARNSTR.ee-consultants.de>
References: <1089207305.788.14.camel@PCA-ARNSTR.ee-consultants.de>
	 <200407071453.49223.Antony@Soft-Solutions.co.uk>
	 <1089210110.788.27.camel@PCA-ARNSTR.ee-consultants.de>
	 <200407072154.52923.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407072154.52923.Antony@Soft-Solutions.co.uk>
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
To: NetFilter Mailling List <netfilter@lists.netfilter.org>

Hi everybody...

On Wed, 2004-07-07 at 22:54, Antony Stone wrote:
> And, to answer your question about how to avoid NATting certain types of 
> packets, the answer is to put an ACCEPT rule in your PREROUTING or 
> POSTROUTING chain, before the SNAT or DNAT rule which would otherwise nat 
> them.
> 
> For example:
> 
> iptables -A PREROUTING -t nat -p 50 -j ACCEPT
> iptables -A PREROUTING -t nat -d a.b.c.d -j DNAT --to w.x.y.z
> 
> These rules will DNAT all packets originally addressed to a.b.c.d and send 
> them to w.x.y.z instead, *unless* they are protocol 50, in which case they 
> won't get NATted.

I tried to work with that, but failed to produce the desired results,
which were to enable IPSec transport mode packets to pass through the
firewall not being NATed. I put these rules at the beginning of the
PREROUTING Chain:

iptables -A PREROUTING -t nat -p 50 -j ACCEPT
iptables -A PREROUTING -t nat -p 51 -j ACCEPT

Got anyone any ideas? What should the ips and routing tables look like?

Thanks and sorry for asking a possibly silly question... I am quite new
to this matter!

Regards,
Rainer


