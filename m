From: Arindam Haldar <arindamhaldar@inbox.lv>
Subject: PLs HELP !
Date: Fri, 31 May 2002 09:44:31 +0530
Sender: netfilter-admin@lists.samba.org
Message-ID: <3CF6F8A7.3010501@inbox.lv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.samba.org

hi to u all again !
i posted the below message yestreday... this log message keeps on commng 
in the messages file EVERY 1min & hence is filing up the disc space 
given for /var/log
pls .. i need some direction in knowing what could be the possible 
problem !..
Thanking u all in advance...
this is the message posted earlier.....

hi all,
i am getting these messages in my /var/log/messages..
can someone tell me whats hapenning here..
iptables v1.2.7-2--2-423 with  kernel 2.4.18 & patched htb3.3-020512 & 
imq-2.4.18...
May 30 05:09:58 cab1 kernel: ASSERT: ip_nat_core.c:840 
&ip_conntrack_lock not readlocked
May 30 05:10:04 cab1 kernel: ASSERT ip_nat_core.c:739 
&ip_conntrack_lock_R71150de5 readlocked
May 30 05:10:04 cab1 kernel: ASSERT ip_conntrack_core.c:91 
&ip_conntrack_lock_R71150de5 readlocked
May 30 05:10:04 cab1 kernel: ASSERT: ip_nat_core.c:743 
&ip_conntrack_lock not readlocked
May 30 05:10:04 cab1 kernel: ASSERT ip_conntrack_core.c:973 
&ip_conntrack_lock not readlocked
May 30 05:10:04 cab1 kernel: ASSERT: ip_nat_core.c:840 
&ip_conntrack_lock not readlocked
May 30 05:10:04 cab1 kernel: ASSERT ip_nat_core.c:739 
&ip_conntrack_lock_R71150de5 readlocked
May 30 05:10:04 cab1 kernel: ASSERT ip_conntrack_core.c:91 
&ip_conntrack_lock_R71150de5 readlocked
May 30 05:10:04 cab1 kernel: ASSERT: ip_nat_core.c:743 
&ip_conntrack_lock not readlocked
May 30 05:10:04 cab1 kernel: ASSERT: ip_nat_core.c:840 
&ip_conntrack_lock not readlocked
[root@cab1 root]#

awaiting reply
a.h


