From: Ulysses Almeida <ulysses.almeida@gmail.com>
Subject: Re: Two Internet Connections send port 80 on one interface and rest
	on another
Date: Thu, 20 Jan 2005 09:09:28 -0300
Message-ID: <d64535605012004091d48725a@mail.gmail.com>
References: <200501200644.20040.tommy@svearike.sytes.net>
Reply-To: Ulysses Almeida <ulysses.almeida@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200501200644.20040.tommy@svearike.sytes.net>
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
To: 189@telia.com
Cc: netfilter@lists.netfilter.org

On Thu, 20 Jan 2005 06:44:20 +0100, Tommy W <tommy@svearike.sytes.net> wrote:
> Hi.
Hi.

> I have 2 internetconnections (eth0 and eth2) and a local net (eth1)
> as it is now I have eth1 masqueraded behind eth0 so all internet activity
> is used on eth0 . But now I want port 80 to be "redirected" to eth2 in order
> to always get good speed on http.
> How can I do this ?
You'll need multiple routing tables.

> 
> as a matter of fact I can't get the machine to listen on both ips :(
> I do
> $ route add default gw $ETH2_GW
> $ route add default gw $ETH0_GW
> but that really messes things up.
Yes, don't do it with route, do it with iproute2
Something like:

echo 100 slink >> /etc/iproute2/rt_tables      #Only the first time
ip route add default via $ETH2_GW dev eth2 table slink

And then, you'll need to add other routes, like route to your own eth2
network and so on. After doing this, you'll create some rule, to make
http connections altk trhough eth2.

iptables -t mangle -m tcp -A PREROUTING -p tcp -s <lan> --dport 80 -j
MARK --set-mark 0x02
ip rule add fwmark 0x02 lookup slink

> 
> What decides which ip is to be used first (outbound locally)
> say if I do ping www.helgon.net
> what decides which ip I get?
Always the default gateway. But you can have only one. Or with
iproute2 only one per table. ;)

> is it the first default route in the $ route   list?
> is it the first ethX device?
> I'm lost.. :(
> please send me some links, or even better. A working solution :)
To be clearer, visit
http://www.lartc.org/howto/

This week I start to write a mini-HowTo about this, and it's
inconplete yet... But can help you.
https://lists.netfilter.org/pipermail/netfilter/2005-January/058112.html

Regards

-- 
 - Ulysses Almeida

