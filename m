From: "Kellogg, Chris" <Chris.Kellogg@dyncorp.com>
Subject: Nested targets
Date: Tue, 29 Oct 2002 17:08:41 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BC6421B0F2CC4C43897842092E0E00A94C1906@tx1ex1nt.dyncorptx.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Hi, everyone.

I am encountering a problem where packets are not being handled correctly
after being passed through several custom chains.

Each custom chain has error checking and a log/drop rule combo for the last
two rules.  Here is how a valid packet should traverse my custom chain
structure.  Example is a packet flowing from a client to a DNS server to
start a new connection.

Client -> FORWARD (Builtin) -> SRC -> LANSRC -> DST -> DNSSRVDST -> Server

The client sends the packet, received by the firewall.
The packet is first handled by the FORWARD Chain, `-j SRC` for source
handling.
The SRC chain determines the client is on the LAN and `-j LANSRC`.
The source IP, port, protocol, options are all verified as acceptable; the
packet `-j DST`s
The DST chain determines the protocol is destined for DNS, `-j DNSSRVDST`
The DNSSRVDST chain checks the destination address, port, and protocol, and
-j ACCEPTs.

Instead, the packet does this:

Client -> FORWARD (Builtin) -> SRC -> LANSRC -> DST -> DNSSRVDST -> Default
Drop

All is good until the packet enters the DNSSRVDST chain.  The packet is
dropped with my default log/drop rulepair at the end of the chain:

Oct 23 07:01:41 tx1fw02 kernel: Unmatched DNSSRVDST IN=eth0 OUT=eth3
SRC=cli.ent.ip.add DST=DNS.SRV.ip.add LEN=62 TOS=0x00 PREC=0x00 TTL=126
ID=4028 PROTO=UDP SPT=1178 DPT=53 LEN=42

The DNSSRVDST Chain:
$ipt --new DNSSRVDST 2>/dev/null
$ipt -A DNSSRVDST -p udp --dport 53 -j ACCEPT
$ipt -A DNSSRVDST -p tcp --dport 53 -j ACCEPT
*SNIP*...SSH connections for management -J ACCEPTs...*SNIP*
$ipt -A DNSSRVDST -j LOG --log-level warn --log-prefix "Unmatched DNSSRVDST
"
$ipt -A DNSSRVDST -j DROP

I'm at a loss why this would occur.  I'm open to ideas on what the cause
might be, as well as better ways of building my firewall script.  The
firewall has 4 interfaces, 2 are untrusted (RAS, Wireless), one is secured
for protected servers, the last is for the general LAN.

I am running iptables v1.2.6a, kernel v2.4.18 w/patches from iptables
1.2.6a.

Thanks!

Cheers,

Chris.

Christopher M. Kellogg, GCFW
Infrastructure Administrator, DynCorp IT 
6500 West Freeway Suite 600, Fort Worth, TX

