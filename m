From: "Mark L. Wise" <mark@alpha2.com>
Subject: (no subject)
Date: Tue, 14 Feb 2006 09:02:19 -0500
Message-ID: <00ed01c6316f$44eef640$b00aa8c0@a2smark>
Reply-To: mark@alpha2.com
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

Hello all!

I am struggling with what I think is an iptables issue...

I have the following Net-to-Net VPN set up between to FC4 boxes:

192.168.20.0/24-->192.168.20.2(gw)-->$PUBLICIP1 ...
$PUBLICIP2<--192.168.30.100(gw)<--192.168.30.0/24

With no firewall rules (iptables) entered, I can ping from 192.168.20.70 to
192.168.30.33 without any problem.  However, I cannot get to outside
internet addresses.  If I add:

iptables -t nat -A POSTROUTING --dst ! 192.168.30.0/24 -j SNAT --to-source
$PUBLICIP1

to the 192.168.20.2(gw) machine's iptables, I can get out of the firewall to
the internet from the 192.168.20.0/24 net, BUT MY VPN TRAFFIC DOES NOT REACH
THE OTHER SIDE.

So it seems that I can either have my VPN traffic between the nets OR be
able to get to the internet (WWW, etc.) but I cannot have both.

Anyone have any ideas???

Mark L. Wise, President
Alpha II Service, Inc.
1312 Epworth Ave
Reynoldsburg, Ohio 43068-2116
614 868-5033 (Phone)
614 868-1060 (Fax)




