From: Alexey Talikov <alexey_talikov@texlab.com.uz>
Subject: Re: PLs HELP !
Date: Fri, 31 May 2002 09:13:55 +0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <XVQFCQNHBPO09ZUFD43212WRP2VYVJH.3cf6f883@ALEXEY>
References: <3CF6F8A7.3010501@inbox.lv>
Reply-To: alexey_talikov@texlab.com.uz
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3CF6F8A7.3010501@inbox.lv>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org, Arindam Haldar <arindamhaldar@inbox.lv>

This messages appear with traffic or not ??

31.05.2002 9:14:31, Arindam Haldar <arindamhaldar@inbox.lv> wrote:

>hi to u all again !
>i posted the below message yestreday... this log message keeps on commng 
>in the messages file EVERY 1min & hence is filing up the disc space 
>given for /var/log
>pls .. i need some direction in knowing what could be the possible 
>problem !..
>Thanking u all in advance...
>this is the message posted earlier.....
>
>hi all,
>i am getting these messages in my /var/log/messages..
>can someone tell me whats hapenning here..
>iptables v1.2.7-2--2-423 with  kernel 2.4.18 & patched htb3.3-020512 & 
>imq-2.4.18...
>May 30 05:09:58 cab1 kernel: ASSERT: ip_nat_core.c:840 
>&ip_conntrack_lock not readlocked
>May 30 05:10:04 cab1 kernel: ASSERT ip_nat_core.c:739 
>&ip_conntrack_lock_R71150de5 readlocked
>May 30 05:10:04 cab1 kernel: ASSERT ip_conntrack_core.c:91 
>&ip_conntrack_lock_R71150de5 readlocked
>May 30 05:10:04 cab1 kernel: ASSERT: ip_nat_core.c:743 
>&ip_conntrack_lock not readlocked
>May 30 05:10:04 cab1 kernel: ASSERT ip_conntrack_core.c:973 
>&ip_conntrack_lock not readlocked
>May 30 05:10:04 cab1 kernel: ASSERT: ip_nat_core.c:840 
>&ip_conntrack_lock not readlocked
>May 30 05:10:04 cab1 kernel: ASSERT ip_nat_core.c:739 
>&ip_conntrack_lock_R71150de5 readlocked
>May 30 05:10:04 cab1 kernel: ASSERT ip_conntrack_core.c:91 
>&ip_conntrack_lock_R71150de5 readlocked
>May 30 05:10:04 cab1 kernel: ASSERT: ip_nat_core.c:743 
>&ip_conntrack_lock not readlocked
>May 30 05:10:04 cab1 kernel: ASSERT: ip_nat_core.c:840 
>&ip_conntrack_lock not readlocked
>[root@cab1 root]#
>
>awaiting reply
>a.h
>
>

-----------------------------------
mailto:alexey_talikov@texlab.com.uz
BR
Alexey Talikov
FORTEK
-----------------------------------



