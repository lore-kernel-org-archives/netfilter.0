From: Scott Phelps <netfilter@decipher.com>
Subject: iptables + ebtables + snat question
Date: Fri, 12 Aug 2005 18:41:15 -0400
Message-ID: <51418F95-52AF-4FF8-8F57-BE214D9A04D9@decipher.com>
Mime-Version: 1.0 (Apple Message framework v733)
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
To: netfilter@lists.netfilter.org

I have the following setup:

           LAN
            |
            |
           if0       ________
DMZ---if1     if2---|ROUTER|---INTERNET
          \   /      --------
           br0




LAN_NET = 10.0.0.1
PUBLIC_NET = 77.25.33.0/28
(14 hosts - broadcast = .15)

I am doing transparent bridging between
if1 and if2

My ROUTER ethernet iface has IP 77.25.33.1

my DMZ hosts will have public IPs ranging
77.25.33.2-14

My question is can Masquerade (SNAT) my LAN
IPs and use the ROUTER ethernet IP
as a --to-source target?

Or do I have to assign a IP to my br0 interface?
I am in deign mode so I was trying to figure out
if this is possible.

The rule would look like this:
$IPTABLES -t nat -A POSTROUTING \
-o $BR0 -j SNAT --to-source $ROUTER_IP

Can this work?

