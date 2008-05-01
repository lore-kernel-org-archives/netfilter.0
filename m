From: "Steven Kath" <steven.kath@vyatta.com>
Subject: RE: does -p udp --dport 5060 not work with -j LOG?
Date: Thu, 1 May 2008 16:53:35 -0700 (PDT)
Message-ID: <05dd01c8abe6$7a65aa50$5000040a@skathlaptop>
References: <fvarov$iq2$1@ger.gmane.org> <cc86d0010804302023n2b2dbbeu9b7c5f7d80a308cb@mail.gmail.com> <fvdk6f$j6a$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <fvdk6f$j6a$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'sean darcy' <seandarcy2@gmail.com>, netfilter@vger.kernel.org


> 
> There only one line in my script that uses SIP:
> 
> grep SIP firewall-masq
> $IPT -t nat -A PREROUTING -i external -p udp  --dport 5060 -j LOG
> --log-prefix "SIP-BEFORE:  "
> 
> And it's run first:
> 
> sh -x firewall-masq
> + IPT=/sbin/iptables
> + /sbin/iptables -F
> + /sbin/iptables -X
> + /sbin/iptables -t nat -A PREROUTING -i external -p udp --dport 5060 -j
> LOG --log-prefix 'SIP-BEFORE:  '
> ...........
> 
> 
> I don't really understand this output:
> 
> iptables -L -n -v -t nat | grep SIP
>      2   262 LOG        udp  --  *      *       0.0.0.0/0
> 0.0.0.0/0           udp dpt:5060 LOG flags 0 level 4 prefix `SIP-BEFORE:
> '
>   144K   24M LOG        udp  --  *      *       0.0.0.0/0
> 0.0.0.0/0           LOG flags 0 level 4 prefix `SIP-BEFORE:  '
> 41816 5117K LOG        udp  --  external *       0.0.0.0/0
> 0.0.0.0/0           LOG flags 0 level 4 prefix `SIP-BEFORE:  '
>      0     0 LOG        udp  --  external *       0.0.0.0/0
> 0.0.0.0/0           udp dpt:5060 LOG flags 0 level 4 prefix `SIP-BEFORE:
> '
>      0     0 LOG        udp  --  external *       0.0.0.0/0
> 0.0.0.0/0           udp dpt:5060 LOG flags 0 level 4 prefix `SIP-BEFORE:
> '
...

It looks like your nat table isn't getting flushed.  

Have you tried running 'iptables -t nat -F' before firewall-masq or adding
that to the start of the script?


