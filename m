From: "gerald" <gerald@palmerhouse.net>
Subject: conntrackd will not accept connection records into kernel table from another machine
Date: Mon, 06 Mar 2017 11:15:04 -0600
Message-ID: <2602-58bd9900-3-1184bca@164654059>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

https://bugzilla.netfilter.org/show_bug.cgi?id=1123

OS localhost 4.9.8-1-ARCH #1 SMP PREEMPT Mon Feb 6 12:59:40 CET 2017 x86_64 GNU/Linux

conntrackd version 1.4.4
conntrackd gives an error for each remote connction it attempts to add to the local table:
[Thu Feb 16 17:56:27 2017] (pid=1312) [ERROR] inject-add2: Invalid argument
Thu Feb 16 17:56:27 2017 icmp     1 src=192.168.0.15 dst=67.36.196.10 type=8 code=0 id=5486 [UNREPLIED]
[Thu Feb 16 17:56:27 2017] (pid=1312) [ERROR] inject-upd1: Invalid argument
Thu Feb 16 17:56:27 2017 icmp     1 src=192.168.0.15 dst=67.36.196.10 type=8 code=0 id=5486



when
DisableExternalCache On

conntrackd WILL add to external table when the external cache is enabled
but errors with the cache is disabled

with the external cache disabled
entries DO NOT appear in conntrack -L
entries DO NOT appear in conntrackd -e
entries DO NOT appear in conntrackd -i
failures show in conntrackd -s


conntrackd.conf:
Sync {
    Mode FTFW {
        DisableExternalCache On
        CommitTimeout 1800
        PurgeTimeout 5
    }

    UDP {
        IPv4_address 192.168.0.31
        IPv4_Destination_Address 192.168.0.30
        Port 3780
        Interface ens8
        SndSocketBuffer 24985600
        RcvSocketBuffer 24985600
        Checksum on
    }
}

General {
    Nice -20
    HashSize 32768
    HashLimit 131072
    LogFile on
    Syslog on
    LockFile /var/lock/conntrack.lock
    UNIX {
        Path /var/run/conntrackd.ctl
        Backlog 20
    }
    NetlinkBufferSize 2097152
    NetlinkBufferSizeMaxGrowth 8388608
    Filter From Userspace {
        Protocol Accept {
            TCP
            UDP
            ICMP # This requires a Linux kernel >= 2.6.31
        }
        Address Ignore {
            IPv4_address 127.0.0.1 # loopback
            IPv4_address 192.168.0.30
            IPv4_address 192.168.0.31
        }
    }
}

conntrack -c
works and adds entries to the local table when executed

perhaps related to:
http://www.linuxquestions.org/questions/showthread.php?p=5547189#post5547189
