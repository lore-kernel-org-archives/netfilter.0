From: David Cary Hart <Fedora@TQMcube.com>
Subject: Logging Packets via NFNETLINK
Date: Wed, 30 Aug 2006 12:05:00 -0400
Message-ID: <20060830120500.2fb6c43e@dch.TQMcube.com>
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

We are getting DDoS'd again - behold the flood.

Fortunately, I did some tweaking last week (compiling in STRING) and
- while the attack is more pervasive - the impact is relatively
insignificant.

Under stress, should I be logging from user space or with the ipt_log
target? Is there any difference in cycles either way?

-- 
      Do NOT Send Email to <spam trap> Fedora@TQMcube,com
Our DNSRBL - Eliminate Spam at The Source: http://www.TQMcube.com
               Don't Subsidize Criminals: http://boulderpledge.org

