From: Richard A Downing <richard.downing@bcs.org.uk>
Subject: Masquerade (Newbie)
Date: Sun, 9 Jun 2002 16:47:32 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206091647.32562.richard.downing@bcs.org.uk>
Reply-To: richard.downing@bcs.org.uk
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

I have followed the NAT-HOWTO to set up iptables1-2.6a with kernel 2.4.18=
,
using modules.

The iptables_nat module loads fine, but=20

iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

gives: iptables: No chain/target/match by that name

I've checked that the 'libipt_MASQUERADE.so' file is in /usr/lib/iptables=
=2E  If I command:
iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to 62.255.122.217
then this happens:

iptables -t nat --list
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
SNAT       all  --  anywhere             anywhere           to:192.168.1.=
0

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

So now I'm stumped!

What I am attempting to do is to rpovide my other two machines on my
local LAN (192.168.1....) with internet access via 192.168.1.3 using ppp.
If I get this to the point where it works then it will be worth mu while =
buying
into broadband.

Sorry to be so stupid, all suggestions welcomed.

Richard

