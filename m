From: Nick Taylor <nickt@lightlink.com>
Subject: Re: Trying to use NETMAP for 1-1 NAT
Date: Tue, 16 Mar 2004 01:29:57 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSU.4.58.0403160119090.6899@adore.lightlink.com>
References: <Pine.GSU.4.58.0403142225080.22714@adore.lightlink.com>
 <20040315041348.GT26800@samad.com.au> <200403150733.07149.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403150733.07149.Antony@Soft-Solutions.co.uk>
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
Cc: netfilter@lists.netfilter.org

On Mon, 15 Mar 2004, Antony Stone wrote:
> Even simpler to setup, and maybe adequate for the task, would be a plain IP in
> IP tunnel (see http://lartc.org for details).   It doesn't have the security
> of an IPsec tunnel, but then neither does the nat solution which Nick is
> trying to get working in the first place.
>
> I think an IP tunnel would be a 'cleaner' network arrangement than lots of nat
> around the place, but the choice is yours, of course.
>
> Regards,
>
> Antony.
>
We already have VPN connections traveling all over the place, with
endpoints on opposite sides of the DSL modems.  While everything should
"just work" tunnel-in-tunnel, I would rather not incur the MTU cost of an
additional tunnel, when I can store the needed data in the destination IP
address, and still get around the route limit in the modem.

I compiled the iptables userspace I already had against my shiney new
patched kernel, and low and behold NETMAP works.  If anyone is interested
I can post more info on my crazy hack once it's completed.

Thanks to everyone who responded to me!

> > On Sun, Mar 14, 2004 at 10:57:18PM -0500, Nick Taylor wrote:
> > > I am posting a newbie question here, so I hope for your patience with me.
> > > ...
> > > Many, many netblocks are routed from our main office to the remote
> > > office.  The DSL modems we use, however, are only capable of storing 8
> > > routes, so we figured we could 1:1 NAT each of the subnets of interest
> > > into a large private space, send it across the DSL modems, and 1:1 NAT it
> > > back to the real IP addresses at the other end.  The other option we
> > > thought of was to use the modems as bridges, but it seems this would
> > > require a seperate (physical) interface in the linux box at each end for
> > > each modem. While this solution would work right now, it doesn't scale
> > > well.
> > >
> > > So, enter NETMAP...
> > >
> > > ...

