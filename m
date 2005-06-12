From: "it clown" <suse@mailbox.co.za>
Subject: nat and slow ftp
Date: Sun, 12 Jun 2005 13:47:58 +0200
Message-ID: <web-789187132@mail01.infosat.net>
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

Hi All,

I would like to know if the following is the correct way to
setup my firewall rules to browse the net:

iptables -A OUTPUT -p tcp -o ppp0 --dport 53 -j ACCEPT
iptables -A OUTPUT -p udp -o ppp0 --dport 53 -j ACCEPT
iptables -A OUTPUT -p tcp -o ppp0 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -o ppp0 --dport 20 -j ACCEPT
iptables -A OUTPUT -p tcp -o ppp0 --dport 21 -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j
ACCEPT

iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

I am using this with squid and it is working.

Is that a good way of doing things? I am nating the ports
right?

What i find is that when i browse ftp site they take ages
to display the contents. Why is this happening and i did
load ip_nat_ftp and iptables_nat.

But when i setup a forward rule for ftp it will connect
nice and quick.

Thanks
Regards
_____________________________________________________________________
For super low premiums, click here http://www.dialdirect.co.za/quote

