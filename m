From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: ssl splitted connections
Date: Fri, 21 Jul 2006 16:10:10 +0200
Message-ID: <BAY103-F38C418A62507498E7057EB2660@phx.gbl>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello everybody.
I have a linux box running 2.6.16 acting as our proxy
squid/firewall. It is connected to an hdsl link and to two
cheaper adsl.
I'm using nth match to splits squid connections (tcp/80
and tcp/443) between the two adsl lines:

iptables -t nat -A POSTROUTING --protocol tcp -m multiport
--dports 80,443 -m nth --every 2 --packet 0 -j SNAT
--to-source first_adsl

iptables -t nat -A POSTROUTING --protocol tcp -m multiport
--dports 80,443 -m nth --every 2 --packet 1 -j SNAT
--to-source second_adsl

So far, so good.
There are some problem with some SSL sites (home banking
for example): sessions time-out after few seconds, multiple
login requests etc...
This is because of the two ip addresses. Is there a way to
tell iptables to use the same '--to-source IP' to a given
destination host when tcp port is 443?



