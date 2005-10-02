From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: Aren't these connections ESTABILISHED? (2nd take)
Date: Sun, 2 Oct 2005 04:02:47 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510020401240.21519@filer.marasystems.com>
References: <dhmn38$hsk$1@sea.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <dhmn38$hsk$1@sea.gmane.org>
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
To: Gioele Barabucci <dev@gioelebarabucci.com>
Cc: netfilter@lists.netfilter.org

On Sat, 1 Oct 2005, Gioele Barabucci wrote:

> Postfix does some DNS lookups on the DNS server (69.93.28.254). After a bit,
> iptables forget that the connection is ESTABILISHED and DROPs the reply.

Probably hits the UDP conntrack timeout. The default is only 30 seconds to 
receive a reply to the initial packet, and DNS can take longer..

Regards
Henrik

