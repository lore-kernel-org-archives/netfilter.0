From: "Daniel Nogradi" <nogradi@gmail.com>
Subject: updated iptables doesn't work with old rules
Date: Wed, 22 Feb 2006 10:58:01 +0100
Message-ID: <5f56302b0602220158k76b68705p88dd35b4c2782caa@mail.gmail.com>
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

I have updated my Fedora Core 3 box to the latest versions (in the FC3
branch) and now have

iptables-1.2.11-3.1.FC3
kernel-2.6.12-1.1381_FC3

and ip forwarding stopped working. Before the upgrade I had

iptables-1.2.11-3.1
kernel-2.6.9-1.667

The configuration is this:

machine A with FC3 ---------------- adsl modem -------------------- interne=
t
  |
  |
  |
machine B
on a LAN

The FC3 box was using iptables for ip ipforwarding in order to let
'machine B' access the internet using these rules:

iptables --flush
iptables -t nat --flush
iptables --delete-chain
iptables -t nat --delete-chain
iptables -t nat --append POSTROUTING --out-interface eth0 -j MASQUERADE
iptables -t nat --append POSTROUTING -s 192.168.10.0/255.255.255.0 -j MASQU=
ERADE
iptables --append FORWARD --in-interface eth1 -j ACCEPT

echo 1 > /proc/sys/net/ipv4/ip_forward

Now after the update these rules stopped working and nothing gets
through from 'machine B', although pinging works between machines A
and B both ways.

Any ideas as to what to change in these rules to have the same effect
as before the update?

