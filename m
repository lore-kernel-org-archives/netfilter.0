From: <tom@digital-data.co.uk>
Subject: Very basic question.
Date: Fri, 24 Sep 2004 11:26:24 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <E1CAozd-0004s0-00@deer.gmane.org>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

            I am very new to trying to use iptables and was wondering if
someone could help me out with what I should do to solve my current problem.

I have a PC with 3 ethernet cards, one is connected to the internet (eth2).
I want to use network translation to forward all requests to a pair of
static IP addresses I have to particular locales on an internal network
(which is accessed through eth1).

Ie forward all incoming traffic on eth2 going to address 213.249.230.206 to
192.168.10.2 on eth1.

 

I have tried the following, but it just seems to redirect all traffic to the
local firewall:

 

iptables -t nat -A POSTROUTING -o eth1 -s 192.168.10.2 -j SNAT --to
213.249.230.206

iptables -t nat -A PREROUTING -i eth2 -s 213.249.230.206 -j DNAT --to
192.168.10.2

 

What am I doing wrong?

 

Tom 

