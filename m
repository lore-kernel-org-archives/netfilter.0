From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Order in ruleset edition
Date: Wed, 26 Nov 2003 19:24:16 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311261924.16969.Antony@Soft-Solutions.co.uk>
References: <00f201c3b44c$d9388520$0200a8c0@ale>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00f201c3b44c$d9388520$0200a8c0@ale>
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
To: "Netfilter lista (iptables)" <netfilter@lists.netfilter.org>

On Wednesday 26 November 2003 6:40 pm, Alejandro Cabrera Obed wrote:

> Is there any order about CHAINS and TABLES that I have to follow in order
> to construct my iptables ruleset ??? For example, is it the same if firstly
> I write in my script my the FORWARD rules and then the OUTPUT and INPUT
> rules or viceversa ???

I recommend:

1. Turn off kernel forwarding:
echo 0 >/proc/sys/net/ipv4/ip_forward

2. Apply default DROP policies to all chains:
iptables -P DROP INPUT
iptables -P DROP OUTPUT
iptables -P DROP FORWARD

3. Flush any old rules:
iptables -F
iptables -F -t nat
iptables -F -t mangle (well, you never know...)

4. Create the rules to allow the packets you want.   The order in which you 
create them is not important, so long as the order they end up in does the 
job you want.   Do not change the default DROP policies :)

5. Turn on kernel forwarding again:
echo 1 >/proc/sys/net/ipv4/ip_forward

I regard the above as a safe way to create rules without allowing thing to 
sneak in or through whilst you're doing it.

Antony.

-- 
Ramdisk is not an installation procedure.

                                                     Please reply to the list;
                                                           please don't CC me.


