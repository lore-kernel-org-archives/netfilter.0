From: "Arnauts, Bert" <Bert.Arnauts@fujitsu-siemens.com>
Subject: RE: DNAT problem /  question (nfcan: addressed to exclusive sender for this address)
Date: Mon, 21 Jun 2004 11:14:09 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <519AD2BA94FC6E4DB5DE078B2E37CB10A76F87@PDBEX01E.pdb.fsc.net>
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

 Thx Jim,

$IPTABLES -t nat -A PREROUTING -d 172.25.239.220 -j DNAT
--to-destination 11.0.0.16

I tried this rule. Firt I made a virtual interface on the external
network, then I executed my rules. (see below)
I still have access to my nat box now, (the 208), but I can not ping the
220 anymore. Apparently he forwards something ?
(3 packets ?) Is my broadcast address right ? I made this the same as
the nat box has ? What does this anyway ?

What about the subnetmask of my internal network  ? 255.255.255.224 ??
Will the nat rule know this ?

Cheers, and thx,

Bert



------------------------------------------------------------------------
-----------------------
eth1      Link encap:Ethernet  HWaddr 00:D0:B7:E0:1F:2C =20
          inet addr:172.25.239.208  Bcast:172.25.239.223
Mask:255.255.255.224
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:33527 errors:0 dropped:0 overruns:0 frame:0
          TX packets:791 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100=20
          RX bytes:1944722 (1.8 Mb)  TX bytes:113877 (111.2 Kb)
          Interrupt:11 Base address:0xd400 Memory:fa000000-fa000038=20

eth1:1    Link encap:Ethernet  HWaddr 00:D0:B7:E0:1F:2C =20
          inet addr:172.25.239.220  Bcast:172.25.239.223
Mask:255.255.255.224
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100=20
          RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)
          Interrupt:11 Base address:0xd400 Memory:fa000000-fa000038=20
------------------------------------------------------------------------
---------------------------
[root@linuxrouter root]# iptables -L -t nat -nvx
Chain PREROUTING (policy ACCEPT 241 packets, 40673 bytes)
    pkts      bytes target     prot opt in     out     source
destination        =20
       7      678 DNAT       all  --  *      *       0.0.0.0/0
172.25.239.220     to:11.0.0.16=20

Chain POSTROUTING (policy ACCEPT 17 packets, 1403 bytes)
    pkts      bytes target     prot opt in     out     source
destination        =20

Chain OUTPUT (policy ACCEPT 6 packets, 461 bytes)
    pkts      bytes target     prot opt in     out     source
destination=20
------------------------------------------------------------------------
---------------------------       =20
[root@linuxrouter root]# iptables -L -nvx
Chain INPUT (policy ACCEPT 51 packets, 5884 bytes)
    pkts      bytes target     prot opt in     out     source
destination        =20
     149    12360 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0          state RELATED,ESTABLISHED=20

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source
destination        =20
       0        0 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0          state RELATED,ESTABLISHED=20
      24     1837 RULE_0     all  --  *      *       0.0.0.0/0
11.0.0.16          state NEW=20

Chain OUTPUT (policy ACCEPT 1 packets, 152 bytes)
    pkts      bytes target     prot opt in     out     source
destination        =20
     116    26168 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0          state RELATED,ESTABLISHED=20
       0        0 RULE_0     all  --  *      *       0.0.0.0/0
11.0.0.16          state NEW=20

Chain RULE_0 (2 references)
    pkts      bytes target     prot opt in     out     source
