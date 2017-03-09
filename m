From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd will not accept connection records into kernel table
 from another machine
Date: Thu, 9 Mar 2017 21:32:47 +0100
Message-ID: <20170309203247.GA12738@salvia>
References: <2602-58bd9900-3-1184bca@164654059>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2602-58bd9900-3-1184bca@164654059>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gerald <gerald@palmerhouse.net>
Cc: netfilter@vger.kernel.org

On Mon, Mar 06, 2017 at 11:15:04AM -0600, gerald wrote:
> https://bugzilla.netfilter.org/show_bug.cgi?id=1123
> 
> OS localhost 4.9.8-1-ARCH #1 SMP PREEMPT Mon Feb 6 12:59:40 CET 2017 x86_64 GNU/Linux
> 
> conntrackd version 1.4.4
> conntrackd gives an error for each remote connction it attempts to add to the local table:
> [Thu Feb 16 17:56:27 2017] (pid=1312) [ERROR] inject-add2: Invalid argument
> Thu Feb 16 17:56:27 2017 icmp     1 src=192.168.0.15 dst=67.36.196.10 type=8 code=0 id=5486 [UNREPLIED]
> [Thu Feb 16 17:56:27 2017] (pid=1312) [ERROR] inject-upd1: Invalid argument
> Thu Feb 16 17:56:27 2017 icmp     1 src=192.168.0.15 dst=67.36.196.10 type=8 code=0 id=5486

I fail to reproduce this here with 4.10 and current
libnetfilter_conntrack and conntrack-tools git HEAD.

EINVAL means that the message we send to the kernel is malformed, that
looks like a normal ping.

> when
> DisableExternalCache On
> 
> conntrackd WILL add to external table when the external cache is enabled
> but errors with the cache is disabled
> 
> with the external cache disabled
> entries DO NOT appear in conntrack -L
> entries DO NOT appear in conntrackd -e
> entries DO NOT appear in conntrackd -i
> failures show in conntrackd -s
> 
> 
> conntrackd.conf:
> Sync {
>     Mode FTFW {
>         DisableExternalCache On

You cannot use FTFW with DisableExternalCache On. I'll make a patch to
warn on this to users. But this shouldn't be the cause of the problem.

>         CommitTimeout 1800

Could you comment out this option and retest?

>         PurgeTimeout 5
>     }
> 
>     UDP {
>         IPv4_address 192.168.0.31
>         IPv4_Destination_Address 192.168.0.30
>         Port 3780
>         Interface ens8
>         SndSocketBuffer 24985600
>         RcvSocketBuffer 24985600
>         Checksum on
>     }
> }
> 
> General {
>     Nice -20
>     HashSize 32768
>     HashLimit 131072
>     LogFile on
>     Syslog on
>     LockFile /var/lock/conntrack.lock
>     UNIX {
>         Path /var/run/conntrackd.ctl
>         Backlog 20
>     }
>     NetlinkBufferSize 2097152
>     NetlinkBufferSizeMaxGrowth 8388608
>     Filter From Userspace {
>         Protocol Accept {
>             TCP
>             UDP
>             ICMP # This requires a Linux kernel >= 2.6.31
>         }
>         Address Ignore {
>             IPv4_address 127.0.0.1 # loopback
>             IPv4_address 192.168.0.30
>             IPv4_address 192.168.0.31
>         }
>     }
> }
> 
> conntrack -c
> works and adds entries to the local table when executed
> 
> perhaps related to:
> http://www.linuxquestions.org/questions/showthread.php?p=5547189#post5547189
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
