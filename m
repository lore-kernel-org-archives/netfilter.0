From: "Marco Nicoloso" <nicolm@gmail.com>
Subject: Re: Cannot go out the firewall
Date: Thu, 26 Oct 2006 13:55:39 +0400
Message-ID: <e8c943190610260255o8496543w731c103623050d10@mail.gmail.com>
References: <e8c943190610260223r232897fdi1aa4ed3e6d1a98b8@mail.gmail.com>
	<454082CB.4070805@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <454082CB.4070805@freemail.hu>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Cc: netfilter@lists.netfilter.org

2006/10/26, G=E1sp=E1r Lajos <swifty@freemail.hu>:
> Would you please post the output of these commands?

Immediately

> iptables -vnL

    0     0 DROP       all  -f  *      *       0.0.0.0/0            0.0.0.0=
/0
    0     0 DROP       all  --  *      *       0.0.0.0/0
0.0.0.0/0           state INVALID
    0     0 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0=
/0
    8   528 ACCEPT     all  --  eth1   *       0.0.0.0/0            0.0.0.0=
/0
    0     0 ACCEPT     all  --  eth0   *       0.0.0.0/0
0.0.0.0/0           state RELATED,ESTABLISHED
    0     0 ACCEPT     udp  --  eth0   *       0.0.0.0/0
0.0.0.0/0           udp spt:53
    0     0 ACCEPT     tcp  --  eth0   *       0.0.0.0/0
0.0.0.0/0           tcp spt:53
    0     0 ACCEPT     tcp  --  eth1   *       0.0.0.0/0
0.0.0.0/0           tcp dpt:3128
    0     0 ACCEPT     tcp  --  eth1   *       0.0.0.0/0
0.0.0.0/0           tcp dpt:80
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           tcp dpt:22
    0     0 ACCEPT     tcp  --  eth0   *       0.0.0.0/0
0.0.0.0/0           tcp dpt:25
    0     0 ACCEPT     tcp  --  eth1   *       0.0.0.0/0
0.0.0.0/0           tcp dpt:25
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0
0.0.0.0/0           icmp type 3
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0
0.0.0.0/0           icmp type 4
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0
0.0.0.0/0           icmp type 11
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0
0.0.0.0/0           icmp type 12
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0
0.0.0.0/0           icmp type 5
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0
0.0.0.0/0           icmp type 9
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0
0.0.0.0/0           icmp type 8
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0
0.0.0.0/0           icmp type 0

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion
    0     0 laninet    all  --  eth1   eth0    0.0.0.0/0            0.0.0.0=
/0
    0     0 inetlan    all  --  eth0   eth1    0.0.0.0/0            0.0.0.0=
/0

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion
    0     0 DROP       all  -f  *      *       0.0.0.0/0            0.0.0.0=
/0
    0     0 DROP       all  --  *      *       0.0.0.0/0
0.0.0.0/0           state INVALID
    0     0 ACCEPT     all  --  *      lo      0.0.0.0/0            0.0.0.0=
/0
    5   540 ACCEPT     all  --  *      eth1    0.0.0.0/0            0.0.0.0=
/0
    0     0 ACCEPT     all  --  *      eth0    0.0.0.0/0
0.0.0.0/0           state NEW,RELATED,ESTABLISHED

Chain inetlan (1 references)
 pkts bytes target     prot opt in     out     source               destina=
tion
    0     0 DROP       all  --  *      *       192.168.7.0/24       0.0.0.0=
/0
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           tcp spt:53
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0
0.0.0.0/0           udp spt:53
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0           state RELATED,ESTABLISHED
    0     0 REJECT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           reject-with tcp-reset

Chain laninet (1 references)
 pkts bytes target     prot opt in     out     source               destina=
tion
    0     0 DROP       all  --  *      *      !192.168.7.0/24       0.0.0.0=
/0
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0=
/0
> iptables -vnL -t nat
iptables: Table does not exist (do you need to insmod?)
> iptables -vnL -t mangle
iptables: Table does not exist (do you need to insmod?)

But modules iptable_nat and iptable_mangle (although, I think,
iptable_mangle is not necessary for me) are loaded.

Do I need to create table nat, or it is built-in?

> Thanx
>
> Swifty
>
>

