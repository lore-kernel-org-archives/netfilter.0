From: <lists@sterenborg.info>
Subject: RE: not ip address
Date: Wed, 25 Mar 2009 07:52:13 +0100
Message-ID: <001c01c9ad16$3a039990$ae0accb0$@info>
References: <49C9C734.3020601@lab.vectoris.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49C9C734.3020601@lab.vectoris.fr>
Content-Language: nl
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter <netfilter@vger.kernel.org>

> Hi all
> I would like to write this sentence in iptables rule:
>   "REJECT everything having port #443 (httpS) as destination except
>    if the IP address that query it are one of 192.168.0.18 or
> 192.168.0.50"
> 
> I'd like to forbid httpS/443 traffic except for those two IP
> addresses.
> 
> I made:
> 
> $IPT -t nat -A PREROUTING  ! --source 192.168.0.50  \
>       -p tcp --dport 443 -j REJECT
> 
> and
> 
> $IPT -t nat -A PREROUTING  --source ! 192.168.0.50  \
>       -p tcp --dport 443 -j REJECT
> 
> But they are all bad syntax.

$ man iptables

[...]
This target is only valid in the INPUT, FORWARD and OUTPUT chains,
and user-defined chains which are only called from those chains.
[...]

Also, use the filter table for filtering.

$ipt -A INPUT -s 192.168.0.18 -p tcp --dport 443 -j ACCEPT
$ipt -A INPUT -s 192.168.0.50 -p tcp --dport 443 -j ACCEPT
$ipt -A INPUT -p tcp --dport 443 -j REJECT


Grts,
Rob


