From: "Stanislav Puffler DiS." <stanislav.puffler@seznam.cz>
Subject: RE: tcp packets on 25 port FORWARDING
Date: Fri, 12 Mar 2004 11:47:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1B1kC2-0004Ll-07@vishnu.netfilter.org>
References: <200403120957.16154.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403120957.16154.Antony@Soft-Solutions.co.uk>
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

My mistake, have this written with --dport and --state. But still =
doesn=B4t
work. Here are my rulesets for table nat :

Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination        =20
DNAT       tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:25
to:192.168.200.2:25=20
REDIRECT   tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:80 =
redir
ports 3128=20
DROP       all  --  192.168.0.0/16       0.0.0.0/0         =20
DROP       all  --  172.16.0.0/12        0.0.0.0/0         =20
DROP       all  --  10.0.0.0/8           0.0.0.0/0         =20

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination        =20
MASQUERADE  all  --  0.0.0.0/0            0.0.0.0/0         =20

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         =20


And for filtering :


Chain INPUT (policy DROP)
target     prot opt source               destination        =20
tcp_segmenty  tcp  --  0.0.0.0/0            0.0.0.0/0         =20
udp_pakety  udp  --  0.0.0.0/0            0.0.0.0/0         =20
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0          icmp type 0=20
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0          icmp type 3=20
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0          icmp type 8=20
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0          icmp type 11 =

ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0         =20
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0         =20
REJECT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:113
reject-with icmp-port-unreachable=20
spoofing   all  --  0.0.0.0/0            0.0.0.0/0         =20
syn_flood  tcp  --  0.0.0.0/0            0.0.0.0/0          tcp
flags:0x16/0x02=20
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0          icmp type 8
limit: avg 1/sec burst 5=20
ACCEPT     all  --  80.95.96.7           0.0.0.0/0         =20
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0         =20
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0         =20
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0         =20

Chain FORWARD (policy DROP)
target     prot opt source               destination        =20
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0         =20
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0         =20
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0          state
RELATED,ESTABLISHED=20
ACCEPT     tcp  --  0.0.0.0/0            192.168.200.2      tcp dpt:25 =
state
NEW,RELATED,ESTABLISHED=20
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0          state
RELATED,ESTABLISHED=20
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0         =20
spoofing   all  --  0.0.0.0/0            0.0.0.0/0         =20

Chain OUTPUT (policy DROP)
target     prot opt source               destination        =20
ACCEPT     all  --  127.0.0.1            0.0.0.0/0         =20
ACCEPT     all  --  192.168.0.1          0.0.0.0/0         =20
ACCEPT     all  --  192.168.200.1        0.0.0.0/0         =20
ACCEPT     all  --  82.142.67.253        0.0.0.0/0         =20

Chain spoofing (2 references)
target     prot opt source               destination        =20
DROP       all  --  192.168.0.0/16       0.0.0.0/0         =20
DROP       all  --  172.16.0.0/12        0.0.0.0/0         =20
DROP       all  --  10.0.0.0/8           0.0.0.0/0         =20

Chain syn_flood (1 references)
target     prot opt source               destination        =20
RETURN     all  --  0.0.0.0/0            0.0.0.0/0          limit: avg =
1/sec
burst 5=20
DROP       all  --  0.0.0.0/0            0.0.0.0/0         =20

Chain tcp_segmenty (1 references)
target     prot opt source               destination        =20
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:25=20
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:80=20

Chain udp_pakety (1 references)
target     prot opt source               destination        =20
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0          udp dpt:53

Will try the help from Peter Gehle also, if it will run. Thanks...
Stan

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
Sent: Friday, March 12, 2004 10:57 AM
To: netfilter@lists.netfilter.org
Subject: Re: tcp packets on 25 port FORWARDING

On Friday 12 March 2004 9:46 am, Stanislav Puffler DiS. wrote:

> Hi there,
>
> I need to forward all tcp packets with port 25 (SMTP) from Internet to
> machine in my network. My settings (eth0 =3D internet IP, eth1 =3D
> 192.168.200.1 - dmz IP connected to another machine with Postfix, eth2 =
=3D
> 192.168.0.1 - gateway - LAN). Have opened port 25 and setup rule :
>
> iptables -t nat -A PREROUTING -p tcp -dport 25 - i eth0 -j DNAT -to
> 192.168.200.2:85

That should be "--dport", not "-dport", and why are you changing the=20
destination port number to 85?   Is Postfix listening on port 25?

> iptables -A FORWARD -i eth0 -p tcp -d 192:168.200.2 -dport 25 -m state
> -state NEW,ESTABLISHED,RELATED -j ACCEPT

That should also read "--dport", not "-dport", also "--state", not =
"-state".

If you have typed out your rules in this email and made some mistakes, =
then=20
please *cut and paste* your ruleset so we really know what is running.

Regards,

Antony.

--=20
Ramdisk is not an installation procedure.

                                                     Please reply to the
list;
                                                           please don't =
CC
me.




