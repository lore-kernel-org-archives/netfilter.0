From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Default deny rule
Date: Mon, 14 May 2007 14:33:17 +0200
Message-ID: <4648570D.4040308@freemail.hu>
References: <d2af4f000705092228x3746eb10u9b81264581a57e46@mail.gmail.com>	
	<464440C4.7000605@freemail.hu>
	<d2af4f000705132302t3d8b2c8eo6158406d02af9f91@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <d2af4f000705132302t3d8b2c8eo6158406d02af9f91@mail.gmail.com>
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
To: Gopinath <gopinath.u@gmail.com>
Cc: netfilter@lists.netfilter.org

Gopinath =EDrta:
> Please find the correct IP details below... Is it neccessary to
> upgrade my kernel and iptables to achieve NAT and Default deny
> functionality ?
Not neccessary but suggested... At least you should upgrade your=20
iptables to 1.3.7.

Now I comment your rules... :D
> :INPUT ACCEPT [364:57615]
> :FORWARD ACCEPT [1:52]
> :OUTPUT ACCEPT [211:18044]
If there is no matching rule then EVERYTHING is ACCEPTED because your 3=20
policies above is set to ACCEPT.
In DEFAULT DENY mode you should set these policies to DROP as mentioned=20
in the previos mail of mine:

iptables -t filter -P INPUT DROP
iptables -t filter -P FORWARD DROP
iptables -t filter -P OUTPUT DROP


> -A INPUT -s 10.44.20.70 -p icmp -j ACCEPT
> -A INPUT -s 10.44.2.140 -p icmp -j ACCEPT
Here you enable 2 IPs to use ICMP (ping) on your host.
> -A INPUT -s 10.44.2.140 -p tcp -m tcp --dport 22 -j ACCEPT
> -A INPUT -s 10.44.20.70 -p tcp -m tcp --dport 22 -j ACCEPT
> -A INPUT -s 10.1.0.246 -p tcp -m tcp --dport 22 -j ACCEPT
The above 3 IPs are enabled to SSH to your host.
BUT IF YOU DO NOT SET THE DEFAULT POLICY TO DROP THEN THESE RULES ARE=20
MEANINGLESS!!!

> -A FORWARD -s 10.2.10.240 -d 10.44.2.140 -i eth0 -o eth1 -p tcp -m
> state --state NEW -j ACCEPT
> -A FORWARD -s 10.2.10.240 -d 10.44.2.100 -i eth0 -o eth1 -p tcp -m
> state --state NEW -j ACCEPT
10.2.10.240 can create NEW connections to 10.44.2.100 and 10.44.2.140...

10.2.10.240 should be on eth0
10.44.2.100 should be on eth1
10.44.2.140 should be on eth1
> -A FORWARD -o eth0 -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
ANY host that sends ANY (NEW,RELATED,ESTABLISHED) packets through eth0=20
(not only to 10.2.10.240) is ACCEPTED.
> -A FORWARD -i eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT
ANY host thar sends RELATED or ESTABLISED packets from eth0 (not only=20
from 10.2.10.240) is ACCEPTED.
AGAIN IF YOU DO NOT SET THE DEFAULT POLICY TO DROP THEN THESE RULES ARE=20
MEANINGLESS!!!

> *nat
> :PREROUTING ACCEPT [289:55706]
> :POSTROUTING ACCEPT [77:6468]
> :OUTPUT ACCEPT [77:6468]
These ACCEPTs are ok.
> -A PREROUTING -d 10.1.60.240 -i eth0 -j DNAT --to-destination 10.44.2.1=
00
> -A PREROUTING -d 10.1.60.245 -i eth0 -j DNAT --to-destination 10.44.2.1=
40
Anything that comes form eth0 and would go to 10.1.60.240 should go to=20
10.44.2.100.
Anything that comes form eth0 and would go to 10.1.60.245 should go to=20
10.44.2.140.

