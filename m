From: "robee" <mlody@elpec.com>
Subject: problems with new packet filter -> nf-hipac
Date: Fri, 3 Feb 2006 15:34:33 +0100
Message-ID: <002b01c628ce$f3b04f70$02050c0a@robee>
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

Hi there
I've been trying to run nf-hipac packet filter on my PIII under Fedora Core
4, kernel 2.6.13 or 2.6.14. The kernel has been succesful patched ,but there
is problem with using this filter. Default behavior of my firewall is
blocking everything and rules I've placed in looks like follow:
<----
nf-hipac -F
nf-hipac -P INPUT DROP
nf-hipac -P FORWARD DROP
nf-hipac -P OUTPUT DROP
<----
Problem is that these rules doesn't work. All traffic comes in and out
without any controll. When I set default "DROP" policy on iptables and there
run my nf-hipac rules, I've blocked myself, even I've opened SSH for
example.
Combinations with options in /proc/net/nf-hipac/info makes no different
Please help.


robee


