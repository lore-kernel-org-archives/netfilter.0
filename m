From: "Adi" <adi@nettek.pl>
Subject: Port FWD via 2 NAT
Date: Wed, 21 May 2003 22:08:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030521200848.524F4256DFE@ip.sec.artur.pl>
Reply-To: "Adi" <adi@nettek.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"; 
To: netfilter@lists.netfilter.org

Hello,

For ascii art fans:

INTERNET----[eth0 LINUX1 eth1]----[eth0 LINUX2 eth1]----[Windows]

Linux1 eth0 - public address, NAT, eth1 - 10.0.2.1
Linux2 eth0 - 10.0.2.2, NAT, eth1 - 10.0.5.1
Windows - 10.0.5.13

What I can do on Linux1 and Linux2 to allow connect
from INTERNET to telnet on Windows machine?

I put on Linux1 something like this:
iptables -A PREROUTING -t nat -p tcp -d (public address) --dport 23 -j DNAT
--to 10.0.2.2:23
On Linux2:
iptables -A PREROUTING -t nat -p tcp -d 10.0.2.2 --dport 23 -j DNAT --to
10.0.5.13

But it still not working :( What I doing wrong?
Adi


