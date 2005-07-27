From: Djalel Chefrour <cdjalel@gmail.com>
Subject: Howo to get IP_NF_NAT_LOCAL behavior back after kernel 2.6.10 ?
Date: Wed, 27 Jul 2005 13:08:16 +0200
Message-ID: <4a9dfdec0507270408427a9e20@mail.gmail.com>
Reply-To: Djalel Chefrour <cdjalel@gmail.com>
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

Hi,=20

I want to redirect local http traffic to a transparent squid porxy
running on the NAT box itself.

I've used :
# iptables -t nat -A OUTPUT -p tcp -m owner --uid-owner squid -j ACCEPT=20
# iptables -t nat -A OUTPUT -p tcp --dport 80 -j REDIRECT --to-ports 3128=
=20

But this works no more with kernel 2.6.11 & later.

# iptables -t nat -L -v=20
gives this
---------------------------------------------------------------------------=
------------------------
Chain PREROUTING (policy ACCEPT 2281 packets, 906K bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion=20

Chain POSTROUTING (policy ACCEPT 97012 packets, 5712K bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion=20

Chain OUTPUT (policy ACCEPT 97005 packets, 5712K bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion=20
    0     0 ACCEPT     tcp  --  any    any     anywhere           =20
anywhere            OWNER UID match squid
    0     0 REDIRECT   tcp  --  any    any     anywhere           =20
anywhere            tcp dpt:http redir ports 3128

Chain loc_dnat (0 references)
 pkts bytes target     prot opt in     out     source               destina=
tion=20

Chain wlan0_masq (0 references)
 pkts bytes target     prot opt in     out     source               destina=
tion=20

---------------------------------------------------------------------------=
------------------------


TIA,
Djalel