> -A POSTROUTING -s 10.44.2.100 -o eth0 -j SNAT --to-source 10.1.60.240
> -A POSTROUTING -s 10.44.2.140 -o eth0 -j SNAT --to-source 10.1.60.245
Anything that goes out on eth0 and comes from 10.44.2.100 should appear=20
as it would come from 10.1.60.240.
Anything that goes out on eth0 and comes from 10.44.2.140 should appear=20
as it would come from 10.1.60.245.

Maybe you do not need these last two rules at all because a DNAT rule=20
simply does the reverse SNAT is most cases.
> # iptables -nv -L
>
> Chain INPUT (policy ACCEPT 100 packets, 14882 bytes)
You had 100 packets that did not matched ANY rule in the INPUT chain.
> pkts bytes target     prot opt in     out     source
> destination
>    0     0 ACCEPT     icmp --  *      *       10.44.20.70
> 0.0.0.0/0
>    0     0 ACCEPT     icmp --  *      *       10.44.2.140
> 0.0.0.0/0
>    0     0 ACCEPT     tcp  --  *      *       10.44.2.140
> 0.0.0.0/0           tcp dpt:22
>  356 24672 ACCEPT     tcp  --  *      *       10.44.20.70
> 0.0.0.0/0           tcp dpt:22
>    0     0 ACCEPT     tcp  --  *      *       10.1.0.246
> 0.0.0.0/0           tcp dpt:22
No connection, no ping yet ???
>
> Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
> pkts bytes target     prot opt in     out     source
> destination
>    0     0 ACCEPT     tcp  --  eth0   eth1    10.2.10.240
> 10.44.2.140         state NEW
>    0     0 ACCEPT     tcp  --  eth0   eth1    10.2.10.240
> 10.44.2.100         state NEW
>    0     0 ACCEPT     all  --  *      eth0    0.0.0.0/0
> 0.0.0.0/0           state NEW,RELATED,ESTABLISHED
>    0     0 ACCEPT     all  --  eth0   *       0.0.0.0/0
> 0.0.0.0/0           state RELATED,ESTABLISHED
>
No NAT yet ???
> Chain OUTPUT (policy ACCEPT 302 packets, 34150 bytes)
> pkts bytes target     prot opt in     out     source              =20
> destination
>
Just 302 packet that went out and no rule. Btw. maybe you do not want to =

filter your outgoing traffic.
In that case you should leave your OUTPUT policy as ACCEPT.
> Regards,
> Gopinath.U

I think that you want something else then what you did in your rules.
I would restart the whole project from the ground.

!!!
Please describe the connected networks and the target of the firewalling.=

!!!

Here is a core script that may help you:
 (A bit long but can be usefull. And of course not working in current=20
state... :D )

#!/bin/bash
echo "Setting up FIREWALL rules:"

core_set=3D"/proc/sys/net/core"
ip_set=3D"/proc/sys/net/ipv4"
echo                 0 > $ip_set/conf/all/rp_filter
echo                 1 > $ip_set/conf/all/proxy_arp
echo                 1 > $ip_set/icmp_echo_ignore_broadcasts
echo                 1 > $ip_set/ip_forward
echo             32768 > $ip_set/netfilter/ip_conntrack_max
echo                 1 > $ip_set/tcp_abort_on_overflow
echo                10 > $ip_set/tcp_fin_timeout
echo                 1 > $ip_set/tcp_rfc1337
echo                 1 > $ip_set/tcp_sack
echo                 2 > $ip_set/tcp_synack_retries
echo                 1 > $ip_set/tcp_syncookies
echo 16384 16384 16384 > $ip_set/tcp_wmem
echo             16384 > $core_set/rmem_default
echo             16384 > $core_set/wmem_default
echo             16384 > $core_set/wmem_max
sysctl -w net.ipv4.tcp_ecn=3D0 >/dev/null 2>/dev/null


