From: =?UTF-8?Q?Jean=2DS=C3=A9bastien_Frerot?= <jsfrerot@ludia.com>
Subject: FTFW with multicast not working properly
Date: Fri, 27 Nov 2020 11:56:22 -0500
Message-ID: <CAP0dHewHgdndzpTWrmMfGfkrVukvmV9Luocs-qArZf5UeJepTA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ludia.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=Kp9/ArFMSrb6S/ghKEyDgOXQcBEmAFmI1qAVTiHVmxY=;
        b=ecgDQ20IGcw/mZEx1pFpza6dlFDT+VMXd8B9QHFCbr7LC6HNYwh5qdTfJZBB7S+gmH
         blgNYzXa+zgycJVuCr0mxa1sLvbIkKt3wf5HCMm8duYL5VA0tPXtZT/nHlyKskUFHrdT
         8HBpxoHux5WdKMS7vO15GAIZKvdJ4lbRZ8AaM=
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi, I'm trying to set up conntrackd in FTFW mode with the multicast protocol.
The problem I'm having is that my BACKUP firewall is not getting the
states as it's supposed to.
It's receiving the packets (confirmed by a tcpdump), but only a few
states are replicated, even when I used the '-B' option to resend all
the states to the slaves.

If I configure it to use unicast UPD, all is working fine.
I was hoping to use multicast so I can migrate my current active
firewalls, to a new pair of firewalls. But for this to work, I need to
sync the states to all my 4 firewalls.

The version I'm using:
Connection tracking userspace daemon v1.4.4. Licensed under GPLv2.
(C) 2006-2009 Pablo Neira Ayuso <pablo@netfilter.org>

the OS:
centos 7

Here is the MASTER stats for conntrackd
#####
cache internal:
current active connections:        6205
connections created:        6292 failed:           0
connections updated:         179 failed:           0
connections destroyed:          87 failed:           0

cache external:
current active connections:           0
connections created:           0 failed:           0
connections updated:           0 failed:           0
connections destroyed:           0 failed:           0

traffic processed:
                   0 Bytes                         0 Pckts

multicast traffic (active device=bond1.999):
               20468 Bytes sent                  344 Bytes recv
                 318 Pckts sent                   23 Pckts recv
                   0 Error send                    0 Error recv

message tracking:
                   0 Malformed msgs                   99 Lost msgs
######

and the slave:
######
cache internal:
current active connections:           0
connections created:           0 failed:           0
connections updated:           0 failed:           0
connections destroyed:           0 failed:           0

cache external:
current active connections:           1
connections created:           1 failed:           0
connections updated:           0 failed:           0
connections destroyed:           0 failed:           0

traffic processed:
                   0 Bytes                         0 Pckts

multicast traffic (active device=bond1.999):
                1136 Bytes sent               615344 Bytes recv
                  71 Pckts sent                 4053 Pckts recv
                   0 Error send                    0 Error recv

message tracking:
                   0 Malformed msgs                    0 Lost msgs
######

Here is the current configuration
First firewall
######
Sync {
    Mode FTFW {
        ResendQueueSize 131072
        PurgeTimeout 60
        ACKWindowSize 300
        DisableExternalCache off
    }
    Multicast {
      IPv4_address 225.0.0.51
      Group 3781
      IPv4_interface 172.31.2.1
      Interface bond1.999
      SndSocketBuffer 24985600
      RcvSocketBuffer 24985600
      Checksum on
    }
}
General {
    Nice -20
    HashSize 32768
    HashLimit 131072
    LogFile off
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
            SCTP
            DCCP
            UDP
        }
        Address Ignore {
            IPv4_address 172.31.0.1
            IPv4_address 172.31.0.2
            IPv4_address 172.31.2.1
            IPv4_address 172.31.2.2
            IPv4_address 172.31.2.3
            IPv4_address 172.31.2.4
            IPv4_address 169.254.0.9
            IPv4_address 169.254.0.10
        }
    }
}

Second firewall
#####
Sync {
    Mode FTFW {
        ResendQueueSize 131072
        PurgeTimeout 60
        ACKWindowSize 300
        DisableExternalCache off
    }
    Multicast {
      IPv4_address 225.0.0.51
      Group 3781
      IPv4_interface 172.31.2.2
      Interface bond1.999
      SndSocketBuffer 24985600
      RcvSocketBuffer 24985600
      Checksum on
    }
}
General {
    Nice -20
    HashSize 32768
    HashLimit 131072
    LogFile off
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
            SCTP
            DCCP
            UDP
        }
        Address Ignore {
            IPv4_address 10.2.244.2
            IPv4_address 10.2.244.3
            IPv4_address 10.2.244.4
            IPv4_address 10.2.244.5
            IPv4_address 10.2.252.2
            IPv4_address 10.2.252.3
            IPv4_address 10.2.252.4
            IPv4_address 10.2.252.5
            IPv4_address 172.31.0.1
            IPv4_address 172.31.0.2
            IPv4_address 172.31.2.1
            IPv4_address 172.31.2.2
            IPv4_address 172.31.2.3
            IPv4_address 172.31.2.4
            IPv4_address 169.254.0.9
            IPv4_address 169.254.0.10
        }
    }
}

any idea where the problem could be ?
Thank you.
