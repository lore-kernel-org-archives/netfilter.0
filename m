From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: iptable 1.2.11 and kernel 2.6.11-1 compatibility issue
Date: Wed, 01 Jun 2005 11:21:51 -0500
Message-ID: <429DE09F.2060409@riverviewtech.net>
References: <003801c566bb$62a1de20$7c66e4a0@supelec.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <003801c566bb$62a1de20$7c66e4a0@supelec.fr>
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

> iptables -A INPUT  -i lo  -m state --state NEW  -j ACCEPT
> iptables -A OUTPUT  -o lo  -m state --state NEW  -j ACCEPT

If your firewall has a policy of DROP for any traffic that is not explicitly allowed then this rule would not work for any thing other than the first packet.  Try using this instead:

iptables -A INPUT  -i lo  -m state --state NEW,RELATED,ESTABLISHED  -j ACCEPT
iptables -A OUTPUT  -o lo  -m state --state NEW,RELATED,ESTABLISHED  -j ACCEPT

I'm just shooting from the hip here, but that would be my first guess.



Grant. . . .

