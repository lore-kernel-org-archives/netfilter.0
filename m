From: aksingh@hss.hns.com
Subject: ip_queue.o and libipq
Date: Wed, 26 May 2004 10:45:23 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF35BDBBAA.9AF2C01B-ON65256EA0.001C4D30@hss.hns.com>
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
Cc: Sven Schuster <schuster.sven@gmx.de>, jz105@york.ac.uk, Paul Albert <palbert@rovingplanet.com>





Hi,

   Does anybody have an idea which function of ip_queue.c is invoked when
a userland process does a ipq_read ?
Also, once a NF_QUEUE is returned by a netfilter hook and till the packet
is copied to userland by ipq_read how many copies are involved ?.

I believe there is just one copy when the packet is copied from sk_buff in
the queue maintained by ip_queue is copied to the buffer supplied by
ipq_read ? or are there more involved ?

also --- is netfilter server down ? havent received any mails since the
last two days, there seems to be no problem at my mail server ?

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


