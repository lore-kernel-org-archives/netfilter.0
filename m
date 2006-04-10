From: "James Harper" <james.harper@bendigoit.com.au>
Subject: MAC address SNAT
Date: Mon, 10 Apr 2006 14:18:55 +1000
Message-ID: <AEC6C66638C05B468B556EA548C1A77DCEBF6A@trantor>
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

I am trying to find a way of doing virtual MAC addresses under Linux,
and it occurred to me that it could be done with netfilter based on the
following pieces of the puzzle:

1. a way of responding to arp requests with the new MAC address
(arptables to mangle the MAC address in the arp response)
2. a way of accepting packets with the different MAC address (promisc
mode on the interface)
3. a way of SNAT-ing the MAC address in outgoing packets (the missing
piece)

In fact, #3 almost wouldn't be required if hosts on the network didn't
mind ip packets coming at them with a different MAC addresses to what
was in their arp tables.

Unfortunately the device I'm trying to talk to uses the source MAC
address on the arp-reply packet, not the MAC address in the packet
itself. Clearly my device is broken, but I'm stuck with it.

I originally thought ebtables might be able to do what I want, but I'm
not using a bridge and it can't SNAT OUTPUT packets anyway.

Could a SNAT MAC address target be written for iptables, or does
iptables 'finish' too early in the packet traversal for the MAC address
to be decided on yet?

Suggestions?

Thanks

James


