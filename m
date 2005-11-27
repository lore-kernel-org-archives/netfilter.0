From: Leon Stringer <leon.stringer@ntlworld.com>
Subject: Re: Firewall only/bridging set up
Date: Sun, 27 Nov 2005 21:12:21 +0000
Message-ID: <1133125941.3039.18.camel@localhost.localdomain>
References: <1133121850.3039.16.camel@localhost.localdomain>
	<9255886c0511271222t3b0d9adbi3cd7997cbe93221d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9255886c0511271222t3b0d9adbi3cd7997cbe93221d@mail.gmail.com>
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
To: Sp0oKeR <spooker@gmail.com>
Cc: netfilter@lists.netfilter.org

Thanks SpOoKeR, that answers my question. I'll read up on it.

On Sun, 2005-11-27 at 18:22 -0200, Sp0oKeR wrote:
> Try ebtables instead of iptables
> 
> 
> What is ebtables?
> 
> The ebtables program is a filtering tool for a bridging firewall. The
> filtering is focussed on the Link Layer Ethernet frame fields. Apart
> from filtering, it also gives the ability to alter the Ethernet MAC
> addresses and implement a brouter.
> This website is also a reference for the Linux bridge-nf code, which
> gives Linux the functionality of a bridging IP/IPv6/ARP firewall, by
> letting iptables/ip6tables/arptables 'see' the bridged IPv4/IPv6/ARP
> packets.
> Both ebtables and bridge-nf are a part of the standard 2.6 kernel. A
> patch for the 2.4 stable kernel is maintained here, because enough
> people keep bugging me when Marcelo releases yet another 2.4 kernel.
> 
> http://ebtables.sourceforge.net/
> 
> Regards,
> 
> Sp0oKeR
> 
> On 11/27/05, Leon Stringer <leon.stringer@ntlworld.com> wrote:
> > Hi,
> >
> > I've been using iptables as a firewalling router for a year and it's
> > worked brilliantly.
> >
> > (O/T: It went into service after the Cisco-qualified engineers failed to
> > get their Cisco kit to meet our modest requirements!).
> >
> > I now have a new requirement for just a firewall, i.e. no routing.
> >
> > So the LAN will connect to one NIC and the other NIC will connect to the
> > ISP router.
> >
> > So I assume that this will require a "virtual" bridge device to be set
> > up. And I've read that this isn't straightforward to get iptables to
> > work in this configuration.
> >
> > So my question is: as an existing iptables user, should I be able to set
> > up a box for firewalling only as described?
> >
> > If so, is there any (good!) documentation on this?
> >
> > Or would I be better off with a firewall "appliance"?
> >
> > Thanks in advance for any advice,
> >
> > Leon...


