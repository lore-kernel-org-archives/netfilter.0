From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: IP Alias with iptables
Date: Mon, 19 Apr 2004 16:12:39 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404191612.39869.Alistair@nerdnet.ca>
References: <EMEKLOMJOPNJPAFKHEDJGECHCDAA.rhaces_chistes@yahoo.com.mx> <200404191625.45747.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404191625.45747.Antony@Soft-Solutions.co.uk>
Content-Disposition: inline
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

On April 19, 2004 03:25 pm, Antony Stone wrote:
> On Monday 19 April 2004 5:07 pm, Rodrigo Haces wrote:
> > > > I have only one network adapter in my Server, but i need to have 2
> > > > different networks, 192.168.1.0 to the MAC addresses i know and
> > > > 192.168.0.0 to the MAC addresses i don't know
> > >
< < Much snippage for brevity >>


> on which network range you want to do what.
>
> > > > if not, is there a way to create an eth0 and eth1 witn the same
> > > > adapter?
> > >
> > > No.   It's a simple (and cheap) job to add another ethernet card,
> > > though.
> >
> > No PCI slots available... :(
>
> I suggest another firewall then - trying to set up a firewall with only one
> ethernet interface is a poor enough solution (from a security point of
> view) in the first place, but if there is wireless access involved as well
> then I would not even consider it.
>
>
	Thanks Antony  -- again you have expressed precisely what I would have said 
-- succinctly and clearly.

	Aliased (stacked) interfaces ARE NOT SECURE.  Period.

	(And Hubs don't help)

	Alistair Tonner


 Regards,
>
> Antony.

