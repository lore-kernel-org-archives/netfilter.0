From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: conf scenario.
Date: Mon, 3 May 2004 23:28:46 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405032328.46938.Antony@Soft-Solutions.co.uk>
References: <4096AE99.5070705@o2.pl> <200405032156.34614.Antony@Soft-Solutions.co.uk> <4096C11D.5000709@vcxz.co.uk>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4096C11D.5000709@vcxz.co.uk>
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

On Monday 03 May 2004 11:01 pm, Jon Colverson wrote:

> Antony Stone wrote:
> > On Monday 03 May 2004 9:42 pm, Krystian wrote:
> >>i need some help on how to configure this scenario in iptables:
> >>
> >>[adsl modem/router]-----[eth1-linux box-eth0]-----[network]
> >>
> >>question: how to configure "linux box's" iptables to forward and
> >>masquarade traffic from most users and bridge traffic for couple
> >>"public" users.
>
> I don't believe that any iptables configuration is necessary for the
> machines with public IPs. The Linux box will need a public IP on the
> same subnet as them and will need to have IP forwarding turned on (echo
> 1 > /proc/sys/net/ipv4/ip_forward). The boxes with public IPs will need
> to have the Linux box as their default gateway and it should all just work.

This does require a bit of fiddling about with the routing tables to make sure 
the gateway machine knows which interface to find various public IPs on.   
However, it can be done with the right netmasks.

> If you can't spare a public IP for the Linux box, can you just connect
> the ADSL modem/router, the Linux box, and the clients all to the same
> Ethernet? This is the setup I use. In that case the clients with public
> IPs would be able to see the ADSL modem/router directly (and would
> simply use that as their default gateway).

The problem with that is that you are then exposing the public IP servers 
directly to the Internet without the benefit of the firewall :(

> > Add a third interface card eth2, bridge eth1 and eth2 as br0, and then
> > route between br0 and eth0.
> >
> > If you have hosts on your network which need public IPs then they have to
> > be on a separate subnet from your normal clients anyway.
>
> I don't think this is necessary. The public IP clients are obviously on
> a different IP subnet, but they can happily share the Ethernet with the
> NATed clients.

Ugh :)   I object to the use of the word "happily".   It'll work, sure, but 
it's not a nice networking setup (ie: don't blame me when there's a problem 
and debugging turns up some crazy results...)

Besides, what happened to the security model where you make sure that any 
publicly-accessibly server which happens to get compromised can't do any 
damage to your internal network?

Regards,

Antony.

-- 
Having been asked for a reference for this man,
I can confirm that you will be very lucky indeed if you can get him to work 
for you.

                                                     Please reply to the list;
                                                           please don't CC me.


