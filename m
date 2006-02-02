From: Frederic Beck <frederic.beck@loria.fr>
Subject: Problem with state match for ip6tables
Date: Thu, 2 Feb 2006 13:38:57 +0100
Message-ID: <20060202133857.5bded5b8@localhost.localdomain>
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
To: netfilter <netfilter@lists.netfilter.org>

Hello

I'm trying to set up a firewalling script for IPv6 on my Debian, kernel 
2.6.15-1-686-smp, but i have a problem when using the state match.

When i try simply to match all packets with a state ESTABLISHED, i got
the followinf error

root@trunks:~/firewalling/iptables
% ip6tables -A FORWARD  -m state --state ESTABLISHED -j ACCEPT
ip6tables: Unknown error 4294967295

I'm using ip6tables version 1.3.5, i tried also to retrieve the svn
version, but i got the same behaviour.

I didn't see any patch to apply, and am clueless now. Am i missing
something ? Is it a bug ?

Thanks a lot
Fred

