From: Yong Zhang <yozhang@gmail.com>
Subject: a problem with nat table setting
Date: Tue, 31 Jan 2006 17:20:42 -0800
Message-ID: <d268cd070601311720o1d2a4ff4w259e8c8ab915d223@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

I am having a problem with the nat table configuration.  I am using
2.6.8.1 kernel in a router and also added a http filter proxy which
uses port 8080.

Internet ------------ ROUTER(http filter proxy) ---------linux PC.
                                      lan ip: 192.168.1.1       192.168.1.2

I have found that if there is a established connection exist between
linux PC and the webserver before I start the proxy, and added the
iptables nat rules, which can be  checked use netstat, the outgoing
http packet will not be passed to the proxy, and it seems go out
directly.  If I leave it untouched (no http activity), and after some
time later, that connection is gone,  the outgoing http packet will be
passed to the proxy again.

Any one know how to solve this problem?

Thanks.

Yong

Here is the iptables configure:
1. only the one in nat PREROUTING REDIRECT are for the proxy)
2. ppp0 is wan interface     br0 is lan interface.  PC is attached to br0.

# iptables -L -v
Chain INPUT (policy ACCEPT 3574 packets, 11M bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion
   22  7554 ACCEPT     all  --  ppp0   any     anywhere           =20
anywhere            state RELATED,ESTABLISHED
    0     0 ACCEPT     udp  --  ppp0   any     anywhere           =20
anywhere            udp dpt:500
    0     0 ACCEPT     esp  --  ppp0   any     anywhere             anywher=
e
    0     0 ACCEPT    !esp  --  ppp0   any     anywhere           =20
anywhere            MARK match 0x10000000/0x10000000
    0     0 LOG        tcp  --  ppp0   any     anywhere           =20
anywhere            tcp flags:SYN,RST,ACK/SYN limit: avg 6/hour burst
5 LOG level alert prefix `Intrusion -> '
    0     0 DROP       all  --  ppp0   any     anywhere             anywher=
e

Chain FORWARD (policy ACCEPT 43 packets, 13943 bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion
   37 15118 ACCEPT     all  --  ppp0   any     anywhere           =20
anywhere            state RELATED,ESTABLISHED
    0     0 ACCEPT    !esp  --  ppp0   any     anywhere           =20
anywhere            MARK match 0x10000000/0x10000000
    0     0 LOG        tcp  --  ppp0   any     anywhere           =20
anywhere            tcp flags:SYN,RST,ACK/SYN limit: avg 6/hour burst
5 LOG level alert prefix `Intrusion -> '
    0     0 DROP       all  --  ppp0   any     anywhere             anywher=
e

Chain OUTPUT (policy ACCEPT 3456 packets, 11M bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion
    0     0 DROP       all  --  any    ppp0    anywhere           =20
239.255.255.250


# iptables -t nat -L -v
Chain PREROUTING (policy ACCEPT 84 packets, 5865 bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion
    2   120 REDIRECT   tcp  --  br0    any     anywhere          =20
!192.168.1.1         tcp dpt:www redir ports 8080
    2   118 DNAT       udp  --  br0    any     anywhere           =20
192.168.1.1         udp dpt:domain to:10.250.1.10

Chain POSTROUTING (policy ACCEPT 28 packets, 1822 bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion
    3   178 MASQUERADE  all  --  any    ppp0    192.168.1.0/24       anywhe=
re

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion
#

