From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: DNAT in mangle
Date: Fri, 3 Dec 2004 09:39:19 +0100 (MET)
Message-ID: <Pine.LNX.4.53.0412030938100.12707@yvahk01.tjqt.qr>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,


the DNAT target seems to be only valid in the nat table. As such, something
like "telnet localhost 8000" (where iptables -t nat -A PREROUTING -p tcp
--dport 80 -j DNAT 192.168.1.17:80) does not work.
What is the correct solution -- besides rinetd -- to do this kind of
forwarding?


Jan Engelhardt
-- 
ENOSPC

