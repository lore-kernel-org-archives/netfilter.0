From: "Arnauts, Bert" <Bert.Arnauts@fujitsu-siemens.com>
Subject: DNAT problem /  question
Date: Fri, 18 Jun 2004 17:45:20 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <519AD2BA94FC6E4DB5DE078B2E37CB10A76BA5@PDBEX01E.pdb.fsc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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

Hello all,

I am still stuck with my DNAT. I updated the information that was
requested.
Could you please check my config, if I execute this I can not ping my
internal lan ip of this host 172.25.239.208 any more. I think this is
really wierd. I included all kinds of information, hopefully enough for
you guys to take a look at.

Cheers,

Bert

$IPTABLES -t nat -A PREROUTING -d 172.25.239.220/27 -j DNAT
--to-destination 11.0.0.16 $IPTABLES -t nat -A OUTPUT -d
172.25.239.220/27 -j DNAT --to-destination 11.0.0.16=20

$IPTABLES -A INPUT   -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A OUTPUT  -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

$IPTABLES -N RULE_0
$IPTABLES -A OUTPUT -d 11.0.0.16  -m state --state NEW  -j RULE_0
$IPTABLES -A FORWARD -d 11.0.0.16  -m state --state NEW  -j RULE_0
$IPTABLES -A RULE_0  -j LOG  --log-level info --log-prefix "RULE 0 --
ACCEPT "=20
$IPTABLES -A RULE_0  -j ACCEPT
echo 1 > /proc/sys/net/ipv4/ip_forward

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
Sent: Monday, June 14, 2004 4:51 PM
To: netfilter@lists.netfilter.org
Subject: Re: DNAT question

On Monday 14 June 2004 3:35 pm, Arnauts, Bert wrote:

> Hello all,
>
> I want to DNAT some machines in another subnet.
> The target machines have ip's like 11.0.0.x/24
>
> My available lan ip's are 172.239.239.x/27 (255.255.255.224)
>
> These are my rules. Wich are apparently not working.

How are you trying to test the rules?   What tells you they're not
working?

Where are you testing from?

I am testing from a machine that can ping the nat box'es IP and I can
access all sorts of other systems services on that subnet.
(my nat box : 172.25.239.208)

> I created virtual interfaces on eth1, one for each DNAT'ed ip.

Can you ping one of those addresses fom a machine directly connected to
eth1, qand then check the arp cache (arp -an under Linux) to be sure
that the IP / MAC address link is working correctly?

Yes I can ping these addresses. (without my iptables) With my rules it
doesn't work anymore.

> What am I missing ? Forget about normal tables stuff, I only want this

> machine to do DNAT.

What does "iptables -L -t nat -nvx" show you for the packet / byte
counters?    see below
Does it look like netfilter thinks it's doing any NAT?    yes ... I
guess. see below

I also ripped something frowm fwbuilder, adepted it a little bit .. this
is my new script.


#!/bin/bash
LSMOD=3D"/sbin/lsmod"
MODPROBE=3D"/sbin/modprobe"
IPTABLES=3D"/sbin/iptables"
LOGGER=3D"/usr/bin/logger"
echo 30 > /proc/sys/net/ipv4/tcp_fin_timeout
echo 1800 > /proc/sys/net/ipv4/tcp_keepalive_intvl

$IPTABLES -P OUTPUT ACCEPT=20
$IPTABLES -P INPUT   ACCEPT=20
$IPTABLES -P FORWARD ACCEPT=20

cat /proc/net/ip_tables_names | while read table; do
  $IPTABLES -t $table -L -n | while read c chain rest; do
      if test "X$c" =3D "XChain" ; then
        $IPTABLES -t $table -F $chain
      fi
  done
  $IPTABLES -t $table -X
done

MODULE_DIR=3D"/lib/modules/`uname -r`/kernel/net/ipv4/netfilter/"=20
MODULES=3D`(cd $MODULE_DIR; ls *_conntrack_*  *_nat_* | sed 's/\.o.*$//;
s/\.ko$//')` for module in $(echo $MODULES); do
  if $LSMOD | grep ${module} >/dev/null; then continue; fi
  $MODPROBE ${module} ||  exit 1
done

echo "Activating firewall script generated Thu Jun 10 15:03:22 2004 CEST
by root"

$IPTABLES -t nat -A PREROUTING -d 172.25.239.220/27 -j DNAT
--to-destination 11.0.0.16 $IPTABLES -t nat -A OUTPUT -d
172.25.239.220/27 -j DNAT --to-destination
11.0.0.16=20

$IPTABLES -A INPUT   -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A OUTPUT  -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

$IPTABLES -N RULE_0
$IPTABLES -A OUTPUT -d 11.0.0.16  -m state --state NEW  -j RULE_0
$IPTABLES -A FORWARD -d 11.0.0.16  -m state --state NEW  -j RULE_0
$IPTABLES -A RULE_0  -j LOG  --log-level info --log-prefix "RULE 0 --
ACCEPT "=20
$IPTABLES -A RULE_0  -j ACCEPT
echo 1 > /proc/sys/net/ipv4/ip_forward



