From: Simon Matthews <simon@paxonet.com>
Subject: Re: Iptables, SNAT/MASQ,  Multiple gateways (fwd)
Date: Sun, 29 Sep 2002 20:02:30 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209291956070.16263-100000@localhost.localdomain>
References: <20020929232812.NJRO20346.mta02-svc.ntlworld.com@there>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020929232812.NJRO20346.mta02-svc.ntlworld.com@there>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

On Mon, 30 Sep 2002, Antony Stone wrote:

> On Monday 30 September 2002 12:12 am, Simon Matthews wrote:
> 
> > I have a dual-homed firewall. It has 2 Internet connections, provided by
> > different ISPs (each with an associated IP address). The 2 Internet
> > connections are connected to the same physical interface.
> 
> Why ???

Why not? What benefit is there in having more than one physical interface 
connected to the Internet gateways? Actually, adding another interface 
might allow me to solve the problem (match on -o), but this does not seem 
to be an elegant solution. 


> 
> >
> > Now, since the gateway is already defined, how do I make MASQ/SNAT work so
> > that it set the appropriate source address for the gateway?
> 
> Can you use the MARK match ?
> 
> I know it's possible to set a MARK on packets using the mangle table, and 
> then use the MARK in iproute2 to send them the right way, but I'm not so sure 
> about doing it the other way around - setting the MARK with iproute2 so that 
> you can read it in the nat table and set the source address.

Exactly the problem. How do I set a MARK or other value in iproute2 that 
can be matched in the iptables command? 

> 
> > Or will MASQ just work properly -- setting the
> > source address according to the gateway that the packet will use?
> 
> No.   MASQUERADE will not know which of the two addresses on eth0 you're 
> thinking about, so it would use the same one for every packet.

I thought this was probably the case, but I had to ask. 

Any ideas on how it will select an address to use? A partial solution 
would be to have it use my fast connection, then, if this connection 
fails, the interface will disappear and then the MASQ will use the other 
interface. 

Simon


