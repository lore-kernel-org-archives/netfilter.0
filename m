From: denizen <netdenizen@gmail.com>
Subject: Bridge and iptables
Date: Fri, 27 Jan 2006 10:23:42 -0600
Message-ID: <e606945b0601270823t6aab545cwb2a5e71b7e67d430@mail.gmail.com>
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

I'm trying to use NoCatSplash to create a captive portal on a bridge
machine that has an IP address assigned to the bridge device.=20
NoCatSplash uses iptables and it seems that this is the beginning of
my problems...i guess I need to be using ebtables instead of iptables
but i'm not sure...

I've setup NoCatSplash before and found it rather easy to get working
but am having a hard time getting it to work on the bridge.  The idea
is to be able to very easily insert a captive portal at a bottleneck
point in a given network without reconfiguring all of the routers and
access points already installed.

My bridge setup is as follows:

ifconfig eth1 0.0.0.0
ifconfig eth2 0.0.0.0
brctl addbr br0
brctl addif br0 eth1
brctl addif br0 eth2
ifconfig eth1 up
ifconfig eth2 up
ifconfig br0 10.0.0.99 netmask 255.255.255.0 up
route add default gw 10.0.0.1

I've configured NoCatSplash to use br0 as the interface and 10.0.0.99
as the ip address but of course its not working.  The firewall is
setup incorrectly and i'm not sure what part of the firewall is
incorrect as i'm not sure where the bridging logic and the iptables
logic interact.

I'm not sure what i'm missing but i've hit the limits of my
knowledge...can someone help me with this?

Thanks in advance!
dennis

