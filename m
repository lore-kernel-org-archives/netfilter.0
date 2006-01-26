From: Sebastian Heidl <s.heidl@teles.de>
Subject: system time going up with many rules updates
Date: Thu, 26 Jan 2006 09:46:05 +0100
Message-ID: <1138265165.10432.163.camel@sehe-c4.berlin.teles.de>
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


Hello List,

I have some moderately busy (in terms of traffic) firewalls that are
spending quite a lot CPU time in %system (> 70%) when there are a lot of
updates to the netfilter rules.
My question is: How can I lower the system time to enable the machines
to handle more traffic ? Specifically, would nf-hipac or other netfilter
projects help here ?

These are 2.8GHz Xeon Machines with 512 MB RAM and GbE interfaces.
During the "high-system-time period" they are forwarding about 30 Mbit/s
traffic.

The netfilter chains structure is as follows (only FORWARD is relevant):

Chain FORWARD (policy DROP)
*** publicly available services ***
*** jump to chain with authenticated users ***
*** services for authenticated users ***

The last rule in the auth-chain is a REJECT so only authenticated users
can access the private services. When a user logs in successfully a rule
is added to the auth-chain, when he logs out the rule is deleted.

At the mentioned high-system-time periods there are about 10 updates
(add/delete) to the auth-chain per second.

I'm thankful for any advice.
_sh_



