From: Shawn <core@enodev.com>
Subject: RE: Is this correct?
Date: 19 Jun 2003 22:19:52 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1056079192.14133.94.camel@localhost>
References: <09B04A55822EFF4DA48D2E0BB2941D4A0192A1@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A0192A1@wardrive.citadelcomputer.com.au>
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
To: George Vieira <georgev@citadelcomputer.com.au>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

So anyway, assign 10.0.0.1 to linux-router/eth0:1 so the host would
actually get all the packets intended for 10.0.0.1[192.168.0.1]...

I guess it's surprising to me if this works, because at what point does
linux-router decide if a packet if to be forwarded or accepted as it's
own? If eth0 has 10.0.0.1, would DNATing the packet in PREROUTING to
192.168.0.1 keep linux-router from owning the packet?

Anyway, my original scenario is bogus. The hosts needing to reach
10.0.0.1[192.168.0.1] would likely be routing through something, and not
on 10.0.0.0/24.

Really sorry for being confusing. I can see why my original scenario
would be dubious.

On Thu, 2003-06-19 at 21:49, George Vieira wrote:
> I have to correct that line I mentioned below.. it should've been as a previous users post which showed the netmask as 255.255.255.0 (/24) not 255.0.0.0 (/8) , that's if ALL hosts are on a C class network with a A class address..
> If they are all on 10.0.0.X/255.255.255.0 and they want to talk to 10.0.0.1 and that machine doesn't exist it'll fail unless:
> 
> 1. you add the IP to the firewall so it'll respond to the ARP requests and then your rule will work.
> 2. Add a host route to all machines to go via the firewall even when it has not got that IP.. bloody big job if there's alot of hosts.. and ugly.
> 
> If the source IP is not 10.0.0.X and the default gateway IS the firewall then it'll work.. but from what your saying about the network structure it won't without some more changes..
> 
> Thanks,
> ____________________________________________
> George Vieira
> Systems Manager
> georgev@citadelcomputer.com.au
> 
> Citadel Computer Systems Pty Ltd
> http://www.citadelcomputer.com.au
> 
> Phone   : +61 2 9955 2644
> HelpDesk: +61 2 9955 2698
>  
> 
> -----Original Message-----
> From: Shawn [mailto:core@enodev.com]
> Sent: Friday, June 20, 2003 12:42 PM
> To: George Vieira
> Cc: netfilter@lists.netfilter.org
> Subject: RE: Is this correct?
> 
> 
> Do you say add 10.0.0.1 to eth0 because you figure I lack an external
> routing reference making packets arrive at my host?
> 
> Come to think of it, there probably wouldn't be a router that could do
> that in my scenario. Sorry if I was confusing. It's probably more
> accurate to say that some host "10.23.4.209" is going to try to reach
> 10.0.0.1, and 10.0.0.250 is the last hop on the way there.
> 
> Now does that sound better?
> 
> On Thu, 2003-06-19 at 17:10, George Vieira wrote:
> > The only way I know of to do that is use iproute2 (or ifconfig) and add that IP to the firewalls eth0 device and fix your rule (lowercase J).
> > 
> > ip addr add 10.0.0.1/8 dev eth0
> > iptables -t nat -I PREROUTING -i eth0 -d 10.0.0.1 -j DNAT \
> >  --to 192.168.0.1
> > 
> > I think that'll work OK..
> > 
> > Thanks,
> > ____________________________________________
> > George Vieira
> > Systems Manager
> > georgev@citadelcomputer.com.au
> > 
> > Citadel Computer Systems Pty Ltd
> > http://www.citadelcomputer.com.au
> > 
> > Phone   : +61 2 9955 2644
> > HelpDesk: +61 2 9955 2698
> >  
> > 
> > -----Original Message-----
> > From: Shawn [mailto:core@enodev.com]
> > Sent: Friday, June 20, 2003 7:07 AM
> > To: netfilter@lists.netfilter.org
> > Subject: Is this correct?
> > 
> > 
> > I have a, iptables statement I would just like someone to say if I have
> > it right.
> > 
> > Let's say I have a linux box with eth0=10.0.0.250 and
> > eth1=192.168.0.250, and there's a host (192.168.0.1) connected to eth1.
> > I want to route connections from hosts in 10.0.0.0/24 land to 10.0.0.1
> > onto the linux box's eth0, and have them NATed to 192.168.0.1
> > 
> > Will the following statement do that?
> > 
> > iptables -t nat -I PREROUTING -i eth0 -d 10.0.0.1 -J DNAT \
> > 	--to 192.168.0.1
> > 
> > 
> > 

