From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: NAT, MANGLE, and TOS
Date: Thu, 23 Oct 2003 16:47:52 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031023204752.GB15311@cannon.eng.us.uu.net>
References: <7C9884991ADAE0479C14F10C858BCDF5122E7F@alderaan.smgtec.com> <20031023202550.91953.qmail@web40203.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20031023202550.91953.qmail@web40203.mail.yahoo.com>
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
Content-Transfer-Encoding: 7bit
To: SBlaze <dagent.geo@yahoo.com>
Cc: Daniel Chemko <dchemko@smgtec.com>, Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>, nf <netfilter@lists.netfilter.org>

Look. tos can be set in mangle. mangle has five hooks including OUTPUT and
PREROUTING. OUTPUT affects the locally generated traffic. PREROUTING affects
the externally generated traffic that passes through your firewall. You can set
the tos like so:

$IPT -t mangle -A OUTPUT     -p udp --dport 53   -j TOS --set-tos 0x8
$IPT -t mangle -A OUTPUT     -p tcp --dport 80   -j TOS --set-tos 0x8
$IPT -t mangle -A OUTPUT     -p tcp --dport 22   -j TOS --set-tos 0x8
$IPT -t mangle -A OUTPUT     -p tcp --sport 22   -j TOS --set-tos 0x8

$IPT -t mangle -A PREROUTING -p udp --dport 53   -j TOS --set-tos 0x8
$IPT -t mangle -A PREROUTING -p tcp --dport 80   -j TOS --set-tos 0x8
$IPT -t mangle -A PREROUTING -p tcp --dport 22   -j TOS --set-tos 0x8
$IPT -t mangle -A PREROUTING -p tcp --sport 22   -j TOS --set-tos 0x8

What the tos value should be and what applications should benefit from
this, is up to you...

Ramin

On Thu, Oct 23, 2003 at 01:25:50PM -0700, SBlaze wrote:

> 
> --- Daniel Chemko <dchemko@smgtec.com> wrote:
> > 
> > >Good point. Is there any reason I shouldn't put my rules on the mangle 
> > >POSTROUTING table and kill 2 birds with one rule?
> > 
> > 
> > None that I can see, though I must admit that I swear sometimes I see
> > packets missing POSTROUGING; though, I blame that on my bogon ray
> > generator, and not Netfilter itself.
> > 
> > 
> Ok let me hop back in here... and mke sure I understand this so I don't insert
> bad rules in my firewall...
> 
> Jeff reccomends...
> 
> iptables -t mangle -A OUTPUT -p tcp -m state --state 
> NEW,RELATED,ESTABLISHED -m tcp --sport 80 -j TOS --set-tos 0x08
> 
> Ok I can see that this is making TOS changes for http service on the TCP
> protocol. (Quick Side q here but is udp affected by TOS???). Which I can see as
> being useful if you have cooperative routers between you and the peer user...
> 
> but Daniel reccomends...
> 
> You probably want this on the FORWARD chain to boost the performance of
> your actual client machines instead of just the firewall.
> 
> Why place it in the FOWARD chain?
> 
> Question back at Jeff here too...
> 
> Is the OUTPUT chain really the right place for me? I mean yes I know it would
> be good to change TOS in OUTPUT but doesn't that affect only the Linux box? My
> NAT goes through ....
> 
> iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to 68.119.x.x
> 
> so how could I go about changing the TOS of SNAATed packets? Is it even
> possible?
> 
> Thanks Guys... keep it coming.
> SBlaze
> 
> 
> 
> 
> 
> =====
> In the absence of order there will be chaos.
> 
> __________________________________
> Do you Yahoo!?
> The New Yahoo! Shopping - with improved product search
> http://shopping.yahoo.com

