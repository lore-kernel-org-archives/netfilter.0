From: Julian Gomez <kluivert@tm.net.my>
Subject: Re: why packet get through the netfilter even if i drop all in FORWARD
Date: Sun, 8 Jun 2003 20:43:16 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030608124316.GA1140@floyd>
References: <001e01c32d84$34f4fe70$95dc6f89@wonderland>
Reply-To: kluivert@tm.net.my
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <001e01c32d84$34f4fe70$95dc6f89@wonderland>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Sun, Jun 08, 2003 at 04:07:11PM +1000, Calvin spoke thusly:
>I running netfilter with freeswan, I add a rule in FORWARD chain to drop
>all packets forward from internal iface(eth0) to public iface(eth1).
>    iptables - A FORWARD -i eth0 -i eth1 -j DROP

Should that be 'iptables -A OUTPUT -i eth0 -o eth1 -j DROP' instead ?

>however once I start up the IPSEC, I do the ping again and A can ping
>GWb's eth0. The rule in FORWARD chain is still there.

iptables -A OUTPUT -p all -o eth1 -d GWb-IP-address -j DROP

>Why does this happen? Is that anyway I can fix this?

Explain your IPsec setup in detail, and then we can give you a proper
answer without guesswork.

