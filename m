From: <listuser@sally.epygi.de>
Subject: RE: IPSec Transport Mode
Date: Wed, 7 Jul 2004 16:32:21 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BDEHJGPIKNLKJJBCCFPLOEIMCOAA.listuser@sally.epygi.de>
References: <200407071453.49223.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407071453.49223.Antony@Soft-Solutions.co.uk>
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
To: NetFilter Mailling List <netfilter@lists.netfilter.org>

HiHo!

NAT-T (or nat-traversal) is the also a solution as you stated yourself.
It is also available for several other IPsec solutions.
Yet for FreeSwan you need at least a patch (nat-traversal) or use
superfreeswan (www.freeswan.ca) . I don't know about
other implementations, esp the new derived ones.

Nat-traversal encapsulates the complete packets into yet another UDP
packet destenied for port 4500. This can be natted as usual. The
otherside simply has to pick the ipsec packet from the udp packet.
So NAT-T must be used on both sides, yet it has the advantage that 
it is more transparent.

ciao
  markus
 



