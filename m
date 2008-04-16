From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrack-0.9.6 bug (?)
Date: Wed, 16 Apr 2008 15:38:17 +0200
Message-ID: <48060149.4090901@netfilter.org>
References: <20080415134449.66830@gmx.net> <4804C978.1020708@netfilter.org> <48052A6F.9010806@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48052A6F.9010806@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stefan Behte <Stefan.Behte@gmx.net>
Cc: netfilter@vger.kernel.org

Stefan Behte wrote:
> I managed to get the connection deleted before with:
> conntrack -D -s 212.202.252.50 -d 192.168.40.88 -p tcp --sport 23854
> --dport 22
> 
> It did not show up in conntrack -L -s 212.202.252.50 anymore, but was
> still in "ESTABLISHED" state, the packets kept flowing.
> 
> So thought, that might be an error?!
> 
> Also, this does not work:
> 
> [root@haq ~]# conntrack -L | grep "dport=22 "
> tcp      6 431999 ESTABLISHED src=192.168.0.2 dst=192.168.0.1 sport=22
> dport=33555 packets=11 bytes=1324 src=192.168.0.1 dst=192.168.0.2
> sport=33555 dport=22 packets=18 bytes=1272 [ASSURED] mark=0 use=1
> [root@haq ~]# conntrack -D -s 192.168.0.2 -d 192.168.0.1 -p tcp --sport
> 22 --dport 33555
> [root@haq ~]# conntrack -L | grep "dport=22 "
> tcp      6 431999 ESTABLISHED src=192.168.0.2 dst=192.168.0.1 sport=22
> dport=33555 packets=5 bytes=628 src=192.168.0.1 dst=192.168.0.2
> sport=33555 dport=22 packets=8 bytes=560 [ASSURED] mark=0 use=1
> 
> Or am I doing it all wrong?!
> If that is really a bug, where would be the appropriate place to file a
> bug report so that I do not have to bug you directly via mail (which
> might be regarded as inappropriate)?

Probably your stateful rule-set is not well-formed or you have the
connection pickup facility enabled
(/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal must be 0,
otherwise the connection tracking can recover connections from the
middle with no complain). There's an example of a sane and simple
stateful ruleset in [1].

Don't forget that the connection tracking system does not drop packets
by itself, you need a correct iptables configuration to enable the flow
deletion, otherwise it won't work.

[1] http://conntrack-tools.netfilter.org/testcase.html

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers

