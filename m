From: =?Big5?B?Iqf1xKOpdiAoU2Nob29sIE5ldCki?= <leeyc@school.hk>
Subject: Bug report: ip_nat_pptp kernel panic
Date: Thu, 15 Dec 2005 17:58:37 +0800
Message-ID: <43A13E4D.8040209@school.hk>
Reply-To: lee_yiu_chung@yahoo.com
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

Dear netfilter developers,

I am using linux 2.6.14.3 kernel with ip_nat_pptp compiled as a module.
I have discovered a bug in this condition:

I have installed pptpd on a firewall. Assume the firewall has the follow
IP: (external) 1.2.3.4 (internal) 192.168.0.1. The pptpd is serving as a
VPN for 192.168.0.0/24.

If I am using a VPN client (assume it has IP address 192.168.0.2) to
connect to 1.2.3.4, it will generate a kernel panic. (Of course, people
normally don't do such stupid things, but they may make a mistake, since
my customers are roaming between sites and may choose the wrong VPN
connection and then crashes the firewall.)

I understand this is a really a abnormal test case becasue no one would
VPN to their own servers if they are inside the company.

Thank you.