modprobe ip_conntrack >/dev/null 2>/dev/null
modprobe ip_nat >/dev/null 2>/dev/null
modprobe iptable_nat >/dev/null 2>/dev/null

clean_subchain() {
 $table -F $subchain >/dev/null 2>/dev/null
 $table -X $subchain >/dev/null 2>/dev/null
 $table -Z $subchain >/dev/null 2>/dev/null
 }

create_subchain() {
 subchain=3D$1
 clean_subchain
 $table -N $subchain
 }

clean_table() {
 subchain=3D""
 clean_subchain
 }

table=3D"iptables -t nat"
clean_table

chain=3D"PREROUTING"
$table -P $chain ACCEPT

create_subchain "DNAT_of_eth0"
$table -A $chain -j $subchain -i eth0
$table -A $subchain -j DNAT -d 10.1.60.240 --to-destination 10.44.2.100
$table -A $subchain -j DNAT -d 10.1.60.245 --to-destination 10.44.2.140

chain=3D"POSTROUTING"
$table -P $chain ACCEPT

chain=3D"OUTPUT"
$table -P $chain ACCEPT


table=3D"iptables -t filter"
clean_table

create_subchain "send_reject"
$table -A $subchain -j REJECT -p tcp --reject-with tcp-reset
$table -A $subchain -j REJECT --reject-with icmp-admin-prohibited
$table -A $subchain -j DROP

create_subchain "log_invalid"
$table -A $subchain -j LOG  --log-prefix "INVALID: " --log-level debug --=
log-tcp-sequence --log-tcp-options --log-ip-options
$table -A $subchain -j send_reject

create_subchain "con_icmp"
$table -A $subchain -j RETURN -p icmp --icmp-type echo-reply
$table -A $subchain -j RETURN -p icmp --icmp-type destination-unreachable=

$table -A $subchain -j RETURN -p icmp --icmp-type source-quench
$table -A $subchain -j RETURN -p icmp --icmp-type echo-request -m hashlim=
it --hashlimit-name icmp --hashlimit 1/s --hashlimit-mode srcip
$table -A $subchain -j RETURN -p icmp --icmp-type time-exceeded
$table -A $subchain -j DROP -p icmp

create_subchain "con_udp"
#TODO

create_subchain "con_tcp"
$table -A $subchain -j RETURN -p tcp --syn -m conntrack --ctstate NEW
$table -A $subchain -j RETURN -m conntrack --ctstatus EXPECTED
$table -A $subchain -j log_invalid

create_subchain "connected"
$table -A $subchain -j ACCEPT -m conntrack --ctstate ESTABLISHED
$table -A $subchain -j ACCEPT -m conntrack --ctstate RELATED
$table -A $subchain -j RETURN -i lo -o lo
$table -A $subchain -j con_icmp -p icmp
$table -A $subchain -j RETURN -p icmp
$table -A $subchain -j con_udp -p udp
$table -A $subchain -j RETURN -p udp
$table -A $subchain -j con_tcp -p tcp
$table -A $subchain -j RETURN -p tcp

chain=3D"INPUT"

$table -P $chain DROP

$table -A $chain -j connected

create_subchain "ICMP_ok"
$table -A $chain -j $subchain -p icmp
$table -j ACCEPT -s 10.44.20.70
$table -j ACCEPT -s 10.44.2.140

create_subchain "SSH_ok"
$table -A $chain -j $subchain -p tcp --dport 22
$table -j ACCEPT -s 10.1.0.246
$table -j ACCEPT -s 10.44.2.140
$table -j ACCEPT -s 10.44.20.70

chain=3D"FORWARD"
$table -P $chain DROP

$table -A $chain -j connected

create_chain "enable_DNAT_to_eth1"
$table -A $chain -j $subchain -o eth1
$table -A $subchain -j ACCEPT -d 10.44.2.100
$table -A $subchain -j ACCEPT -d 10.44.2.140


chain=3D"OUTPUT"
$table -P $chain ACCEPT

echo "done."



Swifty


