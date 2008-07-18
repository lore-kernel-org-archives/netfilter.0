From: Bernhard Bock <mailinglists@bock.nu>
Subject: conntrackd failover works partially, was Re: conntrack performance
 test results in INVALID packets
Date: Fri, 18 Jul 2008 16:20:42 +0200
Message-ID: <4880A6BA.6030007@bock.nu>
References: <488064DD.5080509@bock.nu> <alpine.LNX.1.10.0807181212331.12734@fbirervta.pbzchgretzou.qr> <488075F1.80901@bock.nu> <4880891C.4090004@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4880891C.4090004@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Pablo Neira Ayuso <pablo@netfilter.org>

Hi Pablo,

Pablo Neira Ayuso wrote:
> This document is a nice kick off:
> 
> http://www.wallfire.org/misc/netfilter_conntrack_perf.txt

Alright, I increased the nf_conntrack_buckets to 256k and it seems to 
have solved this problem. Thanks so far!

My next step is to run two firewalls in a cluster with conntrackd.

The basic setup works like a charm. I have increased the HashSize 
parameter in conntrackd as well. It replicates the states to the backup 
firewall just fine.

Unfortunately, failover works only in about 50% of all tests. There is 
no obvious pattern as to when this failures occur.

We trigger the failover softly by advertising a higher priority on the 
backup firewall, not by switching off the primary one. If it goes well, 
we do not loose a single connection. If it doesn't go well, we basically 
loose all connections and the apachebench dies. There are hundreds of 
INVALID packets in the syslog, and also some NEW (not SYN). In this 
case, we also see lost packets in "multicast sequence tracking" in the 
conntrackd stats.

One more detail worth mentioning is that we in any case see many 
"connections destroyed failed" in conntrackd statistics, but it does not 
have any visible impact.

We use conntrackd version 0.9.6 included with Fedora 9 in Alarm mode. 
Below I have attached the relevant config files snippets.

Can you (again) give any helpful pointers where I can search?

best regards
Bernhard

------------------------------conntrackd.conf---------------------------------

Sync {
         Mode Alarm {
                 RefreshTime 15
                 CacheTimeout 180
                 CommitTimeout 180
         }
         Multicast {
                 IPv4_address 225.0.0.50
                 Interface bond2
                 Group 3780
         }
         Checksum on
         CacheWriteThrough On
}
General {
         HashSize 262144
         HashLimit 2097152
         LogFile /var/log/conntrackd.log
         Syslog on
         LockFile /var/lock/conntrack.lock
         UNIX {
                 Path /tmp/sync.sock
                 Backlog 20
         }
         SocketBufferSize 268435456
         SocketBufferSizeMaxGrown 1073741824
}


------------------------------keepalived.conf---------------------------------
notify_master /etc/keepalived/script_master.sh
notify_backup /etc/keepalived/script_backup.sh

vrrp_instance VI_1 {
     interface bond1
     state BACKUP
     garp_master_delay 0
     virtual_router_id 20
     priority 104
     advert_int 1
     preempt_delay 30
}

------------------------------script_master.sh---------------------------------
#!/bin/sh
/usr/bin/logger "getting master"
/usr/sbin/conntrackd -c
/usr/sbin/conntrackd -R
/usr/bin/logger "got master"

------------------------------script_backup.sh---------------------------------
#!/bin/sh
/usr/bin/logger "getting backup"
/usr/sbin/conntrackd -B
/usr/bin/logger "got backup"
