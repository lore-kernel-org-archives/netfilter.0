From: Damian Gatabria <damian_g@speedy.com.ar>
Subject: RE: iptables dnat to loopback
Date: Sun, 08 Aug 2004 03:17:58 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1091945878.12669.0.camel@localhost>
References: <D5C9032B2B09C64EA2409D6214E91AC905124D@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <D5C9032B2B09C64EA2409D6214E91AC905124D@asimail2.alphanumeric.com>
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

> >
> > iptables -A PREROUTING -t nat -p tcp -s (client address) --dport \
> > 3306 -j REDIRECT --to-ports 3306
> >
> > I sit in the client box and `telnet (server ip address) 3306`
> > and just get a "connection refused".
> >
> > Am i missing something? Is the rule ok? I have also tried
> > removing the "--to-ports" option to leave the port unchanged,
> > but the result is the same.
> 
> yes--my post was misleading.  REDIRECT does not precisely do what you want.  it rewrites the destination IP address of the packet to be the primary IP of the interface the packet is received on.  i just verfied this by poking through "/usr/src/linux/net/ipv4/netfilter/ipt_REDIRECT.c"--somewhere around line 85, you'll see: 
> 
>                 /* Grab first address on interface. */
>                 newdst = indev->ifa_list->ifa_local;
> 
> which will not get the packet to 127.0.0.1.
> 
> however, after some further testing--your original DNAT *should* work--the problem is probably somewhere in your filter rules.  i just tested this with a machine that has sendmail bound only to 127.0.0.1:
> 
> # netstat -lnt | grep 25
> tcp        0      0 127.0.0.1:25            0.0.0.0:*               LISTEN
> 
> #iptables -t nat -I PREROUTING -i eth0 -p tcp -d 172.30.30.2 --dport 25 -j DNAT --to 127.0.0.1:25
> 
> the log entry associated with the incoming, DNAT-ed packet may not look exactly as you suspect; however.  this is what popped into my logs upon a successful "telnet 172.30.30.2 25" (the packet is received in the INPUT chain, btw):
> 
> Aug  6 13:06:33 fw kernel: IN=lo OUT= MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=127.0.0.1 DST=127.0.0.1 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=21041 DF PROTO=TCP SPT=35801 DPT=25 WINDOW=32767 RES=0x00 SYN URGP=0
> 
> note the inbound interface is "lo" and both the src and dst IP's are 127.0.0.1.  if you need to filter this kind of connection--make sure you specify a "-s x.x.x.x" in your DNAT rule.
> 
> sorry about my earlier post... hope *this* one helps...
> -j



:o( no luck. 
I even tried -F ing INPUT, FORWARD, OUTPUT, PREROUTING and POSTROUTING
before adding the rule, (all policies set to ACCEPT) and still no luck!

Forwarding is enabled, 

net.ipv4.conf.all.forwarding = 1
net.ipv4.ip_forward = 1

and still the packets are going nowhere... however giving 
the loopback an alias with an ip address of, say, 200.136.136.136
works... so why can't I route to 127.0.0.x? Is there anything
else I should check/add?

Thanks for your patience.




-- 
Damian Gatabria <damian_g@speedy.com.ar>


