From: Roeland Moors <roelandmoors@pandora.be>
Subject: Re: change TTL value
Date: Fri, 9 Apr 2004 13:16:05 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040409111605.GA972@home.be>
References: <20040408161334.GA2396@home.be> <001301c41e01$1d3e4fc0$1202a8c0@admin> <407669BA.8040203@pandora.be> <004901c41e1a$7ee2c3f0$1202a8c0@admin>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <004901c41e1a$7ee2c3f0$1202a8c0@admin>
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
To: netfilter@lists.netfilter.org

On Fri, Apr 09, 2004 at 12:07:41PM +0200, Rob Sterenborg wrote:
> > >>I'm trying to change the value of the TTL field with this line:
> > >>$IPTABLES -t mangle -A PREROUTING -i $INET_IFACE -p igmp 
> > >> -j TTL --ttl-inc 1
> > >
> > >>But when I try to execute this I have this error:
> > >>iptables: No chain/target/match by that name
> > >
> > >
> > > Did you compile TTL target support as a module ?
> > > I don't see it in the module list (non-targets deleted), which means you
> > > don't have TTL target support, unless you compiled it into the kernel
> (but I
> > > don't think so).
> > >
> >
> > /lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_ttl.ko
> > Isn't this the TTL target module?
> 
> AFAIK target modules have uppercase chars, match modules have all lowercase
> chars.
> 

Thanks, this is probably the problem, I think I have to install
patch-o-matic for this module.

--
Roeland

