From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Segmentation fault when starting conntrackd
Date: Wed, 7 Sep 2022 16:50:56 +0200
Message-ID: <Yxiv0GT2iyuHTWo7@salvia>
References: <PR3PR07MB8130E53D6E800C939928AE66FF7F9@PR3PR07MB8130.eurprd07.prod.outlook.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <PR3PR07MB8130E53D6E800C939928AE66FF7F9@PR3PR07MB8130.eurprd07.prod.outlook.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Viton, Pedro (Nokia - ES/Madrid)" <pedro.viton@nokia.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Mon, Sep 05, 2022 at 06:08:43AM +0000, Viton, Pedro (Nokia - ES/Madrid) wrote:
> Hi:
> 
> I'm trying to have conntrackd working, but after creating a configuration file for FTFW over UDP , I get a Segmentation Fault error when staring it up
> I've also tried with NOTRACK over TCP, but same result.
> 
> [root@luna38 ~]# /usr/sbin/conntrackd -C /opt/AAA/load-balancer/run/conntrackd/conntrackd.conf
> Segmentation fault

You have tools to get a backtrace on were the problem is going on if
you report an issue upstream.

> [root@luna38 ~]#
> 
> 
> In my case, I'm running the conntrackd that comes with default package in RHEL 7.9 (kernel 3.10.0-1127), which is version 1.4.4 (I'm aware it is not the latest one)
> 
> My configuration file is the following one:
> 
> Sync {
>         Mode FTFW {
>         }
> 
>         UDP {
>             IPv4_address 10.10.10.38
>             IPv4_Destination_Address 10.10.10.33
>             Interface ens256
>             Port 3780
>         }
> }
> 
> General {
>         Nice -20
>         LogFile on
>         LockFile /var/lock/conntrack.lock
>         UNIX {
>                 Path /var/run/conntrackd.ctl
>                 Backlog 20
>         }
>         Filter From Userspace {
>                 Protocol Accept {
>                         TCP
>                 }
>                 Address Ignore {
>                         IPv4_address 127.0.0.1
>                         IPv4_address 10.10.10.38
>                         IPv4_address 10.10.10.33
>                 }
>          }
> }
> 
> The IP address of the server where I'm trying to start conntrackd has 10.10.10.38 IP address, and it is on ens256 interface. And the 10.10.10.33 is the replicated one
> $ ip addr
> ...
> 4: ens256: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 10000
>     link/ether 00:0c:29:ef:63:30 brd ff:ff:ff:ff:ff:ff
>     inet 10.10.10.38/24 brd 10.10.10.255 scope global ens256
>        valid_lft forever preferred_lft forever
>     inet6 2001:db0:10:10::38/64 scope global
>        valid_lft forever preferred_lft forever
>     inet6 fe80::20c:29ff:feef:6330/64 scope link
>        valid_lft forever preferred_lft forever
> 
> 
> Is there any other log file where I could see the root cause of the Segmantation Fault?
> The /var/log/conntrackd.log doesn't give any clue.
> 
> Or maybe my configuration file is not correct?

For community support, you have to try latest version first, it might
be a bug already fixed upstream.
