From: aksingh@hss.hns.com
Subject: NF_IP_LOCAL_OUT
Date: Tue, 27 Apr 2004 15:45:29 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF596492DE.CDD1ECA3-ON65256E83.00377D3E@hss.hns.com>
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





hi,

  I have a doubt regarding the NF_IP_LOCAL_OUT hook, suppose i use libnet
to inject some packets into the kernel ..... the dest ip address of this
packet is my own linux box( the same box that is injecting those packet).
Now, the netfilter NF_IP_LOCAL_OUT hook catches those packets, and the
routing decision is taken after this hook is passed, what happens after
this, since these packets are destined to this machine, do these packets go
to the wire then again the ethernet card of this machine catches these
packets (i.e a new sk_buff is again assigned for them etc) or do they
retain their old sk_buff and are directly sent to the application waiting
for them ?

diagram wld help

ip_packet(dest add==ip addr of this machine) ----> NF_IP_LOCAL_OUT hook
--->routing decision --> wire(old sk_buff freed) --> ethernet card ---> new
sk_buff ---> NF_IP_PRE_ROUTING hook ---> application on this machine
waiting for this packet.(as part of this new sk_buff)

or,

ip_packet(dest add==ip addr of this machine) ----> NF_IP_LOCAL_OUT hook
--->routing decision -->application on this machine waiting for this packet
(as part of its old sk_buff itself)


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


