From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Need Help
Date: Sun, 29 Sep 2002 23:40:36 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020929224039.UBRU2092.mta07-svc.ntlworld.com@there>
References: <F270kuutSgcOrBLSAQV00000096@hotmail.com> <002601c26807$3c41cc00$5120a8c0@mmx>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002601c26807$3c41cc00$5120a8c0@mmx>
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
To: netfilter@lists.samba.org

On Sunday 29 September 2002 11:26 pm, Davide wrote:

> hello,
>    this is the iptables version
>
> /sbin/iptables -F
> /sbin/iptables -t nat -F
>
> /sbin/iptables -P INPUT ACCEPT

Ugh.

> /sbin/iptables -P FORWARD ACCEPT

Ughhh !!!

> /sbin/iptables -P OUTPUT ACCEPT
>
> echo "1" > /proc/sys/net/ipv4/ip_forward

It's a good idea to put this *after* your rules, to avoid any period of time 
when the kernel's forwarding packets, but without a ruleset loaded...

> # for trasparent proxy
> /sbin/iptables -t nat -A PREROUTING -p tcp -s 0.0.0.0/0 --dport 80 -j
> REDIRECT --to-ports 8080

The -s 0.0.0.0/0 is redundant.

> # for direct connection excluding HTTP
> /sbin/iptables -A FORWARD -p tcp -s 0.0.0.0/0 --dport 80 -j DROP

Please do this as an explicit ACCEPT rule for *outbound* packets which do not 
match HTTP, and have a default DROP policy on the FORWARD chain (so you block 
anything trying to come in).

ie:
iptables -P FORWARD DROP
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -p tcp --dport ! 80 -o $extIF -j ACCEPT

Antony.

-- 

G- GIT/E d- s+:--(-) a+ C++++$ UL++++$ P+(---)>++ L+++(++++)$ !E W(-) N(-) o? 
w-- O !M V+++(--) !PS !PE Y+ PGP+> t- tv@ b+++ DI++ D--- e++>+++ h++ r@? 5? 
!X- !R K--?

