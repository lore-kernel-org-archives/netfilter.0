From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: HELP : How to group IP addresses by refering to them as a single name ?
Date: Sat, 21 Sep 2002 09:01:53 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020921080155.OYKZ11421.mta03-svc.ntlworld.com@there>
References: <20020920124303.17644.qmail@web40209.mail.yahoo.com> <20020920190548.NZUZ16609.mta05-svc.ntlworld.com@there> <20020921053437.GA30517@descola.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020921053437.GA30517@descola.net>
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

On Saturday 21 September 2002 6:34 am, Darrell A. Escola wrote:

> On Fri, Sep 20, 2002 at 02:11:29PM +0100, Antony Stone wrote:
>
> > The rule is this: the starting address of the block must be a multiple of
> > the size of the block.
> >
> > So if you're creating a block of 64 machines with a /26 netmask, the
> > first address of the block must be 0, 64, 128 or 192.
> >
> > Similarly, if you want a block of 32 machines with a /27 netmask, the
> > first address of the block must be 0, 32, 64, 96, 128, 160, 192 or 224.
> >
> > In your case you tried to create a block of 32 machines with a starting
> > address of 10, which I'm afraid is not allowed :-)
>
> It might be well to note that the "0" host address is reserved for the
> network and not useable as a host/node address - the last address in the
> subnet is reserved for broadcast - therefore a /27 subnet allows 30 host
> addresses. If more than 30 host addresses are needed, use a /26 subnet,
> allowing 62 hosts.

No, in this case that's not correct.

What you say is true for the netmask in use on the computers on the network - 
ie if you have a bunch of machines in some network range, and they have a /27 
netmask, then you can only use 30 of the 32 IP addresses for actual 
computers, for precisely the reason you gave.

However, if the computers on your network have a /24 netmask as here (so you 
can have up to 254 machines, plus the .0 network address and the .255 
broadcast address), then .31 is a perfectly acceptable address for one of the 
machines.   .32 is another perfectly acceptable machine address, and you can 
match these using a .0/27 or .32/27 netmask in a netfilter rule.

Your netfilter rules can specify any netmask which is useful to match a range 
of addresses of interest - it doesn't have to match the netmask which is 
actually in use on your network.

Antony.

-- 

If you want to be happy for an hour, get drunk.
If you want to be happy for a year, get married.
If you want to be happy for a lifetime, get a garden.

