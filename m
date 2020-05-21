From: Korodev <korodev@gmail.com>
Subject: Timestamps, NFLOG, and ULOG
Date: Thu, 21 May 2020 13:44:08 -0500
Message-ID: <CAKOsuLo6wdEXEdb9gEbnXhU9uEoFvaWS1SKjaUitm9SaRyz17Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=9Mpzl/1qii9+nykIqslocDHZP5c0f58zf0qw6j3TWY0=;
        b=bH8TpCMwVC4tXQdxwZL+hn3pg3mKLoVMqiptEi5vybURj4MHR0onUmvKlFGiDExHvi
         nf8wFHMNqPDk3PowVcjS2rlNOOi0RB2SkL6RnXHr3JSOklzOEzbG+rQ/RhXMuXYeAchU
         sxBneVZVdCBo0jhVyY/1539/NGh0+T+N0tHB2+hEF2oL00PKAaLEWfdR8pmvf1tZFGR8
         NYVBlTFEXHFjvRgtGb5OePiI5rUziYg8kieayg+9ulQ6RG3bZ3rv1Tdhypcpo+WXHqHn
         MazYsqPwgwX168qWXevb3+t52m5dE2F33MEtN92OP3wpi2zRO8mtlVi4LAzPv+0vbYsn
         MQhQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,

This is my first time posting on this list so please let me know if
this it not the appropriate list, but I figured I should start here.
We've been using traditional IP tables LOG targets for some time now
and in an effort to clean up our kernel logs and boost performance, we
began looking at NFLOG to ulogd. However, it appears that the packet
timestamps being shown in the ulogd logs are the timestamps at which
the packet is processed by a ulogd stack instead of the actual packet
timestamp.

My platform (Ubuntu 16.04 4.15.0-58-generic), provides 2.0.5 and I
have since compiled and tested 2.0.7, since I saw the JSON output
plugin had been updated to pull the timestamp from the packets. Here's
what I'm seeing with the following stacks and IPTables rules.

stack=firewall9:NFLOG,base1:BASE,ifi1:IFINDEX,ip2str1:IP2STR,mac2str1:HWHDR,json9:JSON
stack=firewall10:NFLOG,base1:BASE,ifi1:IFINDEX,ip2str1:IP2STR,print1:PRINTPKT,emu10:LOGEMU
stack=firewall11:NFLOG,base1:BASE,ifi1:IFINDEX,ip2str1:IP2STR,print1:PRINTPKT,emu11:LOGEMU
stack=firewall12:NFLOG,base1:BASE,ifi1:IFINDEX,ip2str1:IP2STR,mac2str1:HWHDR,json12:JSON

Chain LOG_DROP (4 references)
 pkts bytes target     prot opt in     out     source               destination
 6625  440K NFLOG      all  --  *      *       0.0.0.0/0
0.0.0.0/0            nflog-group 9
31653 2709K LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0             LOG flags 0 level 6
 6612  438K NFLOG      all  --  *      *       0.0.0.0/0
0.0.0.0/0            nflog-group 10
 6611  437K NFLOG      all  --  *      *       0.0.0.0/0
0.0.0.0/0            nflog-group 11
 6611  437K NFLOG      all  --  *      *       0.0.0.0/0
0.0.0.0/0            nflog-group 12
33437 3119K DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0


group 9 (json) - 2020-05-21T14:20:18.663625
iptables log - 2020-05-21T14:20:17.643629+00:00
group 10 - May 21 14:20:18
group 11 - May 21 14:20:18
group 12 - 2020-05-21T14:20:18.664217:D

Additionally if I implement any sort of queuing or thresholding, which
I'd like to eventually, the timestamps are affected. This seems to
indicate I'm not getting the actual packet timestamps. Any ideas on
what could be causing this or is this expected behaviour?



\\korodev
