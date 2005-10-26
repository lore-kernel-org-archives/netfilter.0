From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: --state NEW -j DROP (would be great)
Date: Wed, 26 Oct 2005 07:47:36 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510260745420.21043@filer.marasystems.com>
References: <001501c5d9ef$62a26c30$0510a8c0@cornerpc>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001501c5d9ef$62a26c30$0510a8c0@cornerpc>
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
To: Sylvan Andrew <sylvan_nids@norfolk.nf>
Cc: netfilter@lists.netfilter.org

On Wed, 26 Oct 2005, Sylvan Andrew wrote:

> Hello,
>
> Could somebody please explain the  'iptables -A INPUT -eth0 -m state --state 
> NEW -j DROP' a bit more for me ?  I understand that it won't allow any 
> outside initiated inbound connections into a network.

Correct.

> However occasionally if 
> I'm doing a tcpdump we see things like:
>
> 21:04:48.935367 IP 82.29.180.221.15378 > 213.17.40.204.4154: R 0:0(0) ack 1 
> win 0

These are INVALID, not part of any connection.

So if you use

-i eth0 -m state --state NEW,INVALID -j DROP

you should see the expected result..

Regards
Henrik

