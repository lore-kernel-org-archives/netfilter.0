From: Jose Maria Lopez <jkerouac@eresmas.com>
Subject: Re: Invalid Argument
Date: 06 Sep 2004 17:58:40 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094476609.9398.6.camel@nostromo.bgsecm.com>
References: <004701c4940f$c155c320$0800a8c0@supreme>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <004701c4940f$c155c320$0800a8c0@supreme>
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

El lun, 06 de 09 de 2004 a las 14:48, João Carlos Garcia escribió:
> Hi, 
> 
> I´m trying to configure iptables rules, but ...
> I´m testing the rules in a separeted environment, but the final topology will be the following
> ADSL -- [ LINUX ] -- LOCAL NETWORK
> 
> The script look like this
> 
>     #!/bin/sh
>     INTIF=eth0
>     EXTIF=eth1
>     INTIP=192.168.0.3
>     EXTIP=172.16.0.3
> 
>     echo 1 > /proc/sys/net/ipv4/conf/eth0/proxy_arp
>     echo 1 > /proc/sys/net/ipv4/conf/eth1/proxy_arp
>     echo 1 > /proc/sys/net/ipv4/ip_forward
>     for f in /proc/sys/net/ipv4/conf/*/rp_filter; 
>     do 
>     echo 1 > $f; 
>     done
> 
>     iptables -F INPUT
>     iptables -F OUTPUT
>     iptables -F FORWARD
>     iptables -A INPUT -j DROP
>     iptables -A FORWARD -j DROP
>     iptables -A OUTPUT -j DROP
>     ...
> 
>     iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o $EXTIF -j SNAT --to-source $EXTIP
> 
> When the script run the last rule ( NAT ), occurs an error : iptables invalid argument.
> I want that the iptables change the source IP address ( 192.168 ) to his ip address ( 172.16.0.3 ) to all connection to Internet
> 
> Could anyone help me ?
> Thanks in advanced
> João Carlos

The rule is correct, I write it in my system and it works, so you
probably have a problem of not having synced the iptables userspace
tools and the kernel space or something similar.

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


