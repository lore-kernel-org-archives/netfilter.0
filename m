From: Lucky Leavell <netfilter@UniXpress.com>
Subject: LOG Rate Limit Problem
Date: Mon, 4 Oct 2004 21:04:32 -0400 (EDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <Pine.LNX.4.58.0410042052580.10057@ris713.UniXpress.com>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

iptables v1.2.8
OS: SuSE 9.1

After reading several references here on rate limiting logging I tried the 
following short chain which was intended to log a packet subject to the 
rate limit and then drop it unconditionally:

-A LogDrop  -m limit --limit 2/s -j LOG --log-prefix "ICMP:Drop "
-A LogDrop -physdev --physdev-in eth0 -j DROP
-A LogDrop -physdev --physdev-in eth1 -j DROP

However, the first statement not only logged the packets subject to the 
rate limit but also acted as an implicit ACCEPT.  My understanding was 
that the logging should take place but then the packets should be dropped 
unconditionally by one of the following DROPs. When the LOG statement was 
commented out, the packets were dropped as desired.

I have reread my documentation and still do not see where my mistake is.
Could someone please enlighten my understanding>

Thank you,
Lucky Leavell 


