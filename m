From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DHCRELAY through IPTABLES Firewall
Date: Mon, 28 Oct 2002 10:54:35 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210281054.g9SAsee08116@vulcan.rissington.net>
References: <001001c27d72$1352c350$8f33e40f@lsmith5953> <20021028084908.MGPW27595.mta05-svc.ntlworld.com@there> <001f01c27e6d$e4efc8d0$8f33e40f@lsmith5953>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001f01c27e6d$e4efc8d0$8f33e40f@lsmith5953>
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

On Monday 28 October 2002 10:36 am, bigman@monster-solutions.net wrote:

> iptables -N lan1-in
> iptables -N ext-int-in
> iptables -N lan2-in
> iptables -N lan1-lan2-fwd
> iptables -N lan2-lan1-fwd
> iptables -N ext-int-fwd
> iptables -N lan1-ext-fwd
> iptables -N lan2-ext-fwd
> iptables -N lan1-lan2
>
> iptables -A INPUT -i eth1 -j lan1-in
> iptables -A INPUT -i eth0 -j ext-int-in
> iptables -A INPUT -i eth2 -j lan2-in
>
> iptables -A FORWARD -i eth1 -o eth2 -j lan1-lan2-fwd
> iptables -A FORWARD -i eth2 -o eth2 -j lan2-lan1-fwd

I don't like the look of that rule !

> iptables -A FORWARD -i eth0 -j ext-int-fwd
> iptables -A FORWARD -i eth1 -j lan1-ext-fwd
> iptables -A FORWARD -i eth2 -j lan2-ext-fwd
>
> iptables -A OUTPUT -o eth2 -j lan1-lan2

That seems like a strange name to use, but okay....

> iptables -A OUTPUT -o eth0 -j ACCEPT
> iptables -A OUTPUT -s 192.168.1.0/24 -j ACCEPT

Presumably that rule is the one which allows packets from the firewall to 
eth1, since you don't have another rule specifically for that ?

> iptables -A OUTPUT -p tcp -d x.x.x.x (ISP Assigned IP) -j ACCEPT

What is this destination address ?   (No, I don't mean tell me what it is 
numerically, I mean tell me which machine it belongs to and why you might be 
sending packets there from your firewall.)

> iptables -A ext-int-fwd -i eth0 -m state --state RELATED,ESTABLISHED -j
> ACCEPT
> iptables -A ext-int-fwd -i eth0 -j DROP

Why are you specifying -i eth0 in these rules ?   If a packet didn't come in 
through eth0 it wouldn't get as far as the ext-int-fwd chain....

> iptables -A ext-int-in -i eth0 -m state --state RELATED,ESTABLISHED -j
> ACCEPT
> iptables -A ext-int-in -i eth0 -j DROP

Same comment again - why bother to specify -i eth0 ?

In fact, I'd make the same comment for virtually all the following rules.   
You've already specified the input & output interfaces when selecting the 
packets to go to these chains, so why do it all again ?

> iptables -A lan1-ext-fwd -i eth1 -m state --state NEW,RELATED,ESTABLISHED
> -j ACCEPT
> iptables -A lan1-ext-fwd -i eth1 -j DROP
>
> iptables -A lan1-in -i eth1 -s 192.168.1.0/24 -j ACCEPT
> iptables -A lan1-in -i eth1 -j DROP
>
> iptables -A lan1-lan2 -p udp -o eth2 --dport 68 -j ACCEPT
> iptables -A lan1-lan2 -o eth2 -d 192.168.2.0/24 -m state --state
> RELATED,ESTABLISHED -j ACCEPT
> iptables -A lan1-lan2 -j DROP
>
> iptables -A lan1-lan2-fwd -o eth2 -d 192.168.2.0/24 -m state --state
> RELATED,ESTABLISHED -j ACCEPT
> iptables -A lan1-lan2-fwd -o eth2 -j DROP
>
> iptables -A lan2-ext-fwd -i eth2 -m state --state NEW,RELATED,ESTABLISHED
> -j ACCEPT
> iptables -A lan2-ext-fwd -i eth2 -j DROP
>
> iptables -A lan2-in -i eth2 -p udp --dport 67 -j ACCEPT
> iptables -A lan2-in -i eth2 -s 192.168.2.0/24 -j ACCEPT
> iptables -A lan2-in -i eth2 -j DROP
>
> iptables -A lan2-lan1-fwd -i eth2 -o eth1 -j ACCEPT
> iptables -A lan2-lan1-fwd -i eth2 -o eth1 -j DROP
>
> iptables -t nat -A POSTROUTING -o eth0 -s 192.168.0.0/16 -j MASQUERADE

Well, aside from my very first comment above, I can't see anything else which 
I'd expect to cause your problem, so the best thing might be to add a LOGging 
rule just before the DROP rule in each of your lan1-lan2-fwd and 
lan2-lan1-fwd chains so you can see if anything's being blocked...
 

Antony.

-- 

Anything that improbable is effectively impossible.

 - Murray Gell-Mann, Nobel Prizewinner in Physics

