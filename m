From: "Daniel Williams" <danielw@staff.iinet.net.au>
Subject: RE: iptables random support
Date: Mon, 31 Jul 2006 09:13:43 +0800
Message-ID: <5B0731A8753509478386ED3D6513B2D101AE6CDA@isp-per-exch01.win2k.iinet.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Daniel Williams <danielw@staff.iinet.net.au>, netfilter@lists.netfilter.org



To add to this dmesg reports the following when trying to add a random
or nth match rule:
ip_tables: random match: invalid size 0 !=3D 4
and
ip_tables: nth match: invalid size 0 !=3D 8


Daniel

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Daniel
Williams
Sent: Sunday, 30 July 2006 9:53 PM
To: netfilter@lists.netfilter.org
Subject: iptables random support


Hi,

I have been trying to get iptables -m random support working to very
little success.

Does anyone have a modern 2.6 kernel with iptables -m random working ?

I tried using the random and nth patches from patch-o-matic-ng-20050918,
with 2.6.17.7 and iptables 1.2.11 and 1.3.5.

The modules are loaded:
root@server2:/usr/src# lsmod | grep ipt
iptable_nat             8196  0
ip_nat                 17580  1 iptable_nat
iptable_filter          3968  0
ipt_random              3200  0
ipt_nth                 3584  0
iptable_mangle          3968  0
ip_tables              14580  3
iptable_nat,iptable_filter,iptable_mangle
x_tables               14724  5
xt_tcpudp,iptable_nat,ipt_random,ipt_nth,ip_tables


When I type a command that uses random or nth I get:
# iptables -A INPUT -m random --average 1 -j ACCEPT
iptables: Invalid argument
# iptables -A INPUT -m nth --every 2 -j ACCEPT
iptables: Invalid argument
with iptables 1.2.11 and with iptables 1.3.5:
# iptables -A INPUT -m nth --every 2 -j ACCEPT
iptables: Unknown error 4294967295
# iptables -A INPUT -m random -j ACCEPT
iptables: Unknown error 4294967295


I realize the 'unknown error' is a known, unrelated bug.

I have some complicated routing requirements that I plan to use random
in combination with mark/fwmark routing.

I am also interested if anyone has this setup and can tell me the
performance of there setup.

Daniel




