From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Routing Incoming and Outgoing Packets Differently
Date: Thu, 20 Jul 2006 20:34:49 +0200
Message-ID: <44BFCCC9.2070806@plouf.fr.eu.org>
References: <44BF98B9.5020101@tavve.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44BF98B9.5020101@tavve.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Jim Doble a =E9crit :
> Is there a way to use one set of routing rules for incoming packets and=
=20
> a different set of routing rules for outgoing packets?

Yes, with advanced routing.

Quote from ip manpage (http://lartc.org/manpages/ip.txt) :

    ip rule add - insert a new rule
[...]
        iif NAME
               select the incoming device to match.  If the inter-
               face  is  loopback,  the  rule only matches packets
               originating from this host.  This  means  that  you
               may  create  separate  routing tables for forwarded
               and local packets and, hence, completely  segregate
               them.
[end of quote]

So you can create an alternate routing table for locally-generated=20
packets. Incoming packets will use the default "main" routing table.

ip rule add iif lo lookup <output_table_number> prio 32765
ip route add <destination1> gw <gateway> table <output_table_number>
ip route add <destination2> dev <interface> table <output_table_number>
...

You need to have the following options enabled in your kernel to use=20
this feature.
CONFIG_IP_ADVANCED_ROUTER=3Dy
CONFIG_IP_MULTIPLE_TABLES=3Dy

