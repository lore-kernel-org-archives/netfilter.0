From: =?iso-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solutti.com.br>
Subject: Re: default policy for nat/mangle table
Date: Wed, 28 Apr 2004 07:29:13 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001f01c42d0b$a81a42c0$8b00000a@casa>
References: <20040428030406.4153.h011.c009.wm@mail.canada.com.criticalpath.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Netfilter ML <netfilter@lists.netfilter.org>
Cc: swissguy@canada.com


    Before reaching INPUT, packets will pass, at least, thru mangle
prerouting and nat prerouting. You can set them default to DROP, but you'll
have to create rules that match your needed traffic. Setting them to DROP
and having no rules there, will surelly stop everything from working.

    I'd like to suggest you to take a look at:

http://www.aptalaska.net/~jclive/IPTablesFlowChart.pdf

    It may seem strange, but after understanding how it works, you'll
understand better how packet flow works on netfilter chains and tables.


    Sincerily,
    Leonardo Rodrigues


----- Original Message ----- 
From: <swissguy@canada.com>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, April 28, 2004 7:04 AM
Subject: default policy for nat/mangle table


> hello
>
> i have a pretty basic problem, but i dont understand it
> really
> os debian
> kernel 2.4.18-bf2.4
> iptables version 1.2.6a-5
>
> i wrote the following testscript:
> #!/bin/bash
>
> IPT="/sbin/iptables"
>
>
> $IPT -F
> $IPT -t nat -F
> $IPT -t mangle -F
>
> $IPT -P INPUT   ACCEPT
> $IPT -P OUTPUT  ACCEPT
> $IPT -P FORWARD ACCEPT
>
> $IPT -t nat -P PREROUTING  DROP
> $IPT -t nat -P OUTPUT      DROP
> $IPT -t nat -P POSTROUTING DROP
>
>
> $IPT -t mangle -P PREROUTING  DROP
> $IPT -t mangle -P INPUT       DROP
> $IPT -t mangle -P FORWARD     DROP
> $IPT -t mangle -P POSTROUTING DROP
> $IPT -t mangle -P OUTPUT      DROP
>
>
> $IPT --delete-chain
> $IPT -t nat --delete-chain
> $IPT -t mangle --delete-chain
>
> when i boot and all the policies are in all 3 tables
> accept i can do what i want. now i set the default
> policy from nat and mangle to drop (there are no rules)
>
> but somehow it has influence on my filter table, i cant
> ping or access with ssh.
>
> now i was thinking that maybe every packet goes through
> mangle prerouting before it comes to filter table and
> thats the reason for. but i am not sure and it would be
> nice to understand whats going on or what i am doing
> wrong
>
> also in the book i use (linux firewall by r.ziegler)
> the example contains also to set default to drop on ALL
> 3 tables.
>
> thanks for you help
> francis
>
>


