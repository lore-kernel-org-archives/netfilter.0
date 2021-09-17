From: Matt Mercer <matt.mercer@menlosecurity.com>
Subject: conntrackd internal cache growing indefinitely in active-active setup
Date: Fri, 17 Sep 2021 12:37:12 -0700
Message-ID: <CANQxXxoHEb=v8WoFPsr29cNPBYo5NYAOH4UoPNkDUX8DRk_jrg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=menlosecurity.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=69GeeW0ai24k+2np/1fSb0YtWXiYurgBXFeKmGRemkU=;
        b=EGRcEXPdfXCvGBeZhMoRpzRPr+g2Iz9bHZFuDmXWrYZgyEbAj05LCV1SP35jXgOc+S
         GJT1IVb+mh1o9nw07Pz90GyIeCL+PO+ssSzX48G/ObP3pJPFW0MKnn9cpa+bcWDOxxAJ
         jzckbJM06B1914AnsM0d+hWV7ey9lHcbLBgPw=
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello!

My team has been working on a proof of concept 3-node active-active
NAT cluster using BGP and conntrackd v1.4.6 with NOTRACK and
multicast, all atop Debian 11 amd64.

While load testing by simulating many short-lived HTTP sessions per
second, we noticed the "current active connections" count in
conntrackd's internal cache continued to grow, but only when traffic
flowed asymmetrically (that is, when a TCP session initially egressed
on host A but responses returned on host C). Depending on conntrackd's
configuration, the internal cache eventually either fills (blocking
further updates to kernel conntrack state) or grows large enough to
trigger oomkiller against the conntrackd process. It seems to happen
eventually regardless of request rate.

While investigating, we noticed a pattern in the conntrack sessions
remaining unexpectedly in conntrackd internal cache. Via conntrack -E,
we saw that every one of the tuples which seem to persist indefinitely
(visible via "conntrackd -i ct" on the original egress host and
present long after the conntrack entry has gone from kernel state)
changed conntrack IDs during the initial NEW/DESTROY/NEW as a TCP
session was established asymmetrically. For example:

[1631731439.021758]     [NEW] ipv4     2 tcp      6 30 SYN_SENT
src=169.254.130.193 dst=169.254.194.193 sport=15850 dport=80
[UNREPLIED] src=169.254.194.193 dst=169.254.1.160 sport=80 dport=30383
id=1501842515
[1631731439.022775] [DESTROY] ipv4     2 tcp      6
src=169.254.130.193 dst=169.254.194.193 sport=15850 dport=80
[UNREPLIED] src=169.254.194.193 dst=169.254.1.160 sport=80 dport=30383
id=1501842515 [USERSPACE]
[1631731439.022833]     [NEW] ipv4     2 tcp      6 30 SYN_RECV
src=169.254.130.193 dst=169.254.194.193 sport=15850 dport=80
src=169.254.194.193 dst=169.254.1.160 sport=80 dport=30383 mark=0
id=2178269770 [USERSPACE]
[1631731439.024738] [UPDATE] ipv4     2 tcp      6 432000 ESTABLISHED
src=169.254.130.193 dst=169.254.194.193 sport=15850 dport=80
src=169.254.194.193 dst=169.254.1.160 sport=80 dport=30383 [ASSURED]
id=2178269770
[1631731440.621886] [UPDATE] ipv4     2 tcp      6 120 FIN_WAIT
src=169.254.130.193 dst=169.254.194.193 sport=15850 dport=80
src=169.254.194.193 dst=169.254.1.160 sport=80 dport=30383 [ASSURED]
id=2178269770
[1631731440.623111] [DESTROY] ipv4     2 tcp      6
src=169.254.130.193 dst=169.254.194.193 sport=15850 dport=80
src=169.254.194.193 dst=169.254.1.160 sport=80 dport=30383 [ASSURED]
id=2178269770 [USERSPACE]
[1631731440.623186]     [NEW] ipv4     2 tcp      6 120 FIN_WAIT
src=169.254.130.193 dst=169.254.194.193 sport=15850 dport=80
src=169.254.194.193 dst=169.254.1.160 sport=80 dport=30383 [ASSURED]
mark=0 id=2178269770 [USERSPACE]
[1631731440.624771] [UPDATE] ipv4     2 tcp      6 60 CLOSE_WAIT
src=169.254.130.193 dst=169.254.194.193 sport=15850 dport=80
src=169.254.194.193 dst=169.254.1.160 sport=80 dport=30383 [ASSURED]
id=2178269770

I believe active-passive is the preferred and far more common
configuration. Before we abandon our approach, I hoped we could
understand whether this is a hard constraint in an active-active setup
or due to some other issue.

Our conntrackd.conf is as follows:

General {
    HashSize 33554432
    HashLimit 134217728
    NetlinkBufferSize 2097152
    NetlinkBufferSizeMaxGrowth 134217728
    LogFile off
    Syslog on
    LockFile /var/lock/conntrackd.lock
    UNIX {
        Path /var/run/conntrackd.sock
    }
    Systemd on
    NetlinkOverrunResync off
    NetlinkEventsReliable off
    Filter From Userspace {
         Address Ignore {
              IPv4_address 127.0.0.1
              IPv6_address ::1
         }
    }
}
Sync {
    Mode NOTRACK {
        DisableExternalCache on
        DisableInternalCache off
        StartupResync on
    }
    Multicast {
         IPv4_address 225.0.0.51
         IPv4_interface 169.254.169.1
         Group 3780
         Interface bond0.1000
         SndSocketBuffer 1249280
         RcvSocketBuffer 1249280
         Checksum on
    }
}

Thank you for your time, and thanks to the conntrack-tools
contributors for all of their work.

-Matt
