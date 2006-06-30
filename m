From: "Andrea Bencini" <andrea.bencini@tin.it>
Subject: Redirect-pop3
Date: Fri, 30 Jun 2006 19:18:54 +0200
Message-ID: <002701c69c69$445db990$0200640a@casa>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

I have firewall (iptables) in my network (10.100.0.0/24) with iface eth0 in
local network and eth1 in external network (Internet).
eth0-->10.100.0.1-->default gateway for my local network.
My clients download mail (pop3).
I would like install p3scan into linux server (10.100.0.250) in my network
. This package listens on 8110 port and scans e-mails with clamav.
Without changing any configuration on my clients, the firewall should
redirect all mail download requests (pop3) to p3scan (port 8110); after
p3scan will download mails, will controll them and will deliver them to the
clients.
Other info:
Kernel-2.6
iptables-1.3.0
Which are the rules that I must implement on the firewall?
Thanks
Andrea


