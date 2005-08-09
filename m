From: larsks.14449509@bloglines.com
Subject: 'recent' module has stopped working?
Date: 9 Aug 2005 03:12:53 -0000
Message-ID: <1123557173.134035046.32760.sendItem@bloglines.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Howdy all,



I'm using rules very much like the following to cut down on
SSH brute

force attacks against a number of servers:



  iptables -A INPUT
-p tcp --dport 22 \

    -m state --state NEW \

    -m recent --name SSH
--set --rsource



  iptables -A INPUT -p tcp --dport 22 \

    -m state --state
NEW \

    -m recent --name SSH --seconds 30 --hitcount 4 --update --rsource
\

    -j REJECT --reject-with icmp-port-unreachable



Sometime over the
weekend, these rules stopped working on a pair of

general purpose hosts (both
running Fedora Core 3, kernel 2.6.11

[-1.35_FC3smp]).  The previous, correct
behavior will match the first

rule four times before matching the second
rule.  The new, broken

behavior is that any new SSH connection will immediately
match the

second rule, even if this is the first time a packet has been seen

from the given IP address.



The obvious effect of this is to completely
disable inbound SSH to

these hosts.  I haven't yet been able to reboot the
boxes in question,

but I have been able to tear down the ruleset and unload
the netfilter

modules, and after putting everything back together again the

behavior remains the same.



Has anyone seen this behavior before?  Just
for kicks I went ahead and

compared the MD5 checksums of the ipt_recent library
and kernel module

against a working system, and they look fine.  I'm using
identical

rules on other systems without a problem, so I'm suspicious.



I could really use your help.  Thanks!



-- Lars







