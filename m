From: "Mehmet AK" <mehmet.ak@kolayyol.net>
Subject: Re: map internal ip
Date: Sun, 28 Mar 2004 13:26:10 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000901c414af$2a155550$de00a8c0@homelande0hze1>
References: <1079722569.1980.52.camel@kaos.mpsnet.net.mx> <200403191918.05189.Antony@Soft-Solutions.co.uk>
Reply-To: "Mehmet AK" <mehmet.ak@kolayyol.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

hi Antony.

yo can do this with iproute2  .  You have to mark TCP packet with iptables
like an example

ip route add default via 148.245.164.1 table 40 # this is your default
router
iptables -t mangle -I PREROUTING -d 150.50.53.5  -j MARK --set-mark 0x10  #
mark who goes 150.50.53.5
ip rule add fwmark 0x10 table 40      #


best regards

Mehmet AK



----- Original Message ----- 
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Friday, March 19, 2004 10:18 PM
Subject: Re: map internal ip


> On Friday 19 March 2004 6:56 pm, Omar Armas wrote:
>
> > I have the following config:
> >
> > (public ip)
> > eth0
> > Firewall
> > eth1 (150.50.53.4)
> >
> > 148.145.133.1 (vpn router)
> >
> > 150.50.57.0/24
> > (LAN, including a server with 150.50.57.2)
> >
> > *Class 150.50.57.0/24 is routed to 148.245.164.1
> >
> > I want that when people(from eth1 lan) goes to 150.50.53.5, be
> > redirected to 150.50.57.2.
> >
> > I tried:
> >
> > iptables -t nat -A PREROUTING 150.50.53.5 -j DNAT --to-destination
> > 150.50.57.2
> >
> > But doesn't seem to be working. Any idea if it is possible and how to do
> > it?
>
> That looks correct.   Do you have a suitable FORWARD rule to allow the
> translated packets through the firewall?
>
> Does 150.50.57.2 know how to route the replies back again (through the
> firewall)?
>
> How are you testing?
>
> I'm not sure I understand the significance of the "VPN router" shown on
your
> diagram with only a single IP address - can you explain further what this
> means, and what is its relevance to the setup?
>
> Regards,
>
> Antony.
>
> -- 
> Never write it in Perl if you can do it in Awk.
> Never do it in Awk if sed can handle it.
> Never use sed when tr can do the job.
> Never invoke tr when cat is sufficient.
> Avoid using cat whenever possible.
>
>                                                      Please reply to the
list;
>                                                            please don't CC
me.
>
>


