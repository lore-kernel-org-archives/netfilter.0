From: "Patrick Ahler" <patrick@vikus.com>
Subject: Packet Sniffing
Date: Mon, 14 Apr 2003 15:30:27 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <ABEKJILKOKKGGDJKHKDFGEKFCAAA.patrick@vikus.com>
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
To: netfilter EMAIL <netfilter@lists.netfilter.org>

Using iptables as a firewall/gateway/router machine for my stub network.
Using snat and dnat to translate internal ip's to public and vice versa.

Want to setup a machine inside the network to packet sniff. I was hoping
iptables could do this. What I'd like is if iptables would route each
incoming packet to the correct machine, but also direct it to the packet
sniffer (in other words duplicate the packet and send to 2 destinations).

Just wondering if this is possible and if it is how can I set this up? I've
also tried doing all my packet sniffing off the firewall, but I've been
unsuccessful, can't seem to get ethereal to look at the forwarded packets.
If someone knows a way to successfully do setup either solutions please let
me know.

Thanks,
Patrick



