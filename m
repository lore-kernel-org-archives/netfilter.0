From: Felix Joussein <felix.joussein@gmx.at>
Subject: delayed masquerading problems after openswan ipsec
Date: Sat, 24 Jul 2004 10:14:41 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <41021A71.5030603@gmx.at>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello List,

I'm not new to iptables, but this problem is very strange:

I have a Linux 2.4.26 + openswan ipsec + iptables 2.11 box with a cable 
modem to connect to the internet - so far:
I have one single rule in the postrouting chain:

iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE

This works fine - also my IPSec tunnel is working nice.
But after a while - can't say how long, the connection from the lan 
thrue the linux box get lost.
dmesg's Output is:

MASQUERADE: Route sent us somewhere else.
klips_error:ipsec_xmit_send: ip_send() failed, err=1

This message repeats as long, as  I remove the MASQ rule, and re-set it.

Has anyone an idea about this issue?

Thanks,

Felix

