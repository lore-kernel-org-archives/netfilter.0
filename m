From: Blesson Paul <blessonpaul@softhome.net>
Subject: Re: Cable and ISDN connection
Date: Wed, 05 Feb 2003 12:47:04 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.0.9.0.20030205124413.00a0bec0@mail.SoftHome.net>
References: <5.2.0.9.0.20030205111632.00a301d0@mail.SoftHome.net>
 <5.2.0.9.0.20030205111632.00a301d0@mail.SoftHome.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200302050146.11352.netfilter@newkirk.us>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@newkirk.us, netfilter@lists.netfilter.org

But can iproute2 and iptable co exist together. What I meant is, let I used 
iproute2 to route the traffic. I also need to do SNAT of the
  packets. So I need to do SNAT as well as routing.

regards
Blesson Paul

>On Wednesday 05 February 2003 01:03 am, Blesson Paul wrote:
> > Hi
> >                  I am using NetFilter for connecting from the LAN to
> > the Internet. We have a linux server and using the NAT(SNAT) feature
> > and that linux server is the gateway. Presently we have cable
> > connection. We need to have a backup method if the cable connection
> > fails. For that we subscribed a ISDN connection.  Now these are some
> > of our  requirements
> >
> > 1)   Is it possible to have both connection(Cable and ISDN)
> > simultaneously and Netfilter diverts the traffic from the LAN through
> > both
> > ISDN            and Cable.
>
>Yes.  You might want to sit down and 'map out' what traffic would require
>the static IP (if available) and what traffic would be prioritized to
>the higher speed connection (if available)  If no preference really
>stands out, you can simply load-balance, rather than devising priorities
>for a queuing discipline.
>
> > 2)   If the above is not possible, is it possible to connect through
> > ISDN is something goes wrong with Cable connection
> >         One problem here is that, for Cable connection, we have a
> > constant IP address and for ISDN we have a dynamic address
> >
> >                  Is any of the above possible with IP Tables
>
>No, this would be iproute2, although iptables might enter into the
>picture for prioritizing connections.  Specifically the mangle
>PREROUTING chain is useful for marking or changing TOS of packets using
>different criteria than are available with routing control alone, such
>as giving certain source IP's on the LAN priority, or certain types of
>service lower priority than more speed-sensitive services.
>
>A good starting point on learning what you need is http://lartc.org ,
>Linux Advanced Routing and Traffic Control.  More specifically, for what
>you are looking at doing, the how-to sections "Routing for multiple
>uplinks/providers" and "Load balancing" will give you the general
>answers to what you want.  They are on the same 'page' of the how-to at
>http://lartc.org/howto/lartc.rpdb.multiple-links.html .  The link
>referenced at the very bottom of the page is useful as well, leading to
>a handful of kernel patches that deal with issues including the loss of
>one of the gateways, as well as a link to another how-to explicitly
>setting up such an arrangement.
>
>j
>
> > Blesson Paul,
> > Software Engineer,
> > Integrated Computing Environments Ltd,
> > Cochin Special Economic Zone,
> > Cochin - 682 030, India.
> > Tel: +91-484-2413 083(O),  +91-484-2413 096(O)
> >        +91-481-2380 893(R)

Blesson Paul,
Software Engineer,
Integrated Computing Environments Ltd,
Cochin Special Economic Zone,
Cochin - 682 030, India.
Tel: +91-484-2413 083(O),  +91-484-2413 096(O)
       +91-481-2380 893(R)



