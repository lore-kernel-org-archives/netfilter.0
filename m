From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: weird netfilter problem
Date: Tue, 29 Jun 2004 16:41:07 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406291641.07680.Antony@Soft-Solutions.co.uk>
References: <BAY4-F42aqnu1Um0ZZj0001cf7a@hotmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY4-F42aqnu1Um0ZZj0001cf7a@hotmail.com>
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

On Tuesday 29 June 2004 4:27 pm, Mike O wrote:

> Did some more testing seems I can ping the private side of the box, but not
> the public side...this a conntrack issue maybe? then when I ping internal
> from the firewall it works.

I don't see why you should need to ping the public side of the firewall in 
order to route packets through it from the private LAN?

If you think connection tracking may be having problems, what do you get for 
"wc -l </proc/net/ip_conntrack"?   That is a count of the number of 
concurrent connections through (or to / from) the machine.

Regards,

Antony.

> From: Antony Stone <Antony@Soft-Solutions.co.uk>
>
> >Reply-To: netfilter@lists.netfilter.org
> >To: netfilter@lists.netfilter.org
> >Subject: Re: weird netfilter problem
> >Date: Tue, 29 Jun 2004 14:12:02 +0100
> >
> >On Tuesday 29 June 2004 2:02 pm, Mike O wrote:
> > > Im trying to track down a problem Im having with iptables. For some
> >reason
> > > the internal machines cannot reach the internet until I ping them from
> >the
> > > iptables box. I check the conntrack tables and there still valid
> > > entries
> >in
> > > there for that machine. if I reboot it works for about 5 minutes then
> > > stops. I tried upgrading the kernel to 2.4.26 and iptables 1.2.11 and
> >the
> > > same problem happens. Any ideas? this was working fine for over 6
> > > months then just starts doing this.
> >
> >Sounds like the client machines can't do ARP resolution for the IP address
> >of the gateway.
> >
> >I would suspect:
> >
> >1. The NIC on the firewall.
> >2. The switch on your LAN.
> >
> >Wait until one of the clients cannot get to the Internet, then examine its
> >ARP
> >cache ("arp -an" on Linux, not sure about other O/Ss), and see if it has a
> >complete entry for the IP address of the firewall's internal interface.
> >
> >Then do your ping and repeat the ARP check.
> >
> >Regards,
> >
> >Antony.

-- 
Microsoft may sell more software than any other company, but McDonald's sell 
more burgers than any other company, and I think the other similarities are 
obvious...

                                                     Please reply to the list;
                                                           please don't CC me.


