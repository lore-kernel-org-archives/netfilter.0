From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: VPN question
Date: 14 Oct 2003 13:45:40 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1066153540.1322.11.camel@valhalla>
References: <BAY4-F42tUqsLKqewA30000cc37@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY4-F42tUqsLKqewA30000cc37@hotmail.com>
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
To: patrick kuah <patrickkuah@msn.com>
Cc: netfilter@lists.netfilter.org

On Tue, 2003-10-14 at 11:25, patrick kuah wrote:
> Thanks Chris :)

Glad to! :)

> 
> I'm using ipsec. Currently, my iptables is configured using stateful packet 
> inspection.

You still need to open the correct ports as well create the proper DNAT
and SNAT rules.

> Do i have to add the rules for port TCP/UDP 50 and TCP 50 ???
> Thank you :)

Here's what you need to open up:
1) IKE to and from your IPSec gateway. something like:
iptables -p udp -s 0/0 --sport 500 -d 192.168.1.10 --dport 500 -j ACCEPT
iptables -p udp -s 192.168.1.10 --sport 500 -d 0/0 --dport 500 -j ACCEPT

2) Protocol 50 (ESP) to and from the gateway
iptables -p 50 -d 192.168.1.10 -j ACCEPT
iptables -p 50 -s 192.168.1.10 -j ACCEPT

Again, make sure your clients are not negotiating Authentication Header
(AH). If you try the above and you log drops to protocol 51, AH is being
negotiated.

HTH,
C



