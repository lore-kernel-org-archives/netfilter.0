From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: ulog: losing packets
Date: Sun, 01 Mar 2009 11:14:16 +0100
Message-ID: <49AA5FF8.5010409@netfilter.org>
References: <547716004.20090227172654@awanti.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <547716004.20090227172654@awanti.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexander Kolesnik <Alexander.Kolesnik@awanti.com>
Cc: netfilter@vger.kernel.org

Alexander Kolesnik wrote:
> Hello,
> 
> We're accounting traffic for users by ULOG-ipcad chain. Some time ago
> I've found that some of users traffic does not appear in ipcad. To
> check that this is not ipcad's problem I've installed ulogd and found
> following in its log:
> Fri Feb 27 15:25:56 2009 <3> ulogd.c:487 ulogd Version 1.22 starting
> Fri Feb 27 15:25:56 2009 <5> ulogd.c:766 initialization finished, entering main loop
> Fri Feb 27 15:27:00 2009 <7> ulogd.c:777 ipulog_read == -1! ipulog_errno == 6, errno = 105
> Fri Feb 27 15:27:02 2009 <7> ulogd.c:777 ipulog_read == -1! ipulog_errno == 6, errno = 105

That means that netlink cannot back off as it is hitting ENOBUFS, thus,
you are losing log messages. Hm, ulog <= 1.24 does a primitive netlink
error handling.

> I have following settings for ulog and other stuff:
> /etc/modprobe.conf:
> options nf_conntrack hashsize=2097152
> options ipt_ULOG nlbufsiz=65535 flushtimeout=100
> 
> # sysctl -a|grep rmem
> net.ipv4.tcp_rmem = 4096        87380   174760
> net.core.rmem_default = 221184
> net.core.rmem_max = 4194304
> 
> /etc/ulogd.conf:
> rmem=442368
       ^^^^^^
Rising this value will delay hitting ENOBUFS. This is the size of the
receiver buffer.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
