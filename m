From: aksingh@hss.hns.com
Subject: libipq netlink socket interface
Date: Fri, 7 May 2004 10:58:53 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF3C58D62C.6A8B9FDC-ON65256E8D.001DA6E2@hss.hns.com>
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





Hi,

 I use the libipq library for kernel space / user space communication,
libipq uses netlink sockets for this purpose ..... now can I tune the
rcvbuf and sndbuf sizes for this netlink socket using setsockopt ? If I use
libipq then I believe none of the libipq calls give me the socket
descriptor of the netlink socket being used by the ip_queue module, so how
do I do a setsockopt on this to change the rcvbuf and sndbuf sizes to the
maximum possible ??

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


