From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Two identical ips connected
Date: Mon, 16 Oct 2006 11:41:06 +0200 (CEST)
Message-ID: <49542.193.173.147.3.1160991666.squirrel@webmail.sterenborg.info>
References: <20061016095557.058bbde3@vmm1.chaosbringer.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20061016095557.058bbde3@vmm1.chaosbringer.de>
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
To: netfilter@lists.netfilter.org


On Mon, October 16, 2006 09:55, Julian Hagenauer wrote:
> Hi,
> is it possible somehow possible to attach two computers with the same i=
p to a
> router, and let the router rewrite/masquerade the ip of one of those co=
mputers
> with iptables, so that both could be accessed with different ips?

I don't think you can.

> Can you give my some hints how this could be achieved?

If you packet would make it to the router and the router had this configu=
ration:
- eth0: 192.168.1.0/24
- eth1: 192.168.1.0/24
the router cannot distinguish the subnets.

But you'd not even get that far.
When you send a packet from a client to the server and this server has sa=
me IP
as the client (thus src and dst IP are the same), then the packet wouldn'=
t
even make it to the router: it would be sent to itself.


Grts,
Rob



