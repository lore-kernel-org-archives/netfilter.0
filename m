From: "Jean-Philippe Mignon" <jp.mignon@gmail.com>
Subject: Source port NAT
Date: Tue, 20 Feb 2007 15:38:24 +0100
Message-ID: <f30a73bb0702200638k62c45db6t7c65f361416ba558@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

HI.

 I need some helps with port forwarding.
 I have a SNMP agent listen on port 1610 (not 161 for rights restriction).
 External applications send query to 161 port and wait response from this port.
 Here's my configuration:

 eth0:  192.168.0.1
 eth0:0 192.168.0.2

 iptables -t nat -I PREROUTING -p udp -d 192.168.0.2 --dport 161 -j
DNAT --to-destination 192.168.0.1:1610
 iptables -t nat -I POSTROUTING -p udp -s 192.168.0.1 --sport 1611 -j
SNAT --to-source 192.168.0.2:161

 When I query agent on 192.168.0.1:1610, I receive correct response from
 192.168.0.2:161. But, when I query agent on 192.168.0.2:161, agent
log an error:
 IOException: Operation not permitted.

 If anybody can help me it would be appreciated.

 Thank you !

