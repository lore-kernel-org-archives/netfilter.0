From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: iptables routing help
Date: Tue, 27 Jan 2004 06:46:55 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075204015.1891.0.camel@jasiiitosh.nexusmgmt.com>
References: <7A3B4AA360FDEF448F3390421FC8D731014BE9CF@coxhpexg.coxhp.com>
	 <915A2E91-5082-11D8-A7CD-000A9577164C@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <915A2E91-5082-11D8-A7CD-000A9577164C@hotmail.com>
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
To: William Knop <w_knop@hotmail.com>
Cc: bmcdowell@coxhealthplans.com, netfilter@lists.netfilter.org

That's understandable - inserting a second interface is quite
intrusive.  However, creating a logical interface does not require
inserting a second NIC - merely binding a second IP address to the
existing NIC - two networks running on the same NIC - John

On Mon, 2004-01-26 at 23:37, William Knop wrote:
> Unfortunately, using two interfaces isn't an option, either. A friend 
> of mine suggested vpn, however there has to be a cleaner route.
> 
> I thought I could drop packets from the prerouting table and it would 
> fall into the default routing table or something like that. Surely 
> there has to be a way.
> 
> 
> On Jan 26, 2004, at 11:29 AM, <bmcdowell@coxhealthplans.com> wrote:
> 
> >
> > I was about to suggest the exact same thing.
> >
> >
> > Bob
> >
> > -----Original Message-----
> > From: netfilter-admin@lists.netfilter.org
> > [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of John A.
> > Sullivan III
> > Sent: Monday, January 26, 2004 6:06 AM
> > To: William Knop
> > Cc: netfilter@lists.netfilter.org
> > Subject: Re: iptables routing help
> >
> >
> > On Sun, 2004-01-25 at 13:53, William Knop wrote:
> >> Okay, the problem is that we don't want to do nat (as I said in my
> >> original plee for help). We need external ips on all of the machines.
> >> Additionally, The ISP's DHCP server specifies it's own gateway, so I
> >> can't do normal routing, without spoofing the gateway's address and
> >> doing all sorts of ugly stuff (please correct me if I'm wrong).
> >>
> >>
> >> I was under the impression one could have iptables drop a packet from
> >> the prerouting or brouting table and it would go through the machine's
> >> routing table, without being specified on all the lan machines as the
> >> gateway.
> >>
> >>
> >> The physical layout we have are a bunch of boxes connected to a
> >> switch, and the dsl modem connected to the switch's uplink port. I
> >> could have the modem jack into a firewall box, or something, however
> >> the linux ethernet bridge seems to do very odd things to arps, and
> >> also iptables. Would bridging be necessary?
> >>
> >>
> >>
> > <snip>
> > This may not be as bad as it sounds and it my be a netfilter issue.
> > Looking at the topology, I would assume that there are several devices
> > on the same public subnet connect through the switch to the DSL modem 
> > in
> > which case they should talk to each other directly on that subnet
> > without sending the data across the DSL modem.  But am I correct to
> > understand that even though these devices share the same switch and the
> > same DSL modem that they are allocated public addresses out of 
> > different
> > IP subnets?
> >
> > If that is the case, the best solution is to install a second NIC into
> > each device and create a separate private network as already suggested.
> > Barring that, you can create a second, logical network on the same
> > media.  Use iproute2 to bind a second address to each of the public
> > interfaces.  These will all come from the same subnet and should be 
> > able
> > to communicate with each other.  Just be sure to use the secondary
> > address when sending data between those devices.
> >
> > ip address add dev0 192.168.1.4/24
> > ip address add dev0 192.168.1.5/24
> > ip address add dev0 192.168.1.6/24 . . . etc.
> >
> > This is a bit dangerous as these devices are still publicly exposed and
> > the ISP may allow traffic on RFC1918 addresses on their internal
> > networks so you may want to tightly secure the devices even for traffic
> > from these "private" addresses using iptables.
> >
> > This is the sort of set up that we use on our internal routers to
> > participate in the worldwide VPN project (http://www.worldwidevpn.com).
> > Good luck - John
> > -- 
> > John A. Sullivan III
> > Chief Technology Officer
> > Nexus Management
> > +1 207-985-7880
> > john.sullivan@nexusmgmt.com
> > ---
> > If you are interested in helping to develop a GPL enterprise class
> > VPN/Firewall/Security device management console, please visit
> > http://iscs.sourceforge.net
> >
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com


