From: Jan Du Caju <Jan.DuCaju@kuleuven.net>
Subject: Re: netfilter efficiency
Date: Sat, 22 Jan 2005 11:12:05 +0100
Message-ID: <20050122101205.GC7171@kuleuven.net>
References: <005c01c4ff19$508ade80$c0de623e@MAURO>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <005c01c4ff19$508ade80$c0de623e@MAURO>
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
Content-Transfer-Encoding: 7bit
To: MauroTablo' <m.tablo@libero.it>
Cc: netfilter@lists.netfilter.org

Hi,

On Thu, Jan 20, 2005 at 06:56:04PM +0100, MauroTablo' wrote:
> Hi all.
> My Linux (+ iptables) based firewall has about 90 forward filtering rules, for tcp packets (about 30 rules), udp datagram (about 40 rules) and icmp messages(about 20 rules).
> Suppose that it comes a transit tcp packet that doesn't match anyone of my rules. So, the last rule will be applied, because it is the first one that matches the packet (/sbin/iptables -A FORWARD -j DROP)
> 
> The question is: iptables confronts the TCP packet with all my 90 rules, or it confronts the packet ONLY WITH rules for tcp packets (-p tcp)?
> In other words, is there a function in netfilter that looks up to the protocol type of a transit packet and decides which rules to confront the packet with?

You should consider hipac (http://www.hipac.org) 
Quote from their webside:
 iptables, like most packet filters, uses a simple packet classification
 algorithm which traverses the rules in a chain linearly per packet
 until a matching rule is found (or not). Clearly, this approach lacks
 efficiency. As networks grow more and more complex and offer a wider
 bandwidth linear packet filtering is no longer an option if many rules
 have to be matched per packet. Higher bandwidth means more packets per
 second which leads to shorter process times per packet.

 With nf-HiPAC we offer a novel framework for packet classification which
 uses an advanced algorithm to reduce the number of memory lookups per
 packet. It is ideal for environments where large rulesets and/or high
 bandwidth networks are involved. Thereby, the iptables' semantics of the
 rules is preserved, i.e. you can construct your rules like you're used
 to. From a user's point of view there is no need to understand anything
 about the HiPAC algorithm.

At the hipac site you will find a comparison with iptables. The central
firewall of our university ( http://www.kuleuven.ac.be/english/ ) uses
hipac and we are very pleased with it. At the moment there is only an
implementation for a 2.4 kernel but the developers are working on a 
2.6 version :-)

Hope this helps,
Jan.
--------------------------------------------------- KULeuvenNet -------         
Jan.DuCaju@kuleuven.net         http://www.kuleuven.net/e_index.html
K.U.Leuven                      http://www.kuleuven.ac.be/english/
LUDIT - KULeuvenNet             http://ludit.kuleuven.be/index_en.html
de Croylaan 52A                 3001 Leuven                     Belgium         
-----------------------------------------------------------------------

