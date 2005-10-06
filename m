From: Pavels Nikolajevs <pavels@capital.lv>
Subject: double nat and packet filtering
Date: Thu, 06 Oct 2005 03:35:21 +0300
Message-ID: <1128558921.25977.25.camel@sculptor>
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

Hello

I have set up double NAT. The request from outside world gets translated
to local IP address.

iptables -t nat -A PREROUTING -d 62.63.177.216 -j DNAT --to-destination
192.168.100.2
iptables -t nat -A POSTROUTING -d 192.168.100.2 -s 192.168.100.0/24 -j
SNAT --to 192.168.100.1

But I want to filter packets. For example I want to allow people from
outside access only port 80. I wrote this

iptables -A FORWARD -p TCP -d 192.168.100.2 --dport 80 -j ACCEPT
iptables -A FORWARD -p TCP -d 192.168.100.2 -j DROP

I can connect from outside to port 80 and it is okay. HOWEVER. I can't
connect from machine 192.168.100.2 to outside Internet. If I remove
these lines and replace with

iptables -A INPUT -p TCP -d 62.63.177.216 --dport 80 -j DROP

the packets pass trough ignoring this rule.

Any hint how to enable packet filtering with double NAT?

WBR, Pavels


