From: aksingh@hss.hns.com
Subject: using libnet and libipq in a c program
Date: Mon, 5 Jul 2004 21:02:34 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OFA838BE49.9A8D8C27-ON65256EC8.00551177@hss.hns.com>
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
To: libnet@securityfocus.com
Cc: netfilter@lists.netfilter.org





Hi,

   I tried compiling a program that uses both libnet and libipq, for
libnet
 I have to include libnet.h and for libipq, libipq.h, but libipq.h
includes
 ip_queue.h, which inturn includes linux/if.h. Also, libnet.h includes
 net/if.h, now this creates problems during compilation(redefinition of
some structures), I had to comment
 out include<net/if.h> from libnet to compile the program, Has anybody
faced this problem, can you suggest me a better way to overcome this that
commenting out a line in libnet.h ??

thanks
Amit
"DISCLAIMER: This message is proprietary to Hughes Software Systems Limited
(HSS) and is intended solely for the use of the individual to whom it is
addressed. It may contain  privileged or confidential information and
should not be circulated or used for any purpose other than for what it is
intended. If you have received this message in error, please notify the
originator immediately. If you are not the intended recipient, you are
notified that you are strictly prohibited from using, copying, altering, or
disclosing the contents of this message. HSS accepts no responsibility for
loss or damage arising from the use of the information transmitted by this
email including damage from virus."


