From: Joseph Nicholson <wjnicholson@gmail.com>
Subject: Iptables is resetting
Date: Thu, 4 Aug 2005 09:50:04 -0500
Message-ID: <62ddd33050804075057697edb@mail.gmail.com>
Reply-To: Joseph Nicholson <wjnicholson@gmail.com>
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

I have been seeing an issue lately when using Iptables on a Fedora
Core 3 box.  The version number is 1.2.11.  Some of my users have been
complaining that sometimes the connection will stop working.  If I go
in the box and re-apply the config then everything will start working
again.  I have listed the tables before I re-applied and see that they
are all still there, but for some reason they stop working.  I have
the following NAT rules running:

Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
DNAT       all  --  0.0.0.0/0            1.2.3.4       to:10.65.0.4
DNAT       all  --  0.0.0.0/0            1.2.3.5       to:10.65.1.5

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
SNAT       all  --  10.65.0.4            0.0.0.0/0           to:1.2.3.4
SNAT       all  --  10.65.1.5            0.0.0.0/0           to:1.2.3.5
SNAT       all  --  0.0.0.0/0            0.0.0.0/0           to:1.2.3.3

1.2.3.4 is a Cisco pix running a vpn tunnel to a remote location. =20
1.2.3.5 is a desktop PC I use for remote management.
1.2.3.3 is the eth0 (outside interface) of the linux box.

This box is setup as a router.

When the VPN tunnel that 1.2.3.4 has is up and running I can do a
constant ping to the inside interface of the Pix.  Several times a day
it will stop responding to pings.  If I go and re-apply the iptables
using webmin, then it will start working again.

The last SNAT rules is for the 800+ users I have running on the inside
of this network.

I tried looking to see if this was a known issue, but I could not find
any info on it.  It is possible that since I am still fairly new to
iptables then i might not have been looking for the answer in the
correct place.

I read the NAT tutorials listed on the netfilter site and I am
confident that I have my rules setup properly.

I greatly appreciate any help in advance. =20

--=20
Joseph Nicholson

