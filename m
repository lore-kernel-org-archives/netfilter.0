From: aksingh@hss.hns.com
Subject: POST ROUTING and LOCAL IN
Date: Mon, 24 May 2004 20:07:05 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF3618AF1F.0C8F7861-ON65256E9E.004EED3B@hss.hns.com>
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
Cc: Sven Schuster <schuster.sven@gmx.de>





Hi

   I have a kernel module that has hook call back functions for both
POST_ROUTING and LOCAL_OUT.

If I insert a new raw packet into the kernel with the dest ip address == ip
address of this machine(the same  machine on which hooks functions lie)
then the packets are caught by POST_ROUTING and NOT by IP_LOCAL_OUT and if
i insert a packet with ip address==some other ip(other than this machine's
ip address), they are first caught by the LOCAL_OUT hooks function.  Can
someone explain this .

This effectively means that only those packets hit IP_LOCAL_OUT hook fn
that come from applications on this machine and are destined to go out.
(addressed to same machine do not hit this hook).
And all packets originating from this machine hit POST_ROUTING hook.
irrespective of whether the dest ip address is of this machine or someother
machine.(offcourse IP_POST_ROUTING is also hit in another scenarios but
here I am concentrating on packets originating from the host machine
itself).

Even rustys unreliable guide says
"The NF_IP_LOCAL_OUT [5] hook is called for packets that are created
  locally.  Here you can see that routing occurs after this hook is
  called: in fact, the routing code is called first (to figure out the
  source IP address and some IP options): if you want to alter the
  routing, you must alter the `skb->dst' field yourself, as is done in
  the NAT code.". But this is incomplete, NF_IP_LOCAL_OUT is hit for those
local packets that have foriegn destinations. And also in the hook
traversal diagram we should probably have a different arrow showing packets
that hit IP_POST_ROUTING but do not hit IP_LOCAL_OUT (locally generated
packets with local destination ip address, i.e ip address of the host
machine ).


regards
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


