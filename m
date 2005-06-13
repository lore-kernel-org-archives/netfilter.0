From: Ulisses <ulisses.alonso@unavarra.es>
Subject: stateless udp redirect: was: CONFIG_IP_NF_NAT_LOCAL and REDIRECT
Date: Mon, 13 Jun 2005 19:55:34 +0200
Message-ID: <20050613175534.GB1391@s163m108.unavarra.es>
References: <20050613152136.GA434@s163m108.unavarra.es>
	<20050613154237.GB434@s163m108.unavarra.es>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050613154237.GB434@s163m108.unavarra.es>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Hi again,

REDIRECT depends on connection tracking?

How I can do a stateless UDP REDIRECT? just like in the 2.0 era?

I suspect that my problems are related to this....

Thanks

	Ulisses


On Mon, Jun 13, 2005 at 05:42:37PM +0200, Ulisses wrote:
> 
> I forgot to mention that it does work on linux 2.4.27 vanilla with
> CONFIG_IP_NF_NAT_LOCAL enabled...
> 
> More precisely:
> 
> socket with local address _not_ set to the loopback adress is redirected,
> and it is seen by tcpdump as
> 
> 127.0.0.1.localport > 127.0.0.1.redirected port
> 
> 
> Thanks in advance
> 
> 	Ulisses
> 
> On Mon, Jun 13, 2005 at 05:21:36PM +0200, Ulisses wrote:
> > 
> > Hello
> > 
> > I'm trying to guess why the REDIRECT tarjet is not applied to local 
> > process having CONFIG_IP_NF_NAT_LOCAL enabled
> > 
> > Having the following rule
> > 
> > iptables -t nat -A OUTPUT --destination $HOSTB/32 --protocol udp --destination-port 123 \
> >          -j REDIRECT --to-ports $ABPORT
> > 
> > 
> > doesn't apply to local ip address, please note that I'm not referring to the loopback.
> > 
> > If the packet is sent form 127.0.0.1 works ok. I'm running kernel 2.6.9 vanilla
> > 
> > Any comment or suggestion will be greatly appreciated
> > 
> > Thanks in advance
> > 
> > 	Ulisses
> >                 Debian GNU/Linux: a dream come true
> > -----------------------------------------------------------------------------
> > "Computers are useless. They can only give answers."            Pablo Picasso
> > 
> > "Debugging is twice as hard as writing the code in the first place.
> > Therefore, if you write the code as cleverly as possible, you are,
> > by definition, not smart enough to debug it." - Brian W. Kernighan
> > 
> 
> -- 
>                 Debian GNU/Linux: a dream come true
> -----------------------------------------------------------------------------
> "Computers are useless. They can only give answers."            Pablo Picasso
> 
> "Debugging is twice as hard as writing the code in the first place.
> Therefore, if you write the code as cleverly as possible, you are,
> by definition, not smart enough to debug it." - Brian W. Kernighan
> 
> 

-- 
                Debian GNU/Linux: a dream come true
-----------------------------------------------------------------------------
"Computers are useless. They can only give answers."            Pablo Picasso

"Debugging is twice as hard as writing the code in the first place.
Therefore, if you write the code as cleverly as possible, you are,
by definition, not smart enough to debug it." - Brian W. Kernighan


