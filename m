From: "Kellogg, Chris" <Chris.Kellogg@dyncorp.com>
Subject: REJECT target and Source NAT
Date: Tue, 5 Nov 2002 08:42:19 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BC6421B0F2CC4C43897842092E0E00A94C1938@tx1ex1nt.dyncorptx.com>
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

I'm thinking about a series of obfuscation rules to try to reduce firewall
visibility.  I've got a few ideas and resulting questions hopefully someone
might be able to shed some light on.

I'd like to make an IPTables firewall reject packets with an
ICMP-Host-Unreachable, but also change the source address of the packet to
be the gateway router instead of the firewall itself.  Naturally, this could
cause the border router to get a little nervous, but with a little creative
access-list work it could be pretty safely implemented.

This raises a question about ICMP packets created by the REJECT target.  Are
these packets passed through the OUTPUT chain of the firewall?  If they are,
it might be possible to use SNAT to make an IPTables firewall more difficult
to detect and determine.  Perhaps with clever use of the TOS and MANGLE
targets, you could make the packets less consistent with typical Linux
systems, perhaps fooling even the intermediate scanner/attacker.

Opinions?  Comments?

Chris.

Christopher M. Kellogg, GCFW
Infrastructure Administrator, DynCorp IT 
6500 West Freeway Suite 600, Fort Worth, TX
(817)570-1956 Ofc / (817)737-1638 Fax