destination        =20
      24     1837 LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0          LOG flags 0 level 6 prefix `RULE 0 -- ACCEPT '=20
      24     1837 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0         =20
------------------------------------------------------------------------
-----------------------=20
[root@linuxrouter root]# arp -an
? (172.25.239.193) at 00:60:47:40:F7:A5 [ether] on eth1
? (11.0.0.16) at 00:E0:18:02:38:60 [ether] on eth0
[root@linuxrouter root]#=20


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Jim Laurino
Sent: Monday, June 21, 2004 6:25 AM
To: netfilter@lists.netfilter.org
Subject: Re: DNAT problem / question (nfcan: addressed to exclusive
sender for this address)

On 2004.06.20 18:24, Arnauts Bert  - Bert.Arnauts@fujitsu- siemens.com
wrote:
> Hello all,
>=20
> thx already for the hints, but I am still in a strugle.
> I changed my destination ip to 207,
> because 220 could cause problems.
> Forgive me that I don't understand why.
> Anyway, these rules give even a more confusing result.
> I am still not able to access my 11.0.0.16 box through the=20
> 172.25.239.207 DNAT'ed alias.
> (not pingable, not nothing)
> I also can not connect anymore to my netfilter box anymore after=20
> executing this script, BUT my active ssh connection stays open ! ?
> I am still on my machine remotly,
> but I can not ping it anymore ?? :(
>=20
> Any more ideas ?
> ------------------------------------------------------------
>=20
> echo "Activating firewall script generated Thu Jun 10 15:03:22 2004=20
> CEST by root"
>=20
> $IPTABLES -t nat -A PREROUTING -d 172.25.239.207/27 -j DNAT=20
> --to-destination 11.0.0.16
>=20
> $IPTABLES -A INPUT   -m state --state
> NEW,ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A OUTPUT  -m state --state
> NEW,ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A FORWARD -m state --state
> NEW,ESTABLISHED,RELATED -j ACCEPT
>=20
> $IPTABLES -N RULE_0
> $IPTABLES -A OUTPUT  -d 11.0.0.16  -m state --state NEW
> - j RULE_0
> $IPTABLES -A FORWARD -d 11.0.0.16  -m state --state NEW -j RULE_0=20
> $IPTABLES -A RULE_0  -j LOG --log-level info --log-prefix "RULE 0 --=20
> ACCEPT "
> $IPTABLES -A RULE_0  -j ACCEPT
> echo 1 > /proc/sys/net/ipv4/ip_forward
>=20
> execution of this script gives me this :
> (why is there 192 ? in stead of 207 ?)

> [root@linuxrouter root]# iptables -t nat -L Chain PREROUTING (policy=20
> ACCEPT)
> target     prot opt source               destination
>=20
> DNAT       all  --  anywhere             =20
> 172.25.239.192/27 to:11.0.0.16

Because the programmers were being kind to you :) The 192 is the base
address for the range 192-223, and is exactly what you need for a
.207/27.
(That is, the low 5 bits need to be zeros.)

It will be less confusing, later,
if you change your rule to:

$IPTABLES -t nat -A PREROUTING -d 172.25.239.192/27 -j DNAT
--to-destination 11.0.0.16 (but see below, I think you may not mean to
do this)

If you change the List command from:

iptables -t nat -L
to
iptables -t nat -L -nvx

The -v (--verbose) and -x (--exact) flags will give you (among other
things) the exact number of packets that have matched each rule.

To look at the main (filter) table do:
iptables -L -nvx

I think that you will see that all packets here match these first rules:

-m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

Therefore the "Rule 0" test, which comes later, will never get a chance
to look at them, and will have a zero count.

Change those first rules to:

-m state --state ESTABLISHED,RELATED -j ACCEPT

Then the "Rule 0" tests will match NEW packets.

The PREROUTING rule says that any packet addressed to 172.25.239.207
will be changed to a destination address of 11.0.0.16.
(In fact any address 172.25.239.192 through
172.25.239.223 will become 11.0.0.16)

Therefore, when a packet originally addressed to 172.25.239.207 (in on
eth1) arrives (later) at the filter table it will have a destination
address 11.0.0.16 and will traverse the FORWARD chain and leave by eth0.
Only the host with that address (.16) will receive packets.
This explains why the netfilter host is inacessible.

Also, you said:

> I have everything in the 172.25.239.0/27 network.

This must be a typo, because this does not include 172.25.239.207, which
is one of the 31 addresses in the 172.25.239.192/27 network.

From other things you have said,
I think you may be trying to translate a series of addresses exactly one
to one:

172.25.239.207 <--> 11.0.0.16

I think you can best do this by using an explicit PREROUTING rule for
each pair.
That is, get rid of the /27,
and add a rule for each address pair.
Then you can keep, say .208, not translated, and allow this to be used
as the address of the netfilter host. Like this:

$IPTABLES -t nat -A PREROUTING -d 172.25.239.207 -j DNAT
--to-destination 11.0.0.16

Jim




