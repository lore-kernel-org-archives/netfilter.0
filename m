From: Joel  <joel@telecorp.com.br>
Subject: redirect ROUTE
Date: Wed, 21 May 2003 11:31:52 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200305211131.52661.joel@telecorp.com.br>
Reply-To: joel@telecorp.com.br
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
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

Hi,

My situation is:=20
A:=20
LINK with ip 200.x.x.x
and
internal ip: 192.168.1.254
B:
ADSL router with ip 192.168.200.1
and
internal ip: 192.168.1.8
router default: 192.168.200.254

I need redirect port 80 to 192.168.1.8.
I am making NAT:
bimap xl0 192.168.1.8/32 -> 200.x.x.x/32

My problem is that the route default is not for A. =20
With router default to A its OK.

Then I tried this :

# iptables -A PREROUTING -i eth0 -t mangle -p tcp --dport 80 -j MARK=20
--set-mark 1
our
# iptables -A POSTROUTING -o eth0 -t mangle -p tcp --sport 80 -j MARK=20
--set-mark 1
our
# iptables -A POSTROUTING -p tcp -t mangle -s 192.168.1.8 --sport 80 -j R=
OUTE=20
--gw 192.168.1.254

nothing work with out router default to A.

# cat /etc/iproute2/rt_tables
#
# reserved values
#
255     local
254     main
253     default
0       unspec
#
# local
#
#1      inr.ruhep
201 www.out
---------------------------------------------------------
[root@joel /root]# ip route list table www.out
default via 192.168.1.254 dev eth0
--------------------------------------------------------
[root@joel /root]# /sbin/ip route add default via 192.168.1.254 dev eth0 =
table=20
wwwl.out
-----------------------------------------------------
# ip rule ls
0:      from all lookup local
32765:  from all fwmark        1 lookup www.out
32766:  from all lookup main
32767:  from all lookup default

------------------------------------------------------

Thanks,

Joel


