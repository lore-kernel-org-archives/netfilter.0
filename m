From: Peter <petermatulis@yahoo.ca>
Subject: 2 basic iptables questions
Date: Tue, 25 Jul 2006 17:20:39 -0400 (EDT)
Message-ID: <20060725212039.59780.qmail@web60024.mail.yahoo.com>
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
To: netfilter <netfilter@lists.netfilter.org>

Hi,

Two questions:

1) I understand the basics of the iptables command but I am having
trouble grasping how the various "scripts" go together.  I have a
CentOS (Red Hat) box set up and there is an init script
/etc/init.d/iptables.  There is also a support script
/etc/sysconfig/iptables-config.  I know also that 'service iptables
save' saves a ruleset file of the current ruleset inside
/etc/sysconfig/iptables.  My question is therefore "Where do I place my
main (and documented) ruleset file?".  I envision a file solely
containing a multitude of iptables commands but many files I find on
the net contain other commands as well.

2) I have inherited an iptables firewall and I'm trying to grok its
ruleset.  Here are the beginning lines of the output of 'cat
/etc/sysconfig/iptables':

*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:log_and_drop - [0:0]
:service_chain - [0:0]
[0:0] -A INPUT -d 127.0.0.1 -j ACCEPT 
[0:0] -A INPUT -s 127.0.0.1 -j ACCEPT 
[0:0] -A INPUT -i lo -j ACCEPT 
[0:0] -A INPUT -j service_chain 
[0:0] -A log_and_drop -j LOG --log-prefix "FWSERVER (Blocked
Connection)" 
[0:0] -A log_and_drop -j REJECT --reject-with icmp-port-unreachable 
[0:0] -A service_chain -p icmp -j ACCEPT 
[0:0] -A service_chain -p icmp -j log_and_drop
.
.
.
{ many more '[0:0] -A service_chain' lines }
COMMIT

My question here is how is the last rule ever matched?  If ICMP is seen
it will be accepted and the evaluation stops.  What is the meaning of
this line?  My guess is that it is there to log and then block unwanted
traffic (via the log_and_drop chain) but I do not see how it works. 
The ruleset is full of these line patterns.

Peter

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

