From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: forward udp broadcast packets on same subnet /interface with diff source
Date: Wed, 14 Jul 2004 10:03:22 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407141003.22689.Antony@Soft-Solutions.co.uk>
References: <20040714050247.94067.qmail@web90110.mail.scd.yahoo.com> <3063e5040713225778147c4d@mail.gmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3063e5040713225778147c4d@mail.gmail.com>
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

On Wednesday 14 July 2004 6:57 am, George Alexandru Dragoi wrote:

> One more thingg, you'll have to set ip_forward to 1

Won't help.   The packets addressed to 192.168.1.255 have already reached 
their destination, therefore the routing table won't forward them further 
through the netfilter machine.

Regards,

Antony.

> On Tue, 13 Jul 2004 22:02:47 -0700 (PDT), Tom Thumb
>
> <tomthumb888@yahoo.com> wrote:
> > Hi,
> >
> > Can I use iptables to forward UDP broadcast packets on
> > the same subnet and interface but just change the
> > source IP?
> >
> > That is, the forwarding machine is 192.168.1.5, with
> > mask 255.255.255.0 and has a single NIC.
> >
> > A machine with IP 192.168.1.6 with the same mask sends
> > a UDP broadcast to 192.168.1.255.
> >
> > The forwarding machine receives this packet. Can it be
> > configured to resend it out on the same interface that
> > it received it on (its only interface) and just change
> > the source IP to be a 3rd address, like 192.168.1.7,
> > but also as a UDP broadcast to 192.168.1.255?
> >
> > Is there any way to do this without adding a physical
> > NIC?  Do I need to add a "virtual" NIC to do it? How?
> >
> > Thanks

-- 
Tax inspectors are just accountants who work for the evil dictators of 
democracy.

                                                     Please reply to the list;
                                                           please don't CC me.


