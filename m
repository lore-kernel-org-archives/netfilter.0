From: aksingh@hss.hns.com
Subject: loop problem
Date: Wed, 21 Apr 2004 12:08:33 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF5A3E4536.070CB617-ON65256E7D.0023533F@hss.hns.com>
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





Hi All

   I am getting into a loop as i capture packets from the kernel using
netfilter hooks ... if somebody has encountered this problem before or has
a solution please respond .

I will explain the scenario here :

  capture packets using the netfilter PRE_ROUTING(all packets coming from
outside this machine wld be captured here) and  and the NF_IP_LOCAL_OUT
loop(all packets that are going out of my machine would be captured here).
Then I do a bit of packet mangling in the user space by returning NF_QUEUE
from these two hook functions , my user space process which gets the
packets can do two things, it can either reinject the same into the kernel
... by setting the verdict in ip_set_verdict  as NF_ACCEPT .... or it can
generate(absolutely new packets) its own packets which it wants to send to
the kernel. I use libnet to inject these new packets, my context in libnet
is RAW. Now when these newly injected packets reach the ip( the ones that
were reinjected .. using the ip_set_verdict call are handled fine ... no
problems there) , they are caught by my NF_IP_LOCAL_OUT hook and handed
back to my user space appliaction, i dont want this to happen. what can i
do here to prevent this loop.

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


