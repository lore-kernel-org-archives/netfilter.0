From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: AW: bootp problems
Date: Wed, 7 Apr 2004 10:29:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404071029.32757.Antony@Soft-Solutions.co.uk>
References: <D3DD55FDB74AD511BA5100500416368053E843@ORION>
Reply-To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <D3DD55FDB74AD511BA5100500416368053E843@ORION>
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

On Wednesday 07 April 2004 8:50 am, Jochen Vogel wrote:

> > > [DialIn]2.2.2.2----2.2.2.1[FW]1.1.1.1---1.1.1.2[DHCP]
> > >
> > > the DialIn tries to get an IP from the DHCP Server.
> >
> > You need a DHCP relay on the 2 network to do this.
> >
> > DHCP requests do not cross routers (they are ethernet broadcasts).
>
> Hi antony,
>
> The DialIN should play Relay
>
> FIRST the DialIn try it DIRECTLY to the DHCP Server
> with tcpdump on 2.1 i can see 0.0.0.0:68 > 1.1.1.2:67
> It doesnt work and i CANT see any entry in the iptables log

How is Linux supposed to route a reply packet from 1.1.1.2:67 back to 
0.0.0.0:68?

> SECOND the DialIn try it with BROADCAST
> with tcpdump on 2.1 i can see 0.0.0.0:68 > 255.255.255.255:67
> It doesnt work and i CAN see an entry in the iptables log

Broadcasts do not cross routers.   That is nothing to do with netfilter (and 
no, you cannot create any netfilter rules to make a broadcast cross to the 
other side).

Maybe your firewall needs to be a bridge?

Regards,

Antony.

-- 
Christmas was just an opportunity to upgrade to kernel 2.6 while no-one was 
around to notice the downtime.

                                                     Please reply to the list;
                                                           please don't CC me.


