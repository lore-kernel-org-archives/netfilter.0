From: "Stanislav Puffler DiS." <stanislav.puffler@seznam.cz>
Subject: RE: ping to internet hosta through NameServer of provider
Date: Wed, 10 Mar 2004 11:22:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1B10qN-0003HJ-9V@vishnu.netfilter.org>
References: <200403091322.50154.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403091322.50154.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org


Apologize, these are my rulesets. As for pinging internet hosts, it is
working corectly now (after accepting packets from ISP NameServer). But =
the
only one problem is, that there are still logs in shell prompt and i am =
not
typing anything...

iptables -L -nv

Chain INPUT (policy DROP 59 packets, 6498 bytes)
 pkts bytes target     prot opt in     out     source
destination        =20
   18   868 tcp_segmenty  tcp  --  eth0   *       0.0.0.0/0
0.0.0.0/0         =20
   43  5995 udp_pakety  udp  --  eth0   *       0.0.0.0/0
0.0.0.0/0         =20
   33  2772 ACCEPT     icmp --  eth0   *       0.0.0.0/0
0.0.0.0/0          icmp type 0=20
    0     0 ACCEPT     icmp --  eth0   *       0.0.0.0/0
0.0.0.0/0          icmp type 3=20
    1    92 ACCEPT     icmp --  eth0   *       0.0.0.0/0
0.0.0.0/0          icmp type 8=20
    0     0 ACCEPT     icmp --  eth0   *       0.0.0.0/0
0.0.0.0/0          icmp type 11=20
    9   756 ACCEPT     all  --  eth1   *       0.0.0.0/0
0.0.0.0/0         =20
 3168  435K ACCEPT     all  --  eth2   *       0.0.0.0/0
0.0.0.0/0         =20
  131 11622 ACCEPT     all  --  lo     *       0.0.0.0/0
0.0.0.0/0         =20
    0     0 REJECT     tcp  --  eth0   *       0.0.0.0/0
0.0.0.0/0          tcp dpt:113 reject-with icmp-port-unreachable=20
   56  6568 spoofing   all  --  eth0   *       0.0.0.0/0
0.0.0.0/0         =20
   56  6568 spoofing   all  --  eth0   *       0.0.0.0/0
0.0.0.0/0         =20
   20  2396 LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0          limit: avg 3/hour burst 5 LOG flags 0 level 4=20
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0
0.0.0.0/0          icmp type 8 limit: avg 1/sec burst 5=20
    0     0 ACCEPT     all  --  eth1   *       0.0.0.0/0
0.0.0.0/0         =20
    0     0 ACCEPT     all  --  eth2   *       0.0.0.0/0
0.0.0.0/0         =20
   36  5139 ACCEPT     all  --  eth0   *       80.95.96.7
0.0.0.0/0         =20
    4   192 LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0          LOG flags 0 level 4=20

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination        =20
    0     0 ACCEPT     all  --  eth1   *       0.0.0.0/0
0.0.0.0/0         =20
    0     0 ACCEPT     all  --  eth2   *       0.0.0.0/0
0.0.0.0/0         =20
    0     0 ACCEPT     all  --  eth0   eth1    0.0.0.0/0
0.0.0.0/0          state RELATED,ESTABLISHED=20
    0     0 ACCEPT     all  --  eth2   *       0.0.0.0/0
0.0.0.0/0         =20
    0     0 ACCEPT     all  --  eth1   eth2    0.0.0.0/0
0.0.0.0/0         =20
    0     0 ACCEPT     all  --  eth2   eth1    0.0.0.0/0
0.0.0.0/0         =20
    0     0 ACCEPT     all  --  eth1   *       0.0.0.0/0
0.0.0.0/0         =20
    0     0 ACCEPT     all  --  eth0   eth1    0.0.0.0/0
0.0.0.0/0          state RELATED,ESTABLISHED=20
    0     0 spoofing   all  --  eth0   *       0.0.0.0/0
0.0.0.0/0         =20

