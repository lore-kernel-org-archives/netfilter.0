From: Jose Maria Lopez <jkerouac@eresmas.com>
Subject: Re: No chain/target/match by that name
Date: 05 Sep 2004 18:41:03 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094402462.3726.6.camel@nostromo.bgsecm.com>
References: <413B233C.3000601@yhgfl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <413B233C.3000601@yhgfl.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El dom, 05 de 09 de 2004 a las 16:31, Steve Turnbull escribió:
> Hi
> 
> Our web server is configured;
> Debian (Woody) (No X installed)
> Kernel 2.4.23 - configured with iptables in mind
> iptables v1.2.6a
> 
> When we start the firewall script, we get this message;
> 'No chain/target/match by that name'
> 

You should check your firewall script and find the rule
that it's giving the error, just run it with "bash -x <script>"
and you can see line by line what's happening. Maybe it's
a misspelling of a rule.

> The firewall works however, but is constantly logging;
> 'Sep  5 16:00:52 www kernel: Input: IN=eth0 OUT= 
> MAC=00:e0:81:29:01:75:00:07:85:06:c2:e1:08:00 SRC=195.92.195.93 
> DST=195.92.38.54 LEN=302 TOS=0x00 PREC=0x00 TTL=61 ID=0 DF PROTO=UDP 
> SPT=53 DPT=32833 LEN=282'
> 

This is DNS normal traffic I think, so you shouldn't be logging
it.

> Something is ammis here, and we can't ping out from the server with the 
> firewall running, also, we can't use Lynx to browse. Turn the firewall 
> off and all is well for both of these.
> 

If you turn the policy to deny and then the firewall script gives an
error and exits then you don't have the ports you need open and that's
the problem.

> Has anybody got any ideas what is wrong? Our firewall rule is below.
> 
> Regards
> Steve
> 
> 
> 
> #!/bin/sh
> 
> 
> #
> # This is the firewall up script.
> #
> 
> #
> # Lets start by dropping all incoming traffic and allowing all
> # outbound traffic
> #
> 
> iptables -P INPUT DROP
> iptables -P FORWARD DROP
> iptables -P OUTPUT ACCEPT
> 
> 
> 
> # Flush any existing rules...
> iptables -F
> 
> 
> # Allow any established connections to come on through...
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> 
> 
> # This is a web server. We only require access to http ports
> # 80,21,53 and 443. New ports to allow will be added here...
> iptables -A INPUT -p tcp --dport 80 -j ACCEPT
> iptables -A INPUT -p tcp --dport 443 -j ACCEPT
> 
> #ssh
> iptables -A INPUT -p tcp --dport 22 -j ACCEPT
> 
> #ftp
> iptables -A INPUT -p tcp --dport 21 -j ACCEPT
> 
> #DNS
> iptables -A INPUT -p tcp --dport 53 -j ACCEPT
> iptables -A INPUT -p udp --dport 53 -j ACCEPT
> 
> 
> # Allow the loopback connection...
> iptables -A INPUT -i lo -j ACCEPT
> 
> 
> # Log stuff that doesn't match above rules...
> iptables -A INPUT -j LOG --log-prefix="Input: "
-- 
Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPAÑA

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"


