From: aksingh@hss.hns.com
Subject: NF_QUEUE problem
Date: Mon, 19 Apr 2004 14:09:40 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF1A2286A6.0D6674D2-ON65256E7B.002EDAFD@hss.hns.com>
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

   I wanted some help on NF_QUEUE ...
http://uqconnect.net/~zzoklan/documents/netfilter.html tells me how
netfilter hooks are used, but it does not discuss much the hook return code
NF_QUEUE. I looked at a couple of other places for this return code and
user space handling of a queued packet but could not find much help(i
looked at http://www.stearns.org/iptables/netfilter-hacking-HOWTO.txt ).

I am interested in making a module that
1) registers its NF_IP_PRE_ROUTING hook
2) gets every kernel packet b4 the routing decision is made
3) returns the code NF_QUEUE and hence the packet gets queued to a user
space application, which decides whether it wants to return the packet to
the kernel for it to follow the normal kernel path again, or whether it
wants the kernel to drop the sk_buff for that packet.

Point number 3 is really confusing as I am not able to find any specific
help on the net .... i.e what happens after a hook function returns
NF_QUEUE as its return code and how does the user process get the queued
packet and how does it reinject it into the kernel.

Can someone pls tell me where to find help for this on the net.

many thanks in advance,
Amit




test@seaconindia.com@lists.netfilter.org on 04/19/2004 10:37:22 AM

Sent by:    netfilter-admin@lists.netfilter.org


To:    netfilter@lists.netfilter.org
cc:

Subject:    DNAT Problem


Hi All

I am new to Iptables & Firewall. I have 2 servers (web & email) running
behind firewall. I have DNAT rule on my firewall, so any request hitting
on port 25, 80, 110 are DNAT to internal servers. Inturn my internal
servers (web & email) feel these requests were received from firewall ie
internal ip and can be trusted.

I want these DNAT request to be forward with their original ip address and
not as coming from firewall ip.

Please advice my firewall rule is as follows :

iptables -t nat -A PREROUTING -p tcp -i eth1 --dport 25 -j DNAT --to
192.168.0.175:25

Regards

Joel




