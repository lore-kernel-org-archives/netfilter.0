From: aksingh@hss.hns.com
Subject: Reinjecting packets using libipq
Date: Tue, 20 Apr 2004 13:26:34 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF572AD826.46D213EB-ON65256E7C.002B3539@hss.hns.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org





hi

 when I use ip_set_verdict to reinject a packet into the kernel from user
space(suppose the verdict is NF_ACCEPT), what happens ...
1) does the packet get reinjected at the PRE_ROUTING phase ?
2) If so can I be sure that the packet doesnt get caught at the same hook
which first queued it to the user space ?

thanks
Amit


