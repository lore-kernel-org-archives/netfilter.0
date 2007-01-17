From: george <gk@t-t-l.co.uk>
Subject: Filtering in PREROUTING
Date: Wed, 17 Jan 2007 21:38:24 +0000
Message-ID: <1169069905.10134.18.camel@len.t-t-l.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

I've seen a few places telling me that you shouldn't filter in the
mangle table.  However, it seems sensible to me to drop junk packets in
PREROUTING rather than have to duplicate those rules in both INPUT and
FORWARD.

Having done this, I'm seeing packets dropped as invalid when I would
expect them to be OK (but most traffic is behaving as expected).  Before
I start digging into this I want to check if filtering in the mangle
table really is stupid.

Can anyone explain this to me, or point me somewhere that will tell me
please.  I haven't found anything other than a simple statement
anywhere.

Thanks,
George.


