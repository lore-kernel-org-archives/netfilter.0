From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrack not displaying bytes and packets
Date: Thu, 12 May 2011 10:20:36 +0200
Message-ID: <4DCB9854.5080805@netfilter.org>
References: <401131.21271.qm@web113317.mail.gq1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <401131.21271.qm@web113317.mail.gq1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vieri <rentorbuy@yahoo.com>, Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/05/11 08:19, Vieri wrote:
> Hi,
>
> Since I updated my kernel to 2.6.36 and 2.6.37, /proc/net/nf_conntrack and conntrack -L do NOT show "packets" and "bytes" even for ASSURED / REPLIED connections.
>
> It seems that both of these data (bytes and packets) have disappeared from conntrack/netfilter.
>
> Am I missing something? Is there an option somewhere to restore earlier behavior (previous kernels/netfilter would always display both bytes and packets)?
>
> Example when opening google:
>
> ipv4     2 tcp      6 431999 ESTABLISHED src=10.215.144.48 dst=209.85.147.104 sport=52531 dport=80 src=209.85.147.104 dst=10.215.144.48 sport=80 dport=52531 [ASSURED] mark=0 secmark=0 use=2
>
> ipv4     2 tcp      6 431999 ESTABLISHED src=10.215.144.48 dst=209.85.147.104 sport=52533 dport=80 src=209.85.147.104 dst=10.215.144.48 sport=80 dport=52533 [ASSURED] mark=0 secmark=0 use=2
>
> ipv4     2 tcp      6 431999 ESTABLISHED src=10.215.144.48 dst=209.85.147.104 sport=52530 dport=80 src=209.85.147.104 dst=10.215.144.48 sport=80 dport=52530 [ASSURED] mark=0 secmark=0 use=2
>
> ipv4     2 tcp      6 431998 ESTABLISHED src=10.215.144.48 dst=209.85.147.104 sport=52532 dport=80 src=209.85.147.104 dst=10.215.144.48 sport=80 dport=52532 [ASSURED] mark=0 secmark=0 use=2
>
> Previous kernel/netfilter would show something like this:
>
> tcp      6 73 TIME_WAIT src=10.215.144.7 dst=209.85.147.104 sport=35407 dport=80 packets=15 bytes=1386 src=209.85.147.104 dst=192.168.92.2 sport=80 dport=35407 packets=11 bytes=10180 [ASSURED] mark=1 use=1
>
> (note "bytes" and "packets")

echo 1 > /proc/sys/net/netfilter/nf_conntrack_acct
