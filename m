From: "Joe Clark" <joeclark@iastate.edu>
Subject: Problems Compiling userspace NF_QUEUE handler
Date: Sun, 12 Sep 2004 22:01:14 -0500 (CDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1412212810402551@webmail.iastate.edu>
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Okay, well I did more research tonight, and I'm thinking now that perhaps I
shouldn't be trying to do this nf_reinject stuff in userspace, but rather that's
handled for me by the "libipq" stuff in iptables.  I was attempting to do this
without iptables (because I thought that would be simpler), but maybe that's not
wise (or not possible).

Tangent: Have you folks considered setting up a forum instead of a mailing list?
 Maybe a mailing list is more effective, but I haven't found a way to search
this list, which makes it hard to know what has been asked 100 times before...
- Joe



