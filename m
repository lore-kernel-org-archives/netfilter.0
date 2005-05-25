From: Sven Neukirchner <s.neukirchner@konabi.de>
Subject: useing mangle to mark packets
Date: Wed, 25 May 2005 09:12:47 +0200
Message-ID: <4294256F.2060007@konabi.de>
Reply-To: s.neukirchner@konabi.de
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

Hello,

I use Linux with  iptables as Router.

I want to mark several Packets which are coming from my Clients in my 
Network and where the destination
ist the internet.

so I set following rule as example:

iptables -t mangle -o $DEV -A POSTROUTING -p ICMP -j MARK --set-mark 1

Is there a way to check if the packets get marks?

I tryed following:

iptables  -A FORWARD   -p ICMP -m mark --mark 1 -j LOG --log-prefix 
"mark " --log-level 6

But it doesnt work.

I want to set up traffice shaping using tc.
So I need to mark packets so I can put them in order.


Thanks Sven











