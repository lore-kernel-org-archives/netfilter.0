From: "Steve Wakelin" <steve@wcsl.net>
Subject: MARK and routing issue
Date: Thu, 1 Jul 2004 00:58:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <267354A234DF4D46AA6AE56E1240BEF0A48E@tv.wcslnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

Hello,

Perhaps someone could point me in the right direction.

I am simply ;-( trying to MARK packets and then route them according to
the mark.

[root@localhost sysconfig]# ip rule
0:      from all lookup local
32760:  from all fwmark 0x6 lookup T4
32761:  from all fwmark 0x5 lookup T3
32762:  from 192.168.252.1 lookup T2
32763:  from 192.168.253.1 lookup T1
32764:  from 192.168.252.1 lookup T2
32765:  from 192.168.253.1 lookup T1
32766:  from all lookup main
32767:  from all lookup default

[root@localhost sysconfig]# ip route list table T3
10.3.0.1 via 10.3.0.2 dev tun1
default via 10.3.0.2 dev tun1

[root@localhost sysconfig]# ip route list table T4
10.3.0.1 via 10.3.0.3 dev tun2
default via 10.3.0.3 dev tun2

[root@localhost sysconfig]# iptables -t mangle -L
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
MARK       all  --  10.15.1.0/24         10.3.0.0/24         MARK set
0x5
MARK       all  --  10.15.1.0/24         10.3.0.0/24         MARK set
0x6

Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination

[root@localhost sysconfig]# ping -I 10.15.1.1 10.3.0.1
PING 10.3.0.1 (10.3.0.1) from 10.15.1.1 : 56(84) bytes of data.
ping: sendmsg: Network is unreachable
ping: sendmsg: Network is unreachable
ping: sendmsg: Network is unreachable

Will someone please enlighten me as to what I have missed?

Thanks in advance.

Regards

/Steve


