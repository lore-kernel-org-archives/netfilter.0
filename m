From: "Ian Hunter" <ihunter@hunterweb.net>
Subject: Weird TCP flags?
Date: Thu, 11 Dec 2003 23:11:04 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003101c3c065$f61ad790$13fea8c0@melita.com>
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

OK, I have a router (lucy) with a webserver (192.168.254.242) in a DMZ (off
eth1), and everything works fine -- when you hit my ip, you get the site,
all is well.  However, I get STORMS of this nonsense in my logs:

Dec 11 22:58:52 lucy kernel: Fwd DMZ->Internet DROP: IN=eth1 OUT=ppp0
SRC=192.168.254.242 DST=204.157.6.223 LEN=60 TOS=0x00 PREC=0x00 TTL=63
ID=56169 DF PROTO=TCP SPT=80 DPT=56319 WINDOW=32476 RES=0x00 ACK SYN URGP=0

(That's responding to these rules at the end of the FORWARD chain of filter
table:)

iptables -A FORWARD -i eth1 -o ppp0 -j LOG --log-prefix "Fwd DMZ->Internet
DROP: "
iptables -A FORWARD -i eth1 -o ppp0 -j DROP


Now if web traffic is working, my "-m state --state ESTABLISHED,RELATED -j
ACCEPT" must be working on forwards from eth1 -> ppp0, so why am I seeing
these messages?  Are these broken TCP connections that netfilter doesn't
consider established?

Where do I look now?

Thanks,

Ian


