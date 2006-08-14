From: "claudio987\@libero\.it" <claudio987@libero.it>
Subject: Forwarding Protocol 41 (ipv6)
Date: Tue, 15 Aug 2006 00:32:05 +0200
Message-ID: <J40ELH$5F97F9C8FEC17F9A0CAFB5C57BFEE593@libero.it>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

Hi, I have a problem.
I have a Dlink router working with a linux based firmware
This router uses an "outbound" nat and then is not possible to forwarding=
 protocol 41 (protocol used to ipv6 tunnel) on an internal ip address of =
my lan. Now I ask you if is possible to change nat into bidirectional nat=
 and than have the bossibility to set an entry in iptables to forward pro=
tocol 41
I found this document on internet: http://www.euro6ix.org/documentatio...=
ls_nat_v1_6.pdf
it says that is not possible to forward protocol 41 (at page 6), but I th=
ink that it refeers to routers that don't are linux based.
I tried to set many entry like: 
# iptables -t filter -A INPUT -p ipv6 -s 0/0 -d 0/0 -j ACCEPT
# iptables -t filter -A OUTPUT -p ipv6 -s 0/0 -d 0/0 -j ACCEPT
# iptables -t filter -A FORWARD -p ipv6 -s 0/0 -d 192.168.0.2/24 -j ACCEP=
T
the entry in nat table is created automatically when I open ipv6 traffic =
from the inside to outside: and is deleted afer an idle time longer than =
180 seconds. and then the only way I found to forwarding proto41 is sendi=
ng costant traffic from PC where I wont to forward the protocol. As is wr=
itten in the document.
Now what I wont to ask is if there is a way to change nat from outbound t=
o a bidirectional (twice way nat)
I have many linux tools on the router like iptables, route, ip
Thanks
This is my router iptables output:
# iptables -L
Chain INPUT (policy ACCEPT)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere           state RELATED=
,ESTABLISHED
REJECT     tcp  --  anywhere             anywhere           tcp dpt:auth =
reject-with tcp-reset
DROP       all  --  anywhere             anywhere

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination
ipaccount  all  --  anywhere             anywhere
TCPMSS     tcp  --  anywhere             anywhere           tcp flags:SYN=
,RST/SYN TCPMSS set 1360
ACCEPT     all  --  anywhere             anywhere           state RELATED=
,ESTABLISHED
ACCEPT     udp  --  anywhere             192.168.0.2        udp dpt:81
ACCEPT     tcp  --  anywhere             192.168.0.2        tcp dpt:81
DROP       all  --  anywhere             anywhere

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
DROP       icmp --  anywhere             anywhere           icmp destinat=
ion-unreachable
DROP       icmp --  anywhere             anywhere           state INVALID=


# iptables -t nat -L
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
DNAT       udp  --  anywhere             anywhere           udp dpt:81 to=
:192.168.0.2:81
DNAT       tcp  --  anywhere             anywhere           tcp dpt:81 to=
:192.168.0.2:81

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
MASQUERADE  all  --  anywhere             anywhere

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination



