From: "Ian E. Morgan" <imorgan@webcon.ca>
Subject: Filtering _outgoing_ 2.6 ipsec
Date: Fri, 20 Feb 2004 13:57:30 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.58.0402201251460.7594@light.int.webcon.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
ReSent-To: netfilter@lists.netfilter.org
ReSent-Message-ID: <Pine.LNX.4.58.0402201420020.7594@light.int.webcon.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Having the same difficulty as many others trying to come up with a sane way
fo filter non-IPSEC traffic with Netfilter and Linux 2.6.x.

Several of the ideas relating to the use of MARK's makes a lot of sense and
is about the same as what I'd figured out on my own already.

Problem is, every solution I've seen so far only accounts for making sure
that _incoming_ packets are encrypted. I need to make sure that _outgoing_
packets are encrypted too, and I think this will do it:

#eth0=Internet-facing-interface
$VPN=192.168.0.0/16

#1
iptables -t mangle -A FORWARD -o eth0 -p esp -m mark --mark 2 -j MARK --set-mark 1
iptables -t mangle -A OUTPUT -o eth0 -p esp -m mark --mark 2 -j MARK --set-mark 1

#2
iptables -t filter -A FORWARD -o eth0 -m mark --mark 2 -j DROP
iptables -t filter -A OUTPUT -o eth0 -m mark --mark 2 -j DROP

#3
iptables -t mangle -A FORWARD -o eth0 -d $VPN -j MARK --set-mark 2
iptables -t mangle -A OUTPUT -o eth0 -d $VPN -j MARK --set-mark 2

#4
iptables -t filter -A FORWARD -o eth0 -p esp -m mask --mark 1 -j ACCEPT
iptables -t filter -A OUTPUT -o eth0 -p esp -m mask --mark 1 -j ACCEPT

#5
iptables -t filter -A FORWARD -o eth0 -p esp -j DROP
iptables -t filter -A OUTPUT -o eth0 -p esp -j DROP


This is untested, but the idea is:

Packet traverses firewall twice: once before encryption (stage 1), and again
after encryption (stage 2).

Stage 1:

- #1 skips the packet, it's not yet encrypted
- #2 the packet is not yet marked, so skip it
- #3 if the packet is destined to the VPN, set mark 2.

-> Here, the kernel encrypts the packet for the VPN, retaining mark 2.

Stage 2: (a packet for the VPN is now encrypted and marked 2)

- #1 packet is ESP w/ mark 2, so rewrite the mark to 1.
- #2 skips the packet (not mark 2)
- #3 skips the packet (desination will now be the remote gateway's real IP)
- #4 packet is ESP w/ mark 1, accept the packet

If the kernel IPSEC is off, then Stage 2 will look different:

Stage 2: (unencrypted packet)

- #1 skipped (packet not esp)
- #2 packet has mark 2, so DROP it.


Anybody care to comment on this method or poke holes in my theory?

Regards,
Ian Morgan

-- 
-------------------------------------------------------------------
 Ian E. Morgan          Vice President & C.O.O.       Webcon, Inc.
 imorgan at webcon dot ca       PGP: #2DA40D07       www.webcon.ca
    *  Customized Linux Network Solutions for your Business  *
-------------------------------------------------------------------

