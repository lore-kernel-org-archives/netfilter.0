From: aksingh@hss.hns.com
Subject: NF_IP_LOCAL_OUT
Date: Wed, 21 Apr 2004 13:08:24 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF1BAADCEB.024C8E89-ON65256E7D.0029A15D@hss.hns.com>
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
Cc: "Jee J.Z." <jz105@york.ac.uk>, Sven Schuster <schuster.sven@gmx.de>





Hi

  I had a doubt in NF_IP_LOCAL_OUT hook ... suppose we use raw sockets or
packet sockets or libnet apis(like libnet_write .. when context is raw) to
send data from user space to kernel ip ... here when the packet reaches the
ip, what would be the first netfilter hook it hits, the NF_IP_LOCAL_OUT
hook or the NF_IP_PRE_ROUTING hook. I feel it should hit NF_IP_LOCAL_OUT
but I am not sure, can somebody confirm ?

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


