From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: Redirecting iptables I/O
Date: Thu, 6 Oct 2005 18:54:34 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510061852550.31577@filer.marasystems.com>
References: <1128366906.2796.86.camel@dulcevida>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1128366906.2796.86.camel@dulcevida>
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
To: Earl Eiland <eee@nmt.edu>
Cc: netfilter@lists.netfilter.org

On Mon, 3 Oct 2005, Earl Eiland wrote:

> I want to run some IP traffic previously captured using tcpdump through
> iptables and save the passed traffic in another tcpdump file.  How do I
> go about this?

Perhaps tcpreplay.sourceforge.net can be of some use?

To record teh passed traffic you use tcpdump.


