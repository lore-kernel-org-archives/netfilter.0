From: "Rob Verduijn" <rverduij@dds.nl>
Subject: rp-l2tpd iptables and rh9 but no google
Date: Fri, 18 Jul 2003 21:01:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <HBELLDKFGOFPEHBLCFCLCEBJCCAA.rverduij@dds.nl>
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

Hi there,

I've got this curious problem with netfilter.

On my gateway pc I'm running rh9 and am keeping it up to date with the
up2date utility.
I've got a motorola cable modem connected to my network card eth1 (DHCP my
isp requires this, range is something from 10.0.0.0/21 don't ask me why /21)
Over this connection I set up tunnel using l2tp (rp-l2tpd 0.3) which is ppp0
(DHCP again, couple of class c range addresses)
My internal network is connected to eth0 (192.168.0.1/24)

My default policys are accept for everything

I did
echo 1 > /proc/sys/net/ipv4/ip_forward

and

iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

set the gateway to the other end of the ppp tunnel

From on my network I can happely surf the web to almost any page from a pc
that has his gateway set to 10.0.0.1
(And the proper dns entrys network card drivers etc,etc..)

But I can't surf to www.google.com

I can ping google so icmp seems to work but I can't surf the web for google.
Neither windows nor linux will work.

However if I log in to my gateway start mozilla and surf to google it works
fine.

I'm I forgetting something? (Obviously, but what?)

Does anybody know why I can't surf to google via my gateway?

Many thanx

oh before I forget this is where i got the rp-l2tpd
http://sourceforge.net/projects/rp-l2tp/
running version rp-l2tpd-0.3



