From: aksingh@hss.hns.com
Subject: ipq_read and NF_ACCEPT
Date: Tue, 1 Jun 2004 18:06:49 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF05930183.BCDDA269-ON65256EA6.0044B86F@hss.hns.com>
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
To: Sven Schuster <schuster.sven@gmx.de>, "Jee J.Z." <jz105@york.ac.uk>
Cc: netfilter@lists.netfilter.org





hi,

   i have made an application that reads using libipq functions, and a
kernel module which delivers packet to it. I catch packets originating from
the local machine, and in my user space libipq application i change the
packet (that i get using ipq_read), set its mark field, change src/dest and
then finally return a return code of NF_ACCEPT,
   so this changed packet should go back to the kernel right ?, (this
   packet i had caught in local_out hook).
   Once i inject this packet, i expect the same apcket(with changed ip and
   all) to hit post routing, so in my post routing hook function i wait for
   a packet with skb->nfmark==some value, but this packet doesnt seem to be
   getting caught at post_routing ??

any clues ?

thanks
Amit


