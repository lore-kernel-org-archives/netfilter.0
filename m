From: Chinh Nguyen <cnguyen@certicom.com>
Subject: Re: updated iptables doesn't work with old rules
Date: Wed, 22 Feb 2006 15:54:26 -0500
Message-ID: <43FCCF82.6010402@certicom.com>
References: <5f56302b0602220158k76b68705p88dd35b4c2782caa@mail.gmail.com>	<54666.193.173.147.3.1140606085.squirrel@webmail.sterenborg.info>	<5f56302b0602220325p1c66f156y47e8ad569ee7fffb@mail.gmail.com>	<56310.193.173.147.3.1140611713.squirrel@webmail.sterenborg.info>	<5f56302b0602220539t2ec885acwda00f0f2eb521854@mail.gmail.com>
	<5f56302b0602221253t7157857ejb15f87d9984da59c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5f56302b0602221253t7157857ejb15f87d9984da59c@mail.gmail.com>
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
To: Daniel Nogradi <nogradi@gmail.com>
Cc: netfilter@lists.netfilter.org


Daniel Nogradi wrote:
> Anyway, what I have tried is:
> 
> # make sure we start from zero
> 
> iptables --flush
> iptables -t nat --flush
> iptables --delete-chain
> iptables -t nat --delete-chain
> 
> # set up masquerading from LAN to modem which is hook up on eth0
> 
> iptables -t nat -A POSTROUTING --out-interface eth0 -j MASQUERADE
> 
> # allow forwarding from LAN which is hookup up on eth1
> 
> iptables -A FORWARD --in-interface eth1 -j ACCEPT

I think that when you have a rule like this, you need the converse. ie,
iptables -A FORWARD --in-interface eth0 -j ACCEPT

If you want restrictions such that connections are initiated from B only, you
could restrict the inbound forward.

iptables -A FORWARD --in-interface eth0 -m state --state ESTABLISHED,RELATED -j
ACCEPT

> 
> # enable ip forwarding
> 
> echo 1 > /proc/sys/net/ipv4/ip_forwarding
> 
> Just to recap, my configuration is this:
> 
> machine A - eth0 ------------------ modem ------------ internet
>   |
>  eth1
>   |
>   |
>   |
>  hub
>   |
>   |
> machine B
> 
> And I would like to access the internet from machine B, however the
> above rules don't work even without specifying the sources and
> allowing everything.
> 
> Any ideas?
> 

