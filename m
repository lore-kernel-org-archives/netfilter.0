From: Vesselin Kostadinov <vesok@yahoo.com>
Subject: Input chain, traffic from interface lo
Date: Wed, 8 Dec 2004 23:32:29 +1100 (EST)
Message-ID: <20041208123229.14114.qmail@web54106.mail.yahoo.com>
Reply-To: vesok@yahoo.com
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

The current "Iptables Tutorial" contains the following lines:

$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LO_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LAN_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $INET_IP -j ACCEPT

where $LO_IFACE is "lo", $LO_IP is "127.0.0.1", $LAN_IP is "192.168.0.2" and
$INET_IP is "194.236.50.155". 

I fully agree with the first line but I am a bit puzzled by the other 2
lines. Is there any chance packets with source IP other than 127.0.0.1 to
come from interface lo?

Thanks in advance

Vesselin

=====
The text below was appended by the mailbox service provider. I should not be held responsible for it. Vesselin.

Find local movie times and trailers on Yahoo! Movies.
http://au.movies.yahoo.com

