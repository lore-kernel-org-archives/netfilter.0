From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: Help on port forwarding + Origin and Destination IP rewriting...
Date: Thu, 10 Nov 2005 15:51:24 +0100
Message-ID: <43735E6C.90803@mnemon.de>
References: <20051110141458.87269.qmail@web60024.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051110141458.87269.qmail@web60024.mail.yahoo.com>
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

luisccmail-netfilter@yahoo.com.br schrieb:
>   Dear Netfilter list people
> 
>   I'm trying to build some netfilter rules so my linux box can forward a telnet connection made on
> a machine on my network (lets say "Box-A") to another machine in my network (lets say "Box-B").
> 
>   Box-A is just another server in the network, but Box-B is special: its a firewalled access
> gateway to a client's network, and it is setted up in a way that only telnet connections from
> Box-A are accepted (that's my client's security policy, and I don't have any chances on change
> this).
> 
>   On the other hand, many folks from my company need access to that client network, and I don't
> want everybuddy needing access to Box-B to connect on Box-A (thats local security policy).
>  
>  So I tried to use two simple rules that could allow me to forward the connections:
> 
>   ###################################
>   # /etc/hosts file
>   # This aliases are in /etc/hosts format, to easy comprehension
>   box-a.local 192.168.0.6
>   box-b.local 192.168.0.34
>   # EOF #############################
> 
>   ###################################
>   # Redirection script file
>   # This should re-write incomming connections before routing
>   # after routing process, they should go to the right host.
>   iptables -t nat -A PREROUTING -p tcp \
>            -d box-a.local --destination-port 2200 \
>            --jump DNAT --to-destination box-b.local:2222
> 
>   # This should re-write outgoing connections after routing,
>   # so they appear to originate from the Box-A host.
>   iptables -t nat -A POSTROUTING -p tcp \
>            -d box-b.local --destination-port 2222 \
>            --jump SNAT --to-source box-a.local
>   # EOF #############################
> 
>   Oh, well, now begin my problem: this doesn't work, and I don't have any ideas to correct the
> problem. 

The information you provide is not sufficient to troubleshoot your
problem. If you could provide the output of iptables-save and some other
information that may help...

Your two rules seem to be ok. Some things you may check:

is /proc/sys/net/ipv4/ip_forward set to 1 ?
is routing setup correctly ?
is FORWARD policy DROP ? And if so, is there a rule that permits
   -d box-b.local --dport 2222 ?
are there any other rules in any table / chain that may cause the
    problem ?
what does tcpdump tell you about a connection attempt ?

That should give some hints.

HTH,

Joerg