Chain OUTPUT (policy DROP 30 packets, 2520 bytes)
 pkts bytes target     prot opt in     out     source
destination        =20
   34  2728 ACCEPT     all  --  *      *       127.0.0.1
0.0.0.0/0         =20
    0     0 ACCEPT     all  --  *      *       192.168.0.201
0.0.0.0/0         =20
  145 13870 ACCEPT     all  --  *      *       192.168.0.1
0.0.0.0/0         =20
   97  7286 ACCEPT     all  --  *      *       82.142.67.253
0.0.0.0/0         =20
    0     0 ACCEPT     all  --  *      *       127.0.0.1
0.0.0.0/0         =20
    0     0 ACCEPT     all  --  *      *       192.168.0.1
0.0.0.0/0         =20
   53  4452 ACCEPT     all  --  *      *       192.168.200.1
0.0.0.0/0         =20
    0     0 ACCEPT     all  --  *      *       80.95.96.7
0.0.0.0/0         =20

Chain spoofing (3 references)
 pkts bytes target     prot opt in     out     source
destination        =20
    0     0 DROP       all  --  *      *       192.168.0.0/16
0.0.0.0/0         =20
    0     0 DROP       all  --  *      *       172.16.0.0/12
0.0.0.0/0         =20
    0     0 DROP       all  --  *      *       10.0.0.0/8
0.0.0.0/0         =20

Chain syn_flood (0 references)
 pkts bytes target     prot opt in     out     source
destination        =20
    0     0 RETURN     all  --  *      *       0.0.0.0/0
0.0.0.0/0          limit: avg 1/sec burst 5=20
    0     0 DROP       all  --  *      *       0.0.0.0/0
0.0.0.0/0         =20

Chain tcp_segmenty (1 references)
 pkts bytes target     prot opt in     out     source
destination        =20
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0          tcp dpt:25=20

Chain udp_pakety (1 references)
 pkts bytes target     prot opt in     out     source
destination        =20
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0
0.0.0.0/0          udp dpt:53 =20

iptables -L -t nat -nv

Chain PREROUTING (policy ACCEPT 3084 packets, 395K bytes)
 pkts bytes target     prot opt in     out     source
destination        =20
    0     0 REDIRECT   tcp  --  eth2   *       0.0.0.0/0
0.0.0.0/0          tcp dpt:80 redir ports 3128=20
    0     0 DROP       all  --  eth0   *       192.168.0.0/16
0.0.0.0/0         =20
    0     0 DROP       all  --  eth0   *       172.16.0.0/12
0.0.0.0/0         =20
    0     0 DROP       all  --  eth0   *       10.0.0.0/8
0.0.0.0/0         =20

Chain POSTROUTING (policy ACCEPT 80 packets, 6594 bytes)
 pkts bytes target     prot opt in     out     source
destination        =20
   39  3035 MASQUERADE  all  --  *      eth0    0.0.0.0/0
0.0.0.0/0         =20

Chain OUTPUT (policy ACCEPT 149 packets, 12149 bytes)
 pkts bytes target     prot opt in     out     source
destination


Thanks in advance,
Stanley.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
Sent: Tuesday, March 09, 2004 2:23 PM
To: netfilter@lists.netfilter.org
Subject: Re: ping to internet hosta through NameServer of provider

On Tuesday 09 March 2004 1:00 pm, Stanislav Puffler DiS. wrote:

> It seems like anything you=B4ve described. Here is the ruleset :
>
> iptables -L -nv

<snip>

If this is your ruleset, where is the LOG rule which produced the output =
you

posted earlier?

> > IN=3Deth0 OUT=3D MAC=3D.............. =
SRC=3D"my_providers_nameserver_ip"
> > DST=3D"ip_on_my_eth0" LEN=3D127 TOS=3D0x00 PREC=3D0x00 TTL=3D61 =
ID=3D3268 DF
> > PROTO=3DUDP SPT=3D53 DPT=3D32792 LEN=3D107

Antony.

--=20
People who use Microsoft software should be certified.

                                                     Please reply to the
list;
                                                           please don't =
CC
me.




