From: "Klemen Kecman" <klemen@sting.si>
Subject: Re: netfilter question
Date: Thu, 19 Feb 2004 09:19:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <008301c3f6c1$1cbceb90$6a02a8c0@klemen>
References: <004f01c3f699$0ad70a00$ed02fea9@black>
Reply-To: "Klemen Kecman" <klemen@sting.si>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org
Cc: John Black <black@arbbs.net>

For dynamic IP (ADSL)
$IPT -t nat -A POSTROUTING -o $IF_INET -j MASQUERADE

and for static IP (Cable)
$IPT -A POSTROUTING -t nat -s $IP_LAN_RNG -o $IF_NET -j SNAT --to-source
$IP_NET


That is for routing. If you want to secure your network and the router
itselfe it takes alot more .. like setting up a firewall :)

Klemen Kecman
Sting d.o.o.
Smartinska 106
1000 Ljubljana - SI
+386 1 5246033
+386 41 456421

----- Original Message -----
From: "John Black" <black@arbbs.net>
To: <netfilter@lists.netfilter.org>
Sent: Thursday, February 19, 2004 4:32 AM
Subject: netfilter question


> I'm trying to install a gateway/router with Red Hat 9 kernel 2.4.24 and
the
> stock
> iptables 1.2.7a, with full NAT compiled into the kernel. I have read the
> howto
> at netfilter.org, even have the same line of code.  But it sill will not
> change
> the source address.
>
> here is the line of code and the result of the command <iptables -L -nvx>
>
> iptables -A FORWARD -i eth0 -o eth1 -m state --state ESTABLISHED,
RELATED -j
> ACCEPT
> iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
> iptables -A FORWARD -j LOG
>
> Chain INPUT (policy ACCEPT 127 packets, 9436 bytes)
> pkts  bytes target  prot opt in   out   source   destination
>
>
> Chain FORWARD (policy ACCEPT 36 packets, 1709 bytes)
> pkts     bytes target      prot opt    in    out     source
> destination
>  0       0    ACCEPT   all     --    eth0  eth1   0.0.0.0/0    0.0.0.0/0
> state RELATED, ESTABLISHED
>
>  0       0    ACCEPT   all     --    eth1  eth0   0.0.0.0/0    0.0.0.0/0
>
>  0       0    ACCEPT   all     --    *        *      0.0.0.0/0
0.0.0.0/0
> LOG flags 0 level 4
>
> Chain OUTPUT (policy ACCEPT 74 packets, 8568 bytes)
> pkts  bytes target  prot opt in   out   source   destination
>
>
> I new to security of a network. Am I close?
>
> thanks
> john
>
>
>
>


