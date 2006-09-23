From: Elvir Kuric <omasnjak@yahoo.com>
Subject: iptables limit mach not work correctly
Date: Sat, 23 Sep 2006 11:48:45 -0700 (PDT)
Message-ID: <20060923184845.53578.qmail@web56215.mail.re3.yahoo.com>
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

Hi,

My network is like this 
comp_A (192.168.1.1 )
-----cross---comp_B(192.168.1.20)

I implemented next rules ( just testing now ) on
comp_B

iptables -A INPUT  -p icmp --icmp-type echo-reply   -j
ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-request \
         -m limit --limit 1/s -i eth0 -j ACCEPT
iptables -A INPUT -p tcp --syn -m limit --limit 1/s -i
eth0 -j ACCEPT

This should limit echo-requestes on one per second on
comp_B.
Then I opened 4 consoles on comp_A and issued ping
192.168.1.20 on all of them, and I got response for
every icmp packet.

Should above rules block all icpm requests, and accept
only one per second?

Did I forgot something? There is no any other iptables
rules on  comp_B.

Thanks in advance.

Regards


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

