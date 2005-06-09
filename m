From: Vivek Dasmohapatra <vivek@etla.org>
Subject: difference in behaviour between kernels 2.6 and 2.4 (problem)
Date: Thu, 9 Jun 2005 17:52:33 +0100 (BST)
Message-ID: <Pine.LNX.4.62.0506091737461.2577@pike.pepperfish.net>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi: I had a weird problem today where I tried to replace a kernel 2.4
firewall with a kernel 2.6 one: the rules all seemed to load fine
(a diff of iptables -t filter -vnL showed no significant diffferences)
but for some reason some packets just seemed to be swallowed by the kernel.

the situation was this:

                                 eth1                      eth0
(internet) -- xxx.xxx.xxx.2/26 ----- [ firewall/router ] ----- private
                                           |eth2
                                           |
                                       xxx.xxx.xxx.65/26

Now some traffic into the .65/26 subnet worked fine: but for some reason
udp and tcp traffic to port 53 just vanished: I could see it coming in
to the firewall on eth1 with tcpdump, but no iptables rules seemed to catch
it and it was never routed out (I have a script that automatically adds
a LOG rule for every rule I add when I run it in debugging mode, so I
_should_ have seen something in /var/log/messages or dmesg, but I didn't/).

I can rule out a routing problem because some traffic got through to 
(and back from) machines in the 65 subnet.

forwarding must have been on for exactly the same reason.

The iptables rules were created by the same script and appeared the same.

I don't understand what was happening.

If anyone could provide me with some pointers or show me a way to debug
the iptables rules (perhaps the packet generator can be used to fake up
packets?) I would be most grateful.

[ It does seem like a bit of an annoying limitation that there's no way
   (that I've found) to test iptables rules: If I've missed some obvious
   way to do this (short of digging up spare machines and rigging up dummy
   networks) please tell me... ]


