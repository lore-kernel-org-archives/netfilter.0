From: Denis <denismpa@gmail.com>
Subject: Re: -j SNAT
Date: Thu, 30 Nov 2006 07:05:45 -0300
Message-ID: <e9aeeef80611300205h67a501d9rd263cbddaddbb8f4@mail.gmail.com>
References: <e9aeeef80611280916r2a6b2ba1w52b65d81a2b0416f@mail.gmail.com>
	<e9aeeef80611280920n4cde4f1bj469a15688e28cee2@mail.gmail.com>
	<456D2294.3020002@hostway.com>
	<e9aeeef80611290525v713b0003y68b033248305e6f8@mail.gmail.com>
	<456D943D.7090307@hostway.com>
	<e9aeeef80611290846n1d968a5ci16b7d03fafb033ef@mail.gmail.com>
	<456E73B3.8050008@hostway.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <456E73B3.8050008@hostway.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Ok Danny, but the problem is ocurring to the another side of the connection.

From proxy to ssl on internet. Cause one single connect arrives from
to ips (the valid nodes ips)

------------------------------
| bank site              |
------------------------------
 |200.x.x.x2  | 200.x.x.x1
----------    ----------
|node1|   |Node2|
----------   -----------
|172.16.x.x    |172.16.x.x


clients

from proxy to my clients its all ok!

2006/11/30, Danny <dineshg@hostway.com>:
> Hi Denis !
>
> Yes ! indeed I agree that the requests are replied by the real server
> directly.
> If you do a tcpdump on any of the real server, you would see that the
> response would be from the fake IP [ which is a virtual IP ]
>
>
>
> - Danny
>
> Denis wrote:
> > Hey Danny!
> >
> > My lvs topology is like this:
> >
> > http://www.ultramonkey.org/3/topologies/sl-ha-lb-eg.html, using
> > "direct routing"
> >
> >
> >
> > Direct Routing: Packets from end users are forwarded directly to the
> > real server. The IP packet is not modified, so the real servers must
> > be configured to accept traffic for the virtual server's IP address.
> > This can be done using a dummy interface, or packet filtering to
> > redirect traffic addressed to the virtual server's IP address to a
> > local port. The real server may send replies directly back to the end
> > user. That is if a host based layer 4 switch is used, it may not be in
> > the return path.
> >
> >
> > So, my clients works connecting to the virtual server IP.
> >
> > The problem occurs when my servers go get the information accross the
> > internet.
>
>