thx Antony !
(nice quote)

--
If the human brain were so simple that we could understand it, we'd be
so simple that we couldn't.

                                                     Please reply to the
list;
                                                           please don't
CC me.

------------------------------------------------------------------------
---------------------------------------------


[root@linuxrouter root]# ifconfig -a
eth0      Link encap:Ethernet  HWaddr 00:E0:18:02:7E:9B =20
          inet addr:11.0.0.3  Bcast:11.0.0.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:4822 errors:0 dropped:0 overruns:0 frame:0
          TX packets:23 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100=20
          RX bytes:286513 (279.7 Kb)  TX bytes:6516 (6.3 Kb)
          Interrupt:5 Base address:0xd800 Memory:fb000000-fb000038=20

eth1      Link encap:Ethernet  HWaddr 00:D0:B7:E0:1F:2C =20
          inet addr:172.25.239.208  Bcast:172.25.239.223
Mask:255.255.255.224
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:7342 errors:0 dropped:0 overruns:0 frame:0
          TX packets:2091 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100=20
          RX bytes:629297 (614.5 Kb)  TX bytes:342349 (334.3 Kb)
          Interrupt:11 Base address:0xd400 Memory:fa000000-fa000038=20

eth1:1    Link encap:Ethernet  HWaddr 00:D0:B7:E0:1F:2C =20
          inet addr:172.25.239.220  Bcast:172.25.255.255
Mask:255.255.255.224
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100=20
          RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)
          Interrupt:11 Base address:0xd400 Memory:fa000000-fa000038=20

[root@linuxrouter root]# ping 11.0.0.16
PING 11.0.0.16 (11.0.0.16) 56(84) bytes of data.
64 bytes from 11.0.0.16: icmp_seq=3D1 ttl=3D128 time=3D0.261 ms


[root@linuxrouter root]# ping 172.25.239.220 PING 172.25.239.220
(172.25.239.220) 56(84) bytes of data.
64 bytes from 172.25.239.220: icmp_seq=3D1 ttl=3D128 time=3D0.264 ms


[root@linuxrouter root]# iptables -L -t nat -nvx Chain PREROUTING
(policy ACCEPT 16 packets, 3256 bytes)
    pkts      bytes target     prot opt in     out     source
destination        =20
      70    11224 DNAT       all  --  *      *       0.0.0.0/0
172.25.239.192/27  to:11.0.0.16=20

Chain POSTROUTING (policy ACCEPT 19 packets, 6614 bytes)
    pkts      bytes target     prot opt in     out     source
destination        =20

Chain OUTPUT (policy ACCEPT 5 packets, 420 bytes)
    pkts      bytes target     prot opt in     out     source
destination        =20
       5      404 DNAT       all  --  *      *       0.0.0.0/0
172.25.239.192/27  to:11.0.0.16=20

[root@linuxrouter root]# arp -an
? (172.25.239.201) at 00:30:05:11:F9:EA [ether] on eth1 ?
(172.25.239.193) at 00:60:47:40:F7:A5 [ether] on eth1 ? (11.0.0.16) at
00:E0:18:02:38:60 [ether] on eth0

[BRUBARNA7M] D:\some_crapy\windows_box>ping 172.25.239.220

Pinging 172.25.239.220 with 32 bytes of data:

Request timed out.

Ping statistics for 172.25.239.220:
    Packets: Sent =3D 1, Received =3D 0, Lost =3D 1 (100% loss), =
Control-C ^C

also ... even a ping to my normal host is not working anymore. (wich was
working without the tables)

[BRUBARNA7M] D:\some_crapy\windows_box>ping 172.25.239.208

Pinging 172.25.239.208 with 32 bytes of data:

Request timed out.

Ping statistics for 172.25.239.208:
    Packets: Sent =3D 1, Received =3D 0, Lost =3D 1 (100% loss),

you should think it is my firewall ... but I accept everything ... :(

[root@linuxrouter root]# iptables -L -nvx Chain INPUT (policy ACCEPT 0
packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source
destination        =20
     557    72706 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0          state NEW,RELATED,ESTABLISHED=20

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source
destination        =20
     147    13879 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0          state NEW,RELATED,ESTABLISHED=20
       0        0 RULE_0     all  --  *      *       0.0.0.0/0
11.0.0.16          state NEW=20

Chain OUTPUT (policy ACCEPT 1 packets, 152 bytes)
    pkts      bytes target     prot opt in     out     source
destination        =20
     269    31752 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0          state NEW,RELATED,ESTABLISHED=20
       0        0 RULE_0     all  --  *      *       0.0.0.0/0
11.0.0.16          state NEW=20

Chain RULE_0 (2 references)
    pkts      bytes target     prot opt in     out     source
destination        =20
       0        0 LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0          LOG flags 0 level 6 prefix `RULE 0 -- ACCEPT '=20
       0        0 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0         =20







