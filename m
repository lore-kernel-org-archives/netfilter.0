From: "Darrell A. Escola" <darrell-iptables@descola.net>
Subject: Re: HELP : How to group IP addresses by refering to them as a single name ?
Date: Fri, 20 Sep 2002 22:34:37 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020921053437.GA30517@descola.net>
References: <20020920124303.17644.qmail@web40209.mail.yahoo.com> <20020920190548.NZUZ16609.mta05-svc.ntlworld.com@there>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20020920190548.NZUZ16609.mta05-svc.ntlworld.com@there>
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

On Fri, Sep 20, 2002 at 02:11:29PM +0100, Antony Stone wrote:
>
> On Friday 20 September 2002 1:43 pm, Alok Shukla wrote:
> 
> > HI,
> >
> > THANKS A LOT..!
> >
> > I have understood a lot of things. Now just for the
> > sake..tell me if the following are valid
> >
> > iptables -t nat -A POSTROUTING -s 192.168.0.10/27 -d
> > any/0 -J MASQUERADE
> >
> > for allowing all the machines starting from 11 to 41
> 
> Unfortunately not.   You have the right idea, but you can't simply choose the 
> starting address anywhere you like :-(
> 
> The rule is this: the starting address of the block must be a multiple of the 
> size of the block.
> 
> So if you're creating a block of 64 machines with a /26 netmask, the first 
> address of the block must be 0, 64, 128 or 192.
> 
> Similarly, if you want a block of 32 machines with a /27 netmask, the first 
> address of the block must be 0, 32, 64, 96, 128, 160, 192 or 224.
> 
> In yur case you tried to create a block of 32 machines with a starting 
> address of 10, which I'm afraid is not allowed :-)
> 
> 
> Hope this helps,
> 
> Antony.
> 

It might be well to note that the "0" host address is reserved for the
network and not useable as a host/node address - the last address in the
subnet is reserved for broadcast - therefore a /27 subnet allows 30 host
addresses. If more than 30 host addresses are needed, use a /26 subnet,
allowing 62 hosts.

-- 
Darrell A. Escola, CCNA(R)
Cisco(R) Certified Network Associate

This message emanates from my personal domain, and conveys solely my own
ideas, opinions, and thoughts; not those of any employer past, present
or future.

