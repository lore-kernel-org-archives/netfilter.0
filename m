From: "Barry A Rich" <barich@trisectrix.com>
Subject: RE: UDP stream load balancing across multiple uplinks
Date: Fri, 25 Jul 2008 11:10:19 -0400
Message-ID: <001901c8ee68$8da4dae0$a8ee90a0$@com>
References: <000501c8edf5$19903230$4cb09690$@com>	 <a43edf1b0807241837n7e6dceb4id5a16dd56c6344a9@mail.gmail.com>	 <000001c8ee59$6e86fee0$4b94fca0$@com> <a43edf1b0807250755s32268b93mcd3227a7f364203b@mail.gmail.com>
Reply-To: <barich@trisectrix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <a43edf1b0807250755s32268b93mcd3227a7f364203b@mail.gmail.com>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: 'Billy Crook' <billycrook@gmail.com>

My research came to the same conclusion. Conntrack tracks the UDP stream and puts all related packets to the same interface. The UDP stream shows up in /proc/net/ip_conntrack.

Unfortunately, I cannot test without loading conntrack. The UDP stream producer uses TCP connections to coordinate with the other end. The TCP connections require conntrack.

It appears my only option is to modify conntrack. Any other opinions?



> I'm not an expert in this area, but i believe the per-stream affinity
> to a given interface is because of conntrack.  You could test this
> before expending a great deal of energy by not loading conntrack, and
> seeing it it still sticks to one nic.
> 
> Sofar as dynamically bypassing a loaded module for some traffic (UDP)
> but not all, good luck.  I've never even thought of that before just
> now.
> 
> On Fri, Jul 25, 2008 at 08:22, Barry A Rich <barich@trisectrix.com> wrote:
> > Bonding is not required in this case. The system that receives the UDP
> stream does not care if the UDP packets have different source IP addresses.
> NAT would not be required in this case, but the ISP might drop packets if the
> source address does not match the uplink address.
> >
> > Given those assumptions, what's the best way to load balance across the
> uplinks? If netfilter cannot be configured to do this, can I change
> ip_conntrack to ignore UDP packets?
> >
> >>
> >> Why would it need to be tracked?  Are you using NAT?  NAT necessarily
> >> must assign one public address to the outgoing connection as it
> >> traverses the router.  Therefore, unless all three uplinks can be
> >> bonded together to have the same IP address, you can not do that.
> >>
> >> On Thu, Jul 24, 2008 at 20:23, Barry A Rich <barich@trisectrix.com> wrote:
> >> > I've configured a kubuntu 8.04 PC as router with one LAN interface and
> three
> >> > Internet uplinks. A UDP stream is being produced on the LAN. I'd like the
> >> > UPD packets from the stream to be load balanced across the uplinks.
> >> > Currently, the UDP stream is tracked as a single connection and all the
> UPD
> >> > packets are sent to the same uplink. What's the best way to accomplish
> this?

