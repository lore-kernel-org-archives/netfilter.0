From: Julian Hagenauer <chaosbringer@gmx.de>
Subject: Re: Two identical ips connected
Date: Mon, 16 Oct 2006 12:02:11 +0200
Message-ID: <20061016120211.6ab1d49b@vmm1.chaosbringer.de>
References: <20061016095557.058bbde3@vmm1.chaosbringer.de>
	<49542.193.173.147.3.1160991666.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <49542.193.173.147.3.1160991666.squirrel@webmail.sterenborg.info>
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
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@lists.netfilter.org

Hi

> If you packet would make it to the router and the router had this configuration:
> - eth0: 192.168.1.0/24
> - eth1: 192.168.1.0/24
> the router cannot distinguish the subnets.
> 

Why so complicated.
eth0: 192.168.1.4
eth1: 192.168.1.4

(Hostbased routing) would be enough. Sure the router can not distinguish between the IPs, but he could distinguish between the MACs, so would it be possible to do Masquerading based on MAC-Adresses?

> But you'd not even get that far.
> When you send a packet from a client to the server and this server has same IP
> as the client (thus src and dst IP are the same), then the packet wouldn't
> even make it to the router: it would be sent to itself.

Mhm, i don't understand that. Let me explain my setup in greater detail:

	Server1---------|
			|
			|
			|
	Server2-------Router-------Client
			|
			|
			DB

I want that Server 1 and Server2 have the same IP, although only Server1 should be accessible for clients.
The reason for that is, that i want do some kind of load-balancing.
The problem is, that both Servers need permanent access to the db, so the router should somehow translate/masquerade the ip of the server2, so that both servers can access the db at the same time.

I know it sound weird :-)

Sincerely,
Julian

