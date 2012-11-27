From: Safuat Hamdy <safuat.hamdy@secorvo.de>
Subject: Packet forwarding question
Date: Tue, 27 Nov 2012 14:00:57 +0100
Message-ID: <50B4B989.5000705@secorvo.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org



Hello all,

I am performing a security audit for a customer.  They have client
machines (mainly desktop PCs) that need to authenticate regularly (every
few minutes) via 802.1x, which is not accessible for iptables (802.1x is
eap/eapol in wireshark with ethertype 0x888e).  In order to perform a
security scan under the presumption, that the autit machine is not given
access at the gateway, one idea was to write a small program using
libpcap that shovels the frames as necessary to the "other" interface.
But then I came recently across ebtables, which seems to be a suitable
tool.  I read the docs and played with ebtables.  However, so far I had
no success with with what I wanted.  And that's what I need:

Suppose a setup like this

	Gateway - Switch - Pentest Machine - Client PC

The gateway sends regularly 802.1x requests to the client pc, where the
gateway expects the pc to have a known MAC-address and IP-address.  Thus
the pentest machine must appear as client pc (either via address
spoofing or NATing) and just to relay the 802.1x packets forth and back
as necessary (and maybe a few other things such as ARP and DHCP).

The pentest machine has two ethernet interfaces (eth0 and eth1),
ebtables support is enabled (BackTrack 5R3).  I have bridged the two
interfaces together.  Indeed, traffic coming from outside (say through
eth0) is seen on the other side as well (say eth1), but the responses
from the client are absorbed somewhere.

I tried first to spoof the MAC and IP address on the pentest machine,
but then the machine seems to believe that packets with the said MAC
address are destined to itself and doesn't forward them.  So then I
tried MAC-NATing, in which case the pentest machine seems to lose
interest in the packets on the wire at all (i.e. ping an the like
doesn't work) - of course, since the replies have the "wrong" MAC-address.

The ebtables broute table policy for the BROUTING chain was set in both
cases to ACCEPT (i.e. bridge all traffic); the filter table had some
filer rules but the policy for FORWARD was set (for playing) to ACCEPT
as well.  For MAC source NAT I used a rule in the POSTROUTING chain.
However, no matter what I did, I didn't get it to fly as I hoped.

The first question is whether ebtables is the right tool to look at, and
if so, the second question is how to wield it.  Has anyone reading here
some hints in that direction?


Thanks

S. Hamdy
