From: Shavian Shakes <shavian78@gmail.com>
Subject: netfilter logging at the NF_IP_POST_ROUTING hook ?
Date: Mon, 21 Mar 2005 22:49:42 -0800
Message-ID: <a7243e5e0503212249cd84cdf@mail.gmail.com>
Reply-To: Shavian Shakes <shavian78@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

New to netfilter/iptables. I am writing a small kernel module using
netfilter hooks. For debugging I need to log the packets at the hooks
NF_IP_POST_ROUTING and NF_IP_PRE_ROUTING.

From what I understand, the iptables chains "INPUT" and "OUTPUT" in
the "filter" table are hooked in at NF_IP_LOCAL_IN and NF_IP_LOCAL_OUT
respectively. So if I try to do something like :

iptables -A OUTPUT  -j ULOG --ulog-nlgroup 1 --ulog-prefix foo 

this will log the packets from the NF_IP_LOCAL_OUT hook. But I would
like to log them from the NF_IP_POST_ROUTING (and  NF_IP_PRE_ROUTING
too) hooks. Is there a simple way to achieve this using
iptables/netfilter?

thanks for any help/pointers.

Shavian. 

ps: I tried to do this (without fully understanding if it will work ):
iptables -A POSTROUTING -t nat  -j ULOG --ulog-nlgroup 1 --ulog-prefix foo
but it didnt..

