From: Wakko Warner <wakko@animx.eu.org>
Subject: Re: Block LAN DHCP broadcast
Date: Tue, 17 Jul 2007 12:26:24 -0400
Message-ID: <20070717162624.GA16837@animx.eu.org>
References: <3130eec50707160652r7fe3285amfafc695b45ee4800@mail.gmail.com>
	<1184595437.17688.72.camel@localhost>
	<3130eec50707160738o418b7a9m43f68af0c6a9afe4@mail.gmail.com>
	<1184599806.17688.105.camel@localhost>
	<3130eec50707160907x44cfbcc8u294ffd6118de7e9c@mail.gmail.com>
	<20070716163705.GA11481@animx.eu.org>
	<3130eec50707161010q62a32011p527c11ca9026f07f@mail.gmail.com>
	<20070717004355.GA13667@animx.eu.org>
	<3130eec50707161840p1f70394x5d79addf9d7404cc@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3130eec50707161840p1f70394x5d79addf9d7404cc@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gnarlodious <lists.gnarlodious@gmail.com>
Cc: netfilter@lists.netfilter.org

Please do not top post.

Gnarlodious wrote:
> Hi, thanks for all the interest. This firmware runs on all WiFi
> routers with a Broadcom chipset, including some Linksys models,
> Buffalo, Asus and others. It is Linux with a complement of utilities
> for networking, so it comes defaulted to network by simply plugging it
> in. The router is made so you can add or remove it from the network
> and it all keeps working. It's great.
> 
> The "UPS" in my diagram is an Uninterruptable Power Supply, not a
> computer. I included it to illustrate the miserly power requirements
> of the two devices that it feeds. It does not have a network
> connection, but it talks to the server through USB.

As far as a networking diagram, it shouldn't have been shown.  The diagram
you have is just what devices are plugged in to other devices so there's no
way to tell what network or networks are there.

> The DSL modem is also an access point/router, it has 4 ethernet ports
> and WiFi, which is disabled. Unfortunately it is somewhat limited in
> capability. The server is connected with a static IP address and is
> internet accessible, sort of a limited DMZ setup. The modemrouter
> needs to have spare DHCP available for power failure emergency use,
> otherwise I could set the DHCP range to nil and not bother with this
> problem.

You really don't want more than 1 DHCP server on a network (There are cases
where it's ok which is beyond the scope of this message).

> Along the Ethernet Backbone there are several more devices than what I
> I drew, that was just a minimal example. This leg of the network is
> inaccessible from the internet. All routers are WRT54GLs with full
> Linux routing capabilities. All WRTs have a static IP, are connected
> on LAN ports and connections cascade nicely. The only problem is that
> the WRTs include the modemrouter in their DHCP broadcast. This is what
> I am trying to prevent. The modemrouter also broadcasts DHCP to the
> WRTs, so I want blocking both ways.

So basically you're just using the AP1 and AP2 as a switch.  This would mean
that the diagram depicts one single network.

> All PCs on the network are simple clients. There is no NAT or anything
> fancy here. I don't know if a "dhcp relay daemon is running", how
> would I find out? The reason I thought this would work is, I did try
> an iptables command that caused the problem computer to obtain the
> correct IP address when I renewed the DHCP lease. That was a
> broad-brush solution, though, because I also lost all Zeroconf
> broadcasting. So I thought I needed to focus the blockage more.

If you didn't setup a DHCP relay, you don't have one (I doubt the devices
you mention would have such a beast)

> I don't know if the WRT can run plugged into the modem with the WAN
> port. if that would allow DHCP filtering maybe that is a solution.

If you have the dsl modem plugged in to the wan port on one of the wrts, the
dhcp traffic would stay on the lan side of the wrt.  This is what the wrt
was designed to do.

If your dsl modem (being that it is also a router) is more limited than the
wrt, I'd recommend setting the dsl modem to bridged mode (if it's not
already) and use one of the other routers for your network.  This is the
same basic setup that I have at home.

I have a dsl modem/router in bridged mode, a dedicated computer as the
fireall/nat/router and the rest of my network goes through it.

> Thanks for all the ideas, I hope I'm on the right track.
> 
> -- Gnarlie
> 
> 
> On 7/16/07, Wakko Warner wrote:
> >Please keep list mail on the list.
> >
> >Gnarlodious wrote:
> >> On 7/16/07, Wakko Warner wrote:
> >> >Gnarlodious wrote:
> >> >> I would need to have another
> >> >> device on the UPS battery. I want to have only two devices taking
> >> >> power from the UPS battery, the modem and the server.
> >> >
> >> >A diagram might be more helpful.
> >> http://etc.Gnarlodious.com/Images/Lan1.png
> >
> >So you have a dsl connection with 3 computers and a wireless router
> >connected directly to it.  I would assume that you want to keep those 3
> >computers from getting an IP via DHCP from the dsl modem?  From the
> >networking perspective, unless the ups is actually networked, has nothing 
> >to
> >do with the network.  (Personally, I would assign a static IP to the UPS).
> >
> >Does the DSL modem have a built in hub?
> >
> >From the AP1 you have 2 PCs and another wireless router.  Are these getting
> >their IP from AP1?
> >
> >From AP2 you have 2 PCs and nothing else.  Since I don't know the 
> >interfaces
> >on the AP devices, I don't know if they are routing traffic or switching
> >traffic.
> >
> >I guess the real question is, does the 4 devices connected (according to
> >your diagram) directly to your DSL modem have non-private IPs?
> >(private IP ranges: http://tools.ietf.org/html/rfc1918 section 3).
> >
> >> >DHCP is broadcast when one requests an IP.  That's why it's 
> >D(ynamic)HCP.
> >> OK, I'm starting to understand that what I want can't be done.
> >>
> >> >The best way I can think of is to have a system (computer, router,
> >whatever
> >> >running linux) with 2 bridged interfaces and block DHCP traffic going
> >> >across
> >> >the bridge.
> >> Any page that explains how to set that up? I'm not a network pro...
> >
> >The man page for ebtables and brctl.  You'll need a linux kernel with
> >bridging (802.1d support), ebtables enabled (Personaly, I just enable all
> >the netfilter modules and let the system decide at runtime which onces to
> >load), the drivers for 2 nics (I used 3c905b cards on a celeron 600 pc,
> >throughput is around 8-9mb/sec).
> >
> >> And thanks for the hint about ebtables.
> >
> >You could probably do it with iptables on a bridging interface, but 
> >ebtables
> >might be easier.
> >
> >--
> > Lab tests show that use of micro$oft causes cancer in lab animals
> > Got Gas???
> >
> 
-- 
 Lab tests show that use of micro$oft causes cancer in lab animals
 Got Gas???

