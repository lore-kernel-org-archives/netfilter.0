From: Matin Tamizi <mtamizi@gmail.com>
Subject: Stateless NAT
Date: Tue, 7 Jun 2005 11:27:40 -0400
Message-ID: <f68a4160506070827307b0080@mail.gmail.com>
Reply-To: Matin Tamizi <mtamizi@gmail.com>
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
To: NetFilter <netfilter@lists.netfilter.org>

I'm trying to setup stateless NAT on a testbed I'm using for
university research on DDoS.  We are developing a stateless DDoS
prevention tool, but to test the software I need to use stateless NAT
to force traffic from outside through one computer, the router, and to
the victim.

I tried the NETMAP target module, but the router is still filtering my
out of state packets from the attack.  The following show the rules in
my nat table:

root # iptables -t nat -L
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
NETMAP     all  --  anywhere             <victim's ip address> 192.168.13.2=
/32

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
SNAT       all  --  192.168.13.2         anywhere          =20
to:<victim's ip address>

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

I appreciate any suggestions on how I could correct my setup so I can
use stateless.

