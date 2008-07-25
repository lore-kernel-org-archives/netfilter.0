From: "Barry A Rich" <barich@trisectrix.com>
Subject: RE: UDP stream load balancing across multiple uplinks
Date: Fri, 25 Jul 2008 10:19:09 -0400
Message-ID: <000001c8ee61$67e4b7a0$37ae26e0$@com>
References: <000501c8edf5$19903230$4cb09690$@com> <a43edf1b0807241837n7e6dceb4id5a16dd56c6344a9@mail.gmail.com>
Reply-To: <barich@trisectrix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <a43edf1b0807241837n7e6dceb4id5a16dd56c6344a9@mail.gmail.com>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Bonding is not required in this case. The system that receives the UDP stream does not care if the UDP packets have different source IP addresses. NAT would not be required in this case, but the ISP might drop packets if the source address does not match the uplink address.

Given those assumptions, what's the best way to load balance across the uplinks? If netfilter cannot be configured to do this, can I change ip_conntrack to ignore UDP packets?

> 
> Why would it need to be tracked?  Are you using NAT?  NAT necessarily
> must assign one public address to the outgoing connection as it
> traverses the router.  Therefore, unless all three uplinks can be
> bonded together to have the same IP address, you can not do that.
> 
> On Thu, Jul 24, 2008 at 20:23, Barry A Rich <barich@trisectrix.com> wrote:
> > I've configured a kubuntu 8.04 PC as router with one LAN interface and three
> > Internet uplinks. A UDP stream is being produced on the LAN. I'd like the
> > UPD packets from the stream to be load balanced across the uplinks.
> > Currently, the UDP stream is tracked as a single connection and all the UPD
> > packets are sent to the same uplink. What's the best way to accomplish this?
> >
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe netfilter" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >

