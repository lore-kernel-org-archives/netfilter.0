From: Richard Peeters <richardpeeters45@gmail.com>
Subject: issue with nfnetlink_log and loading it
Date: Tue, 14 Jun 2016 19:48:11 -0400
Message-ID: <CABfb+p2j5Unx=ue0T+GdxqTZ3fTW__sQPLz4kWAfaeoP1qe3MA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to;
        bh=T4XRrOh5L9NKKzKuGHauwGmNNn6T5duIl8f4xWh7/AM=;
        b=xHPebIdjw2maLVwUMbqJJCiQV+OYTZwx+YSGjbmjw3ofOjOsPLwCsBbbppUyHKWn7C
         Kw0XZNHakzpwm8Xjx4L+xEHR1G5t7S3HivjaA2LkZKGjfDemxNi3brOxC8KVH6WWKkSz
         tTQIcRrp6289BG++yewwDm8HSM9+4lcvomYCXCrG1XofH+8QX1sfaIrX9tVgiagN5gfO
         m0UdrJ7awoDln31x70Bpbn+ZgjmAT9JfVOJYIGGMaq24o48KgGGO1lmEV2Z2EAY6chhT
         qhqnC2NbTFLuU6PYyaR+3zk2Uq1WFTlwqYsUpHP/3nepZPjis0WOv/wZfdHVqZv5m3Fp
         6ppA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I have a strange problem, I am running kernel 3.10 with ULOG, and want
to move to NFLOG.

I have the correct nfnetlink_log.ko module and loading the module
works fine when checked with lsmod.

The problem is that in order to switch from ULOG to NFLOG, we need to
ask the system to activate NFLOG with echo "nfnetlink_log" >
/proc/sys/net/netfilter/nf_log/2 (IPv4). But as you see from the
output below, nfnetlink_log doesnt make itself available :

[be@bt]# cat /proc/net/netfilter/nf_log
 0 NONE ()
 1 NONE ()
 2 NONE ()
 3 NONE ()
 4 NONE ()
 5 NONE ()
 6 NONE ()
 7 NONE ()
 8 NONE ()
 9 NONE ()
10 NONE ()
11 NONE ()
12 NONE ()

[be@bt]# modprobe nfnetlink_log
[be@bt]# modprobe xt_NFLOG
[be@bt]# lsmod | grep NFLOG
xt_NFLOG               12537  0
nfnetlink_log          17972  1 xt_NFLOG

[be@bt]# lsmod | grep -i log
xt_NFLOG               12537  0
nfnetlink_log          17972  1 xt_NFLOG
nfnetlink              14650  5 nfnetlink_log,nfnetlink_queue,ip_set

[be@bt]# cat /proc/net/netfilter/nf_log
 0 NONE ()
 1 NONE ()
 2 NONE ()
 3 NONE ()
 4 NONE ()
 5 NONE ()
 6 NONE ()
 7 NONE ()
 8 NONE ()
 9 NONE ()
10 NONE ()
11 NONE ()
12 NONE ()

I rmmod-ed ULOG hence the empty brackets.

Can someone please point me in the correct direction.

Thanks,
Rich
