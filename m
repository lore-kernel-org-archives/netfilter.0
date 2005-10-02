From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: Aren't these connections ESTABILISHED? (2nd take)
Date: Sun, 2 Oct 2005 04:16:24 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510020410200.21519@filer.marasystems.com>
References: <dhmn38$hsk$1@sea.gmane.org> <200510011907.27026.rob0@gmx.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510011907.27026.rob0@gmx.co.uk>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: /dev/rob0 <rob0@gmx.co.uk>
Cc: netfilter@lists.netfilter.org

On Sat, 1 Oct 2005, /dev/rob0 wrote:

> Also, I'm not sure it would do anything at all, because there cannot be
> that many --state NEW connections in such a short time. Conntrack would
> call those "RELATED". I think you should try --syn, not --state NEW.

The syn part is correct, but not RELATED.

each time a new connection is seen (unique source/destination/ports) the 
first packet is NEW, simply by the fact that the connection is not yet 
known to conntrack.

conntrack calls syn retransmits on already accepted connections as 
ESTABLISHED.


RELATED is "NEW" on other traffic flows which forms a known related 
connection to a already known connection. For example the data channel in 
the FTP protocol.


NEW is not related to syn, even if most TCP packets with state NEW is syn 
packets. Any packet from a TCP (or UDP) session not yet known to conntrack 
is NEW, even a TCP RST packet.


Regards
Henrik

