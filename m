From: "Edoardo Mariconda" <edoardo@generalsystem.net>
Subject: PPTP problem with firewall
Date: Wed, 8 Feb 2006 11:22:22 +0100
Message-ID: <000701c62c99$8fd7c9a0$fe14a8c0@pceddy>
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

Hi.

I have installed a firewall (IpCop 1.4.10 distribution) into
my office lan.
We have 4 vpn/pptp account on external server of our
customer for our remote assistance.
I have configured that account into my XP client and .....

- without firewall ----> all account works correctly
- with firewall -------> 3 account works correctly and 1
don't connect !!!!

Into log of my firewall I see that GRE packet from external
server with problem (which mount a CISCO PIX) are blocked
from my firewall, as it isn't able to nat (or conntrack)
that.

If I try from another office with another linux firewall
(supported by another people) all works correctly.
Maintainer of CISCO PIX of customer with problem, connect
from his office (with a linux firewall) and vpn connection
correctly works.

My configuration is (you can also view modules here:
http://www.ipcop.org/modules.php?op=modload&name=phpWiki&fil
e=index&pagename=IPCopSoftwares

Kernel: 2.4.31
Iptables: 1.2.11
ip_conntrack version 2.1
ip_conntrack_pptp version 1.9 loaded
ip_nat_pptp version 1.5 loaded

And I have also modules
ip_nat_proto_gre
ip_conntrack_proto_gre
---- (other vpn/pptp works correctly)

Note that I have also forwarded input 1723 connection on my
internal PPTP server (for come-in vpn connection) whitout
problem.

What kind of problem I have????

Thanks you.

-- 
No virus found in this outgoing message.
Checked by AVG Free Edition.
Version: 7.1.375 / Virus Database: 267.15.2/253 - Release
Date: 07/02/2006
 


