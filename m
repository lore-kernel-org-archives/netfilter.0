From: aksingh@hss.hns.com
Subject: ipq_set_verdict
Date: Tue, 20 Apr 2004 15:26:52 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF99855CB4.5A120950-ON65256E7C.00357431@hss.hns.com>
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

  I thought of a way of reinjecting absolutely new packets into the kernel
.... suppose i call ip_set_verdict (this in turn calls nf_reinject) to
inject packets into the kernel)for the new packets that a user space
process generates. nf_reinject has a parameter nf_info which probably tells
the kernel from which hook was this packet captured and hence from where to
continue when this is reinjected(from the next hook onwards). Now, suppose
I have a PRE_ROUTING hook that captures the packets and sends it to my user
space process. This process might  return some packets to be reinjected and
might generate some of its own that it wants injected into the kernel (from
pre_routing stage but bypassing the netfilter PRE_ROUTING hook) .. for
these newly generated packets I can use the same nf_info param i used for
the packets that i captured from the kernel and that will make the kernel
think that they were captured by the PRE_ROUTING hook and so after
reinjection continue from after the PRE_ROUTING hook....so for these
packets routing decision would be taken after injection and hence these
newly packets cld either be outbound(going to the wore) or inbound (the
ones that need to travel up the stack from ip).

This sounds good to me but can this be done or am i thinking on wrong lines
here. Please suggest if im wrong.

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


