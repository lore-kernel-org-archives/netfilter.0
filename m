From: Meir Michanie <meirm@riunx.com>
Subject: killing an existing connection
Date: 07 Nov 2002 21:28:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1036697319.10279.13.camel@meirm2kp.riunx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org
Cc: meirm@riunx.com

I am trying to develop a pay per routing limited by time. (lets say
15mins)

step 1 :the iptables should redirect all forwarding packets to my
gatekeeper site.

step 2:after you pay I should allow youe mac address for free
forwarding.

step 3: but adding a cron job or something like that to stop you after
15 mins and then redirect you back to my site to pay for more time.

step 1 is done by 

iptables  -t nat -A PREROUTING -j DNAT --to-destination 10.0.10.2

step 2 is done by

iptables -t nat -I PREROUTING -m mac --mac-source 00:20:18:2D:6B:20 -j  
ACCEPT


My problem is with step 3:

prerouting is not dealing with established sessions.

mangle is not using dnat target.

someone told me to use tcpkill, I do not nothing about it, I i thought
that it may be a way to do something with iptables, like resetinmg all
its connections for that mac address, etc.

Ideas?


-- 
QOTD:
	"I tried buying a goat instead of a lawn tractor; had to return
	it though.  Couldn't figure out a way to connect the snow blower."


