From: "Sebastian" <netfilter@basti79.de>
Subject: Confusion about QUEUE and NETLINK
Date: Sat, 19 Jul 2003 21:09:22 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000201c34e29$44671da0$0200a8c0@basti79>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: Netfilter Mailinglist <netfilter@lists.netfilter.org>

Hi list...

I'm by now a little confused about QUEUE and NETLINK targets.
Both are for queuing to userspace if I uderstand it correctly. But where
is the diffrence between those two? Are they used for diffrent purpose
or is just the userspace interface diffrent?

Additionaly i've found two options in kernel .config file which are not
documented under Documentation/Configure.help:
CONFIG_IP_NF_NETLINK
CONFIG_IP_NF_NETLINK_CONNTRACK
What is theire purpose?

Thanks for any answers.

Greets
Sebastian.


