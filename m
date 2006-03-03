From: Oleg <sov.rbsec@gmail.com>
Subject: icmp and ip_conntrack
Date: Fri, 3 Mar 2006 21:58:22 +0300
Message-ID: <200603032158.22452.sov.rbsec@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Is it possible that when successfully pinging server, which has conntrack 
enabled, cat /proc/net/ip_conntrack not show icmp entries?

All ping requests/replyes goes both sides (seen in tcpdump)
-- 
Best regards, Oleg


