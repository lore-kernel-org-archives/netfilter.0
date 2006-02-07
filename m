From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: ipt -P INPUT ACCEPT problem
Date: Tue, 7 Feb 2006 07:05:29 +0100
Message-ID: <000001c62bac$7f9183d0$0101000a@sterenborg.info>
References: <42ad30bb0602061910i705f5a69u8f88a97f813c0681@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42ad30bb0602061910i705f5a69u8f88a97f813c0681@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

> I have a personal laptop running Debian sitting behind a linksys
> future-shop-bought router that nicely provides me with DHCP services
> at boot. My only concern at the moment is having iptables as a basic
> firewall that can block/accept all incoming and outgoing packets from
> my untrustworthy router. 
> 
> Starting out to experiment, I wanted to block all incoming packets:
> 
> iptables -P INPUT DROP
> 
> Then, I wanted to undo my changes:
> 
> iptables -P INPUT ACCEPT
> 
> Why is it that now I can't access the internet? I can access my router

We don't know. Show us the output of "iptables -nvL".

> at 192.168.1.1 and my other system at 192.168.1.100 but everythign
> else is just shut down. Checking my router setup turns out that it
> assigned only one DHCP client, and my system is gone from its list.

What does "ifconfig" say ? Maybe you have to renew your DHCP lease.
Perhaps the router doesn't accept your IP if it's not in it's list.

> Is there something about the internal workings of iptables I should
> know, or is this meant for the Debian, or general Linux help mailing
> list?? I attempted restarting my networking scripts but it failed on
> DHCP init. 

Unless you received an error when executing the commands above, there
should be no problem. Maybe it's something with the router ; there's not
too much troubleshooting information.


Gr,
Rob


