From: "Michael J. Tubby B.Sc. \(Hons\) G8TIC" <mike@thorcom.com>
Subject: NAT of Cisco Voice-Over-IP with Skinny protocol and CallManager
Date: Thu, 19 Dec 2002 18:49:19 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001d01c2a78f$56e16850$6401a8c0@int.thorcom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

All,

I have acquired access to a Cisco CallManager (on the internet)
and a pile of Cisco VIP-30 VOIP phones. I have got everything
up and working when they are directly connected to the 'net but
now I want to put some of the phones at friend's houses behind
the Linux boxen that I've built as NAT/firewalls for their cable
modem and ADSL connections...

I'm using RedHat 7.3 but with own compiled 2.4.20 kernel and
iptables 1.2.7a.

Problem is that the phone gets it's directory number and connects
just fine using the Skinny protocol on and TCP:2000 and TFTP on
UDP:69, however the called party can hear me but the return UDPs
don't get back in.

A bit of tcpdump-ing shows that there's no obvious/direct relationship
between the outgoing UDP port numbers on the voice stream and
the incomming reply packets, and hence netfilter/nat has no way
to know what do do unless there's a helper.

Searching on google reveals only a posting from back in the summer
by Fred N. van Kempen about the subject/problem:

http://lists.netfilter.org/pipermail/netfilter-devel/2002-July/008844.html

Does anyone know if there's a fix for this? Is there a helper (connection
tracking) module that can prime the netfilter/DNAT to get the packets
back in by watching the connection set up?

Any help appreciated.

Mike



