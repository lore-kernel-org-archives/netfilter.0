From: Nilesh <niluforalways@yahoo.com>
Subject: IPsec through NAT Mode
Date: Mon, 22 Nov 2004 02:48:00 -0800 (PST)
Message-ID: <20041122104800.99801.qmail@web50506.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello All, 

I am using Squid proxy and IPtables. I am having some
problems to configure firewall. 
The problem is SNAT rule If I put rule in script I am
able to connect VPN server at outside world but could
not block yahoo messengers by squid without SNAT rule
I can block messenger through squid. 
I have checked VPN connection properties there is
check box IPsec through NAT mode . If I uncheck I wont
able to connect 
SNAT Rule 
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j SNAT --to
$EXTIP

could anyone help to solve my problem 
also I have tried this rules to connect VPN 
but wont work 
# IKE negotiations
$IPTABLES -A INPUT  -p udp --sport 500 --dport 500 -j
ACCEPT
$IPTABLES -A OUTPUT -p udp --sport 500 --dport 500 -j
ACCEPT
$IPTABLES -A FORWARD -p udp --sport 500 --dport 500 -j
ACCEPT
# ESP encrypton and authentication
$IPTABLES -A INPUT  -p 50 -j ACCEPT
$IPTABLES -A OUTPUT -p 50 -j ACCEPT
$IPTABLES -A FORWARD -p 50 -j ACCEPT
# uncomment for AH authentication header
#$IPTABLES -A INPUT  -p 51 -j ACCEPT
#$IPTABLES -A OUTPUT -p 51 -j ACCEPT



Thanks in advance 
Nilesh,


		
__________________________________ 
Do you Yahoo!? 
Meet the all-new My Yahoo! - Try it today! 
http://my.yahoo.com 
 


