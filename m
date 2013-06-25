From: Michael Ludvig <mludvig@logix.net.nz>
Subject: Re: ipset hash:ip,port not matching
Date: Tue, 25 Jun 2013 18:33:43 +1200
Message-ID: <51C939C7.50007@logix.net.nz>
References: <51C9371E.8020305@logix.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <51C9371E.8020305@logix.net.nz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 25/06/13 18:22, Michael Ludvig wrote:
> Hi
>
> I'm struggling with ipset 6.11 on CentOS 6.4 (default package) where I
> can't make it match on hash:ip,port sets.

I managed to update ipset and iptables to the current git version but
still having the same problem. I'm sure I'm doing something wrong or
misunderstanding how to use ipset...?

Michael

> My simple testcase is (on 172.31.170.102):
>
> ~ # ipset restore << _EOF_
> create test-ipport hash:ip,port family inet hashsize 1024 maxelem 65536
> add test-ipport 172.31.170.102,tcp:12345
> add test-ipport 172.31.170.1,tcp:12345
> _EOF_
>
> ~ # iptables -F
> ~ # iptables -I INPUT -m set --match-set test-ipport dst -j LOG
> --log-prefix "IPSET(test-ipport,dst): "
> ~ # iptables -I INPUT -m set --match-set test-ipport src -j LOG
> --log-prefix "IPSET(test-ipport,src): "
>
> Then from my client 172.31.170.1 I run netcat:
> ~ # nc -p 12345 172.31.170.102 12345
>
> On the target I can see the packets:
>
> 16:55:40.945624 IP 172.31.170.1.12345 > 172.31.170.102.12345: Flags [S],
> seq 471135462, win 14600, options [mss 1460,sackOK,TS val 631328194 ecr
> 0,nop,wscale 7], length 0
> 16:55:40.945684 IP 172.31.170.102.12345 > 172.31.170.1.12345: Flags
> [R.], seq 0, ack 471135463, win 0, length 0
>
> But nothing is logged. Even if I change it to DROP any other target the
> match still seems to be ignored.
>
> With hash:ip it works but as soon as I use one of the port-hashes it fails.
>
> What am I doing wrong?
>
> Thanks
>
> Michael

