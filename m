From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Two identical ips connected
Date: Thu, 26 Oct 2006 11:47:23 -0400 (EDT)
Message-ID: <Pine.LNX.4.64.0610261145440.15161@darkstar.sysinfo.com>
References: <20061016095557.058bbde3@vmm1.chaosbringer.de>
	<49542.193.173.147.3.1160991666.squirrel@webmail.sterenborg.info>
	<20061016120211.6ab1d49b@vmm1.chaosbringer.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20061016120211.6ab1d49b@vmm1.chaosbringer.de>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Julian Hagenauer <chaosbringer@gmx.de>
Cc: Rob Sterenborg <rob@sterenborg.info>, netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Mon, 16 Oct 2006, Julian Hagenauer wrote:

> Hi
>
>> If you packet would make it to the router and the router had this configuration:
>> - eth0: 192.168.1.0/24
>> - eth1: 192.168.1.0/24
>> the router cannot distinguish the subnets.
>>
>
> Why so complicated.
> eth0: 192.168.1.4
> eth1: 192.168.1.4
>
> (Hostbased routing) would be enough. Sure the router can not distinguish between the IPs, but he could distinguish between the MACs, so would it be possible to do Masquerading based on MAC-Adresses?
>
>> But you'd not even get that far.
>> When you send a packet from a client to the server and this server has same IP
>> as the client (thus src and dst IP are the same), then the packet wouldn't
>> even make it to the router: it would be sent to itself.
>
> Mhm, i don't understand that. Let me explain my setup in greater detail:
>
> 	Server1---------|
> 			|
> 			|
> 			|
> 	Server2-------Router-------Client
> 			|
> 			|
> 			DB
>
> I want that Server 1 and Server2 have the same IP, although only Server1 should be accessible for clients.
> The reason for that is, that i want do some kind of load-balancing.
> The problem is, that both Servers need permanent access to the db, so the router should somehow translate/masquerade the ip of the server2, so that both servers can access the db at the same time.


The VIP goes on the load balancer, the servers behind it have distict 
IP's, then your setup would work.  But, you are going to have to obtain or 
setup a server in front of the two servers to do the load balancing bhind 
to those servers.

Thanks,

Ron DuFresne
- -- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         admin & senior security consultant:  sysinfo.com
                         http://sysinfo.com
Key fingerprint = 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629

...We waste time looking for the perfect lover
instead of creating the perfect love.

                 -Tom Robbins <Still Life With Woodpecker>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQFFQNiOst+vzJSwZikRAqyCAJ0bGx/8bMaxjyb/ISS5cKWWJbcGzACfQb0H
aMXNMR0g+jdCUe9IGQ+HBlM=
=KJJA
-----END PGP SIGNATURE-----

