From: rob@sterenborg.info
Subject: Re: Multiple PPTP clients behind NAT
Date: Wed, 15 Sep 2004 11:25:27 +0200 (CEST)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <33106.194.109.165.130.1095240327.squirrel@194.109.165.130>
References: <20040914091713.68587.qmail@web52508.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040914091713.68587.qmail@web52508.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

>>(Why would you use a 9 months old POM when a new one
>>is available ?)
>
> The reason for using this patch is because
> patch-o-matic-ng-20040621 said my kernel
> is too old (I donot know why, my kernel was 2.4.20-8
> which is the default kernel from RedHat 9).
>
> The reason for using kernel 2.4.26 is because we
> searched on the web and someone said using
> this kernel with this patch works.

IMHO if you have to compile a new kernel it is best use a new one with
the latest patches unlesss there is a very good reason not to.
But ; that's IMHO ;-).

> My configuration is exactly the following
>
> PPTP     |
> client1->|
>          |
> PPTP     |
> client2->|                                   |->PPTP
>          |                                   |  Server
>          |->eth1->NAT->eth0->...Internet...->|
> ... ...->|                                   |->...
>          |                                   |
> PPTP     |
> client n->|
>
> A. Private LAN: 192.168.10.0/24
> B. eth1 IP:     192.168.10.1
> C. eth0 IP:     129.94.60.128
> D. PPTP server: 129.94.133.1
> E. IPs in PPTP Server: 129.94.182.130, 129.94.182.131
> (These IPs cannot be accessed without VPN)
> F. All clients in private LAN are windows or Mac
> machines. After the VPN is setup, they will be
> assigned with IP addresses of 129.94.165.3 and
> 129.94.165.4
> G. The PPTP Server is not firewalled
>
> The problem is decribed as following:
> 1. I setup one connection from client 1 to the PPTP
> server, then I tried to test the connection by ping
> either 129.94.182.130 or 129.94.182.131. It is
> working.
> 2. I setup the other connection from client 2 to the
> same PPTP server. Then two cases will happen:
>    a) if the client 1 keep pinging (a MAC), the
> connection will fail;
>    b) if client 1 stop pinging, the connection can be
> established.
> 3. After the second connection is setup. Client 2 can
> ping, client 1 cannot ping any more, but the status
> shows that the connection is still there.

Sounds like conntrack is not working because then only 1 client would
be able to connect to the PPTP server.

Are you sure the following are loaded :
ip_conntrack_proto_gre
ip_nat_proto_gre
ip_conntrack_pptp
ip_nat_pptp

You also create logging rules on the firewall to see what is going on.
And you could check on the PPTP server if your ping arrives.


Gr,
Rob



