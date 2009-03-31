From: Lewis Shobbrook <lew@redgrid.net>
Subject: esp mark not working
Date: Tue, 31 Mar 2009 11:59:21 +1100 (EST)
Message-ID: <23930137.5021238461161128.JavaMail.root@mail.redgrid.net>
References: <15684317.5001238460885010.JavaMail.root@mail.redgrid.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <15684317.5001238460885010.JavaMail.root@mail.redgrid.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all,

Much to my surprise, I've not been able to mark esp packets in the mangle table.
Although esp packets are traversing as they should, the iptables counters are unmoved from zero and as you'd expect rules applied against the mark fail also.

I've tried with ubuntu 2.6.24 & 2.6.27 kernels as well as a debian 2.6.26 all seem to suffer the same problem, all different machines.
Non esp packets mark no problem.

I don't seem to be able to google anyone else having this problem, so I'm hoping someone can help point out where I'm going wrong.

iptables -t mangle -A PREROUTING -i eth0 -p esp -j MARK --set-mark 0x1
with a couple of manual module loads upon apparent failure of the automatic module loading ...
cat /proc/net/ip_tables_targets 
SECMARK
CONNMARK
CONNMARK
DNAT
SNAT
MARK
MARK
MARK
ERROR

On another ....
cat /proc/net/ip_tables_targets
TCPMSS
LOG
REJECT
DNAT
SNAT
ERROR
REDIRECT
ECN
SECMARK
TRACE
NFQUEUE
NFLOG
DSCP
CONNSECMARK
MARK
MARK
CONNMARK
CLASSIFY
NETMAP
MASQUERADE
TOS
I've tried manually loading every possible netfilter module and googled endlessly.
Seems I'm missing something or it is broken.
Can anyone let me in on this?

Cheers,

Lew
