From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: skip other iptables marking if packet is already marked
Date: Mon, 31 May 2004 15:24:11 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <020701c446e0$44e95ee0$0100a8c0@newlife>
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

I have many iptables setmark commands, but as soon
as there is one match, I would like to skip all the rest.
How to do this.

-------not-working-not-mark-zero-is-not-accepted---------

iptables -t mangle -A PREROUTING ..... -j MARK --set-mark .....
iptables -t mangle -A PREROUTING -m MARK ! --mark 0 -j ACCEPT
iptables -t mangle -A PREROUTING ..... -j MARK --set-mark .....
iptables -t mangle -A PREROUTING -m MARK ! --mark 0 -j ACCEPT
iptables -t mangle -A PREROUTING ..... -j MARK --set-mark .....

--------------------end-----------------------------------

Since it is not working, I change it to :-

Assuming I have AND-ed all the mark together to obtain the MASK,

iptables -t mangle -A PREROUTING ..... -j MARK --set-mark .....
iptables -t mangle -A PREROUTING -m MARK ! --mark MASK/MARK -j ACCEPT
iptables -t mangle -A PREROUTING ..... -j MARK --set-mark .....
iptables -t mangle -A PREROUTING -m MARK ! --mark MASK/MARK -j ACCEPT
iptables -t mangle -A PREROUTING ..... -j MARK --set-mark .....

Wonder if it will work ? 
My next question is should I use -j ACCEPT or -j RETURN ?







