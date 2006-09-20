From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Multiple port-fwd on same port  based on src IP
Date: Wed, 20 Sep 2006 20:59:15 +0200
Message-ID: <000f01c6dce6$e1fb9d30$0101000a@tanjian>
References: <45118AB9.8080104@samera.com.py>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45118AB9.8080104@samera.com.py>
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
To: Netfilter <netfilter@lists.netfilter.org>

> Hi,
> I wonder if I can use multiple port forwarding rules to the
> same IP/Port based on the src IP and forwarding to different
> internal IPs
> 
> It should be something like this:
> iptables -t nat -A PREROUTING -p tcp -s CLIENT1_IP -d INET_IP --dport
> 1234 -j DNAT --to 192.168.1.1:1234
> iptables -t nat -A PREROUTING -p tcp -s CLIENT2_IP -d INET_IP --dport
> 1234 -j DNAT --to 192.168.1.2:1234
> iptables -t nat -A PREROUTING -p tcp -s CLIENT3_IP -d INET_IP --dport
> 1234 -j DNAT --to 192.168.1.3:1234
> ...
> 
> Will it work? Or should I configure some sort of tcp proxy.?

I'm not sure why you're using "-d INET_IP" (this box has multiple
INET_IP's?), but IMO this would work (if your FORWARD chain is properly
setup).


Gr,
Rob


