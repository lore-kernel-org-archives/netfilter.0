From: "Maxime Ducharme" <mducharme@cybergeneration.com>
Subject: Re: Max Concurrent Session
Date: Wed, 15 Dec 2004 10:20:50 -0500
Message-ID: <074d01c4e2b9$a90aa210$b000a8c0@cybergeneration.com>
References: <1102705899.4516.50.camel@JOKER.INFOWORLD.CL>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: amador@puc.cl, NetFilter Users <netfilter@lists.netfilter.org>


Hi Miguel
    we run iptables 1.2.9 on a Dell PowerEdge 750.

It protects 128 IPs adresses which host many Internet
services (www, mail, ftp, ssl, ssh, ...).

Current connections are above 2000 :
[root@Cerberux root]# cat /proc/net/ip_conntrack |wc -l
   2168

Current load :
[root@Cerberux root]# uptime
 10:10:24  up 156 days, 21:54,  1 user,  load average: 0.00, 0.00, 0.00

About 250 mos of RAM is used.

Maximum connections is set here :
[root@Cerberux root]# cat /proc/sys/net/ipv4/ip_conntrack_max
16368


This value may be set higher but ensure you have enough RAM.

The higher value I ever seen is 5000 (happens when many worms
scan our network concurrently), and we didnt noticed any network
slowdown.

Have a nice day

Maxime Ducharme
Programmeur / Sp=E9cialiste en s=E9curit=E9 r=E9seau

----- Original Message -----=20
From: "Miguel Angel Amador L" <amador@puc.cl>
To: "NetFilter Users" <netfilter@lists.netfilter.org>
Sent: Friday, December 10, 2004 2:11 PM
Subject: Max Concurrent Session


> Hi All
>  I need implement a firewall that support 2000 concurrent sessions, it
> is posible with Iptables/Netfiler ??
>  What need to do?
>
> Thanks for all
>
> regards
>  Miguel Angel Amador L.
>


