From: cmould <cmould@cwjamaica.com>
Subject: interruption in natted return http traffic
Date: Sat, 29 Apr 2006 11:31:02 -0500
Message-ID: <445394C6.6060303@cwjamaica.com>
Reply-To: carey.mould@e2team.com
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Help:

I have a strange problem and I am not finding answers using Google. I 
have setup a gateway on my network using Mandrake 10.1. I am running 
squid, IP tables, and portsentry. The problem is this: About once a 
week  users  on the network cannot get any response from an http 
request. After many hours of diagnostic what I know is this.
1) http requests are leaving the gateway but not being returned.
2) https requests are leaving the gateway and are being returned. Works 
as expected
3) SSh traffic works as expected
4) If I reboot the server the problem goesaway.
5) After  approximately  8- 9 hours behavior returns to normal with http 
traffic.

I am not seeing evidence of ip_conntrack table overflows. The traffic is 
not being blocked in the firewall.

Has anyone experienced this behavior, what is the problem, where can I look.


