From: "Jon Wilson" <jon.wilson@3waynetworks.com>
Subject: Help needed on NAT and raw sockets for telecoms product
Date: Thu, 17 Aug 2006 11:21:25 +0100
Message-ID: <93EDDD37BB21F242B60066B66AC0D657836E5A@euw0300240.xe2hosting.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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

Hi, newbie here.  I've searched the web and archives for info on this
and so far failed to find the info I need.  Apologies if I'm going over
old ground, just steer me in the direction of any existing
threads/FAQs/docs and I'll slink off to do some reading.  Thanks!

The situation I have is:

  * RH9, 2.4.22 kernel with RT Linux 3.2

  * Various bits of hardware and software on this host allow
    wireless equipment to communicate with it, encapsulating
    IP packets over the air interface.  I.e. IP packets arrive
    in my application from the wireless equipment having never
    traversed the Linux IP stack or host Ethernet i/f.

  * The wireless equipment runs applications using IP and each bit
    of wireless equipment has been allocated a 10.x.x.x address.

  * The host has a single Ethernet interface.  This happens to
    currently be on a private 192.168.0.x net but could have a
    public address.

So....=20

Wireless  <> Encap IP  <> Proprietary <> Ethernet <>  LAN/Internet
Equipment    packets      host app         eth0
10.x.x.x     over air                   192.168.0.x

                 \-------- linux host  --------/

What I want to achieve is:

  * A packet with src address 10.x.x.x arriving from wireless
    equipment is sent from the host app, out of eth0, having
    been NAT'd.

  * A packet arriving from the LAN/Internet is NAT'd and if
    the dst IP is 10.x.x.x it is processed by the host app
    to be sent on to the correct bit of wireless equipment.

  * The NAT should work for all TCP/UDP/ICMP packets,
    probably FTP and possibly other protocols that embed
    IP info.

It seemed like I could do this by:

  * Set up POSTROUTING masquerading on eth0 for packets with
    a source address of 10.x.x.x.

  * Send packets that arrive from the wireless equipment
    from my host app using raw sockets (without modification).
    These would then be sent out of eth0 having been NAT'd.

  * Sniff for received eth0 packets in my host app, e.g. using
    libpcap with a host 10.x.x.x filter, thus picking up post
    NAT packets destined for the wireless equipment.
    Knowing the dst address then lets me route the packet over
    the air interface to the correct bit of wireless equipment.

  * Setup an INPUT filter on 10.x.x.x to DROP packets to stop
    the kernel responding to packets destined for the wireless
    equipment.

I've tried this, and I find the NAT doesn't work.  So far I've only
tried the outbound (wireless equipment -> internet) direction and the
packets leave eth0 with their original 10.x.x.x address.

I have read that the netfilter code is bypassed for raw sockets but if I
set up a DROP filter in the OUTPUT table for packets with src address
10.x.x.x they *are* dropped so it seems that this isn't true (at least
wrt the OUTPUT table).

Should the setup above work?!  If not, where am I going wrong and does
anyone have any suggestions as to how I can do this?

If it should work, that's great (as it'll possibly save me writing a NAT
:-) ), but I must be doing something wrong in the setup and any pointers
as to how to debug it would be appreciated!

Output from various related cmds shown below.

Thanks in advance,

Jon


# cat /proc/sys/net/ipv4/ip_forward
1

# iptables -L -v

Chain INPUT (policy ACCEPT 1147K packets, 174M bytes)
pkts bytes target     prot opt in     out     source     destination
   0     0 DROP       all  --  eth0   any     anywhere   10.0.0.0/8

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source    destination

Chain OUTPUT (policy ACCEPT 900K packets, 120M bytes)
 pkts bytes target     prot opt in     out     source    destination

# iptables -L -v -t nat

Chain PREROUTING (policy ACCEPT 15393 packets, 1656K bytes)
 pkts bytes target     prot opt in     out     source    destination

Chain POSTROUTING (policy ACCEPT 19135 packets, 1205K bytes)
 pkts bytes target      prot opt in     out     source     destination
    0     0 MASQUERADE  all  --  any    eth0    10.0.0.0/8 anywhere

Chain OUTPUT (policy ACCEPT 19160 packets, 1208K bytes)
 pkts bytes target     prot opt in     out     source    destination

# lsmod

Module                  Size  Used by    Not tainted
ipt_state               1080   0  (autoclean)
ipt_MASQUERADE          2296   1  (autoclean)
iptable_nat            22456   1  [ipt_MASQUERADE]
ip_conntrack           29960   2  [ipt_state ipt_MASQUERADE iptable_nat]
iptable_filter          2444   0  (autoclean)
ip_tables              16320   6  [ipt_state ipt_MASQUERADE iptable_nat
iptable_filter]
8139too                18312   1


