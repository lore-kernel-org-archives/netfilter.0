From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset hash:ip,port not matching
Date: Tue, 25 Jun 2013 09:40:28 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1306250937500.12575@blackhole.kfki.hu>
References: <51C9371E.8020305@logix.net.nz>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <51C9371E.8020305@logix.net.nz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Ludvig <mludvig@logix.net.nz>
Cc: netfilter@vger.kernel.org

On Tue, 25 Jun 2013, Michael Ludvig wrote:

> I'm struggling with ipset 6.11 on CentOS 6.4 (default package) where I
> can't make it match on hash:ip,port sets.
> 
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

In the rules above you specified a single direction flag for a two 
dimensional set, thus the matching returned "false". If in the first rule 
the port is the destination, then it should be:

iptables -I INPUT -m set --match-set test-ipport dst,dst -j LOG ...
 
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

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
