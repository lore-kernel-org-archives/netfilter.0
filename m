From: "Matthew G. Marsh" <mgm@paktronix.com>
Subject: Re: IP TOS based routing
Date: Tue, 1 Apr 2003 13:36:20 -0600 (CST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0304011334001.22000@netmonster.pakint.net>
References: <3E80187B.5030209@cs.helsinki.fi> <200303261316.35019.kimj@dawn.dk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200303261316.35019.kimj@dawn.dk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kim Jensen <kimj@dawn.dk>
Cc: Simone Leggio <simone.leggio@cs.helsinki.fi>, netfilter@lists.netfilter.org

On Wed, 26 Mar 2003, Kim Jensen wrote:

> On Tuesday 25 March 2003 09:51, Simone Leggio wrote:
> > Hi all,
> >
> > I have to send prioritised traffic from host A to host B.
> >
> > The priority 1 is identified by an IP TOS value of, say 46.
> > The priority 2 is identified by an IP TOS value of, say 26.
> >
> > In my network topology, there are two possible routes from host A to
> > host B, one through host A's network interface eth0 and the other one
> > through eth1.
> >
> > I'd like to know whether it is possible, and if so how, with traffic
> > control to set filters so that packets with TOS 46 are sent to host B
> > via eth0 and packets with TOS 26 via eth1.

ip route add default tos 0x46 dev eth0
ip route add default tos 0x26 dev eth1

Assuming that your TOS values are in Hex. Note also that this will only
work for local hop (direct connect) packets. In order to route the TOS
then you use:

ip route add default tos 0x46 via 1.1.1.1 src 2.2.2.2

with appropriate IP addrs.

> > Note that the destination address for all the packets is the same, what
> > I need is just to route through different interfaces to the same
> > destination.
> >
> Hi Simone,
>
> Try to use the mangle table to mark your packets which match a specific TOS,
> and then add a second routing table with the alternative default connection.
> That should work. You can find more info on:
>
> http://linux-ip.net/html/adv-multi-internet.html
> http://www.ssi.bg/~ja/nano.txt
>
> /Kim
>
>

--------------------------------------------------
Matthew G. Marsh,  President
Paktronix Systems LLC
1506 North 59th Street
Omaha  NE  68104
Phone: (402) 553-2288
Email: mgm@paktronix.com
WWW:  http://www.paktronix.com
--------------------------------------------------

