From: Michael Gale <michael@bluesuperman.com>
Subject: Sharing ip_conntrack ?
Date: Mon, 22 Dec 2003 21:19:14 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031222211914.313f10b8.michael@bluesuperman.com>
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
To: netfilter@lists.netfilter.org

Hello,

	I have two firewalls using linux-HA so one is always master the other
slave. The monitoring in done over a serial cable.

The slave box does not accept any network traffic until it becomes
master except for ssh on the internal side.

I know that /proc/net/ip_conntrack is where all the established or
related connections are kept.

What I want to know if anyone has any idea how to keep the state on the
second box so NO connections will be lost if a fail over occurs.

I was thinking that I could use DRBD on the /proc/net directory so it
always writes to the master slave. But I then thought it would fail
because the kernel can not write to that directory ... but the second
box is not doing any network traffic so....

?????


-- 
Hand over the Slackware CD's and back AWAY from the computer, your geek
rights have been revoked !!!

Michael Gale
Slackware user :)
Bluesuperman.com 

