From: "Neil Aggarwal" <neil@JAMMConsulting.com>
Subject: RE: Want to do NAT for internal machines
Date: Sat, 1 Jun 2002 15:54:08 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <ENEBKGGOKDOEALIKAJMBOEDGCHAA.neil@JAMMConsulting.com>
References: <200206011605.g51G5rA04402@Networker.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206011605.g51G5rA04402@Networker.rockstone.co.uk>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter <netfilter@lists.samba.org>

Antony:

It did not work.

I typed these rules:
        /sbin/ifconfig eth0:1 66.137.153.29 netmask 255.255.255.224
broadcast 66.137.153.31
        /sbin/iptables -t nat -A PREROUTING -d 66.137.153.29 -j DNAT --to
192.168.1.29
        /sbin/iptables -t nat -A POSTROUTING -s 192.168.1.29 -j SNAT --to
66.137.153.29

Here is the ip configuration of my machine:
Connection-specific DNS Suffix  . :
Autoconfiguration IP Address. . . : 192.168.1.29
Subnet Mask . . . . . . . . . . . : 255.255.255.0
Default Gateway . . . . . . . . . : 192.168.1.1


/sbin/iptables -n -L gives me:
Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

/sbin/iptables -t nat -n -L gives me:
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
DNAT       all  --  0.0.0.0/0            66.137.153.29      to:192.168.1.29

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
SNAT       all  --  192.168.1.29         0.0.0.0/0          to:66.137.153.29

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Any ideas?

Thanks,
	Neil.

--
Neil Aggarwal
JAMM Consulting, Inc.    (972) 612-6056, http://www.JAMMConsulting.com
Custom Internet Development    Websites, Ecommerce, Java, databases


> -----Original Message-----
> From: netfilter-admin@lists.samba.org
> [mailto:netfilter-admin@lists.samba.org]On Behalf Of Antony Stone
> Sent: Saturday, June 01, 2002 11:06 AM
> To: netfilter
> Subject: Re: Want to do NAT for internal machines
>
>
> On Saturday 01 June 2002 4:04 pm, Neil Aggarwal wrote:
>
> > I have several static IPs that I can bind to the
> > Internet-facing interface (eth0) of the Linux server.
> > Let say that they are 11.22.33.44 to 11.22.33.99.
> >
> > What I want to do is set up routing so that the outside
> > world can connect to one of my public IPs and that
> > connection is routed to a given internal machine.
> > I also want the internal machine to be able to connect
> > to the outside world and go out as the public
> > IP that is matched to it.
> >
> > Here is what I came up with:
> >
> > # Bind the IP to eth0
> > /sbin/ifconfig eth0:1 11.22.33.55 netmask 255.255.255.0 broadcast
> > 11.22.33.255
>
> A slightly outdated way of doing it, but it'll certainly do the
> job.   It's
> the way I still do it.
>
> > # Route incoming connections to the internal machine
> > /sbin/iptables -t nat -A PREROUTING -d 11.22.33.55 -j DNAT --to
> > 192.168.1.55 # Route outgoing connections from the internal machine
> > /sbin/iptables -t nat -A POSTROUTING -s 192.168.1.55 -j SNAT --to
> > 11.22.33.55
> >
> > Is this close?
>
> Is it close ????   Absolutely spot on :-)
>
> ....so long as you accept that netfilter isn't going to be
> providing you with
> any security whatever in a setup like this...
>
> ie it's going to forward all packets in and out of your internal
> machines -
> you may as well have just plugged them straight into the
> Internet.   Put some
> decent security measures on those servers, and you'll be okay.
>
>
>
> Regards,
>
>
> Antony.


