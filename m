From: Robert Nichols <rnicholsNOSPAM@comcast.net>
Subject: Handling bad tcp checksums
Date: Mon, 08 Aug 2005 17:59:29 -0500
Message-ID: <dd8o4i$hjr$1@sea.gmane.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I've run into a problem handling tcp packets that have incorrect
checksums.  It appears that such packets are assigned state INVALID,
and thus are never treated as part of an ESTABLISHED connection.
Thus, dropping such packets becomes the responsibility of the firewall. 
  The problem is that unsolicited SYN,ACK packets are also matching
"--state INVALID", and for these the proper action is to send tcp-reset. 
  I cannot risk sending tcp-reset for an incorrect checksum -- the result
would be that a transmission error would cause the connection to drop.
If I test "--flags SYN,ACK SYN,ACK" then I run the risk of basing my
decision on the flags in a possibly corrupted packet.

Iptables doesn't seem to have any way to match on incorrect checksums.
It looks like the best I can do is check the flags and accept the
possibility that they are corrupted.

Suggestions?

BTW, doesn't this mean that _all_ iptables matches are testing data
that is possibly corrupted?

-- 
Bob Nichols         Yes, "NOSPAM" is really part of my email address.


