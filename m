From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: problem with forward/nat
Date: Sun, 7 Mar 2004 09:26:04 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403070926.05098.Antony@Soft-Solutions.co.uk>
References: <BAY1-F168WzqJX7rVGS00004a39@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY1-F168WzqJX7rVGS00004a39@hotmail.com>
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
To: netfilter@lists.netfilter.org

On Sunday 07 March 2004 3:13 am, Pierre Gillet wrote:

> hello,
>
> i have a small private network, 192.168.1.0 on eth1
> public network on eth0. the server running a dhcp server for private
> network.
>
> #iptables -A FORWARD -i eth0 -o eth0 -m state --state ESTABLISHED,RELATED
> -j ACCEPT

1. Why have you commented out the above command?   It is necessary for teh 
reply packets to be able to return from the Internet to your LAN clients.

2. The above command should read "-i eth0 -o eth1" so that packets are allowed 
from the Internet (eth0) to your LAN (eth1).

I would recommend also that you change all your INPUT rules:

> iptables -A INPUT -i lo -m state --state RELATED,ESTABLISHED,NEW -j ACCEPT
> iptables -A INPUT -i eth0 -p udp --sport 53 -j ACCEPT
> iptables -A INPUT -i eth0 -p tcp --sport 80 -j ACCEPT
> iptables -A INPUT -i eth0 -p tcp --sport 443 -j ACCEPT
> iptables -A INPUT -i eth1 -s 192.168.1.0/24 -j ACCEPT
> iptables -A INPUT -i eth0 -p tcp --sport 23 -j ACCEPT

For a single rule instead:

> iptables -A INPUT -m state --state RELATED,ESTABLISHED,NEW -j ACCEPT

This will allow reply packets from anywhere in response to requests sent out 
by the firewall itself, without leaving your system vulnerable to, for 
example, port scans or access to services where the remote user just 
"happens" to select source port 443 (or any of the others you have listed).

Regards,

Antony.

-- 
This email is intended for the use of the individual addressee(s) named above 
and may contain information that is confidential, privileged or unsuitable 
for overly sensitive persons with low self-esteem, no sense of humour, or 
irrational religious beliefs.

If you have received this email in error, you are required to shred it 
immediately, add some nutmeg, three egg whites and a dessertspoonful of 
caster sugar.   Whisk until soft peaks form, then place in a warm oven for 40 
minutes.   Remove promptly and let stand for 2 hours before adding some 
decorative kiwi fruit and cream.   Then notify me immediately by return email 
and eat the original message.

                                                     Please reply to the list;
                                                           please don't CC me.


