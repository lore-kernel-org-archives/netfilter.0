From: "Tim" <twr@bellsouth.net>
Subject: Fw: eth0, eth1, eth2 ?? + ping/mac ??
Date: Sun, 30 Jun 2002 13:05:19 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <000801c22071$76423940$6106d6d1@nebuchadnezza>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
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
To: iptables <netfilter@lists.samba.org>


----- Original Message -----
From: "Tim" <twr@bellsouth.net>
To: "Joe Patterson" <jpatterson@asgardgroup.com>
Sent: Sunday, June 30, 2002 11:22 AM
Subject: Re: eth0, eth1, eth2 ??


 Joe,

 Thank you .....awesome little tool.....it was just as I and everyone else
 suspected as to where the position of eth0, eth1 and eth2 are at......the
 tool mii-tool confirmed our suspicions. Here is an interesting finding
 though, when I ping from another machine to eth0 I get a successful echo
 reply. I then  run the arp command on the machine I initiated the ping from
 and I can read the ip address of eth0 and the mac address of the NIC. When
I
 ping eth1 from the same machine and then run the arp command I get the ip
 address of eth1 but the same mac address for the eth0 NIC. Pinging eth2
will
 give me its NIC ip address and the correct mac address for that NIC. All
 NICs are configured with different IPs and they have the obvious different
mac addresses.

 This is just a curious question: Why would the above mention test give me
 the same mac address for both eth0 and eth1 when the ip addresses are
 different??? This behaviour could become a problem if I were to run a
script
 that would include a rule for a mac address of either card. Wouldn't it ???

 Tim
> ----- Original Message -----
> From: "Joe Patterson" <jpatterson@asgardgroup.com>
> To: "Antony Stone" <Antony@Soft-Solutions.co.uk>; "iptables"
> <netfilter@lists.samba.org>
> Sent: Saturday, June 29, 2002 9:11 PM
> Subject: RE: eth0, eth1, eth2 ??
>
>
> > or they other way is to use the most excellent mii-tool.
> >
> > run `mii-tool -w`, and then start plugging and unplugging cables.  You
> will
> > find it most informative.  :)
> >
> > -Joe
> >
> > > -----Original Message-----
> > > From: netfilter-admin@lists.samba.org
> > > [mailto:netfilter-admin@lists.samba.org]On Behalf Of Antony Stone
> > > Sent: Saturday, June 29, 2002 11:22 AM
> > > To: iptables
> > > Subject: Re: eth0, eth1, eth2 ??
> > >
> > >
> > > On Saturday 29 June 2002 7:21 pm, Tim wrote:
> > >
> > > > Hi everyone,
> > > >
> > > > On my firewall box, as mentioned previously, I have
> > > > three NICs. On PCI slot 1: video card; PCI slot 2: 1st NIC; PCI
> > > slot 3: 2nd
> > > > NIC; PCI slot 4: 3rd NIC. Now, eth0 would be the 1st NIC  on slot 2
?
> Is
> > > > this correct ? I need to confirm this in order to know which
> > > NIC Iam going
> > > > to plug into on the firewall box from the router [location of
> > > eth0, eth1,
> > > > eth2], the LAN, and the DMZ and also write rules for the
> > > different chains.
> > >
> > > You'll have to plug in some cables and find out :-)
> > >
> > > The order in which your NICs get allocated as eth0, eth1, eth2
> > > depends mainly
> > > on what chipset they are (the kernel will initialise chipsets in
> > > a certain
> > > order, so if your NICs have different chipsets this is what will
> > > determine
> > > which gets called eth0, which eth1 etc), alternatively on what
> > > order you load
> > > modular drivers (if that's the way you compiled your kernel), but it
> also
> > > depends signiicantly on your motherboard / Bios - generally you
> > > will find the
> > > NICs get initialised in order from one end of the PCI bus towards
> > > the other
> > > (but until you try, you don't know which end it starts from), but
> > > even this
> > > sensible sequencing is not actually guaranteed.
> > >
> > > I suggest the way to do it is to allocate an address in your LAN range
> to
> > > eth0, and an address in your DMZ range to eth1, ping something on
> > > your LAN
> > > from the firewall, and then just plug each of the three NICs into
> > > your LAN
> > > switch in turn.   Once you've worked out which is eth0, do the
> > > same thing for
> > > eth1 (this will almost certainly be the NIC in the middle), and
> > > then you know
> > > the other one is eth2.
> > >
> > >
> > >
> > > Antony.
> > >
> > >
> > >
> >
> >
>


