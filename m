From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Problem with two addrtype matches in one iptables rule.
Date: Mon, 16 May 2005 01:09:06 -0500
Message-ID: <42883902.7030909@riverviewtech.net>
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
To: kaber@trash.net
Cc: netfilter@lists.netfilter.org

Hi, my name is Grant Taylor.  I'm playing with your addrtype match extension to iptables.  I must say that I like it very much.  However I have a slight problem with it.  Namely I am apparently only able to have one addrtype match in any given rule.  I would like to use two addrtype matches, one for the source address, and one for the destination address in my iptables rules.  Do you know of any limitations to the addrtype match extension that would be causing this?  Below is an example rule of what I am currently using as well as what I would like to be able to do:

# current rule:
iptables -t filter -A INPUT -i eth1 -m pkttype --pkt-type broadcast -m addrtype --src-type broadcast -s 0.0.0.0 -d 255.255.255.255 -p udp --sport 68 --dport 67 -j ACCEPT

# desired rule:
iptables -t filter -A INPUT -i eth1 -m pkttype --pkt-type broadcast -m addrtype --src-type broadcast -m addrtype --dst-type broadcast -s 0.0.0.0 -d 255.255.255.255 -p udp --sport 68 --dport 67 -j ACCEPT

Any comments or suggestions would be greatly appreciated.



Grant. . . .

P.S.  This email was sent to Patrick McHardy (directly) as well as CCed to the NetFilter (general) mailing list.

