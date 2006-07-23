From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Use of ipt_statistic
Date: Sun, 23 Jul 2006 18:28:50 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0607231809080.26586@yvahk01.tjqt.qr>
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

Hello,


in 2.6.18-rc1, ipt_statistics has been merged to supercede ipt_random and 
ipt_nth. But the current userspace iptables (svn) does not have any code 
for ipt_statistics.


Jan Engelhardt
-- 

