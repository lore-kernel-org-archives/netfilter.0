From: Martin Gignac <martin.gignac@gmail.com>
Subject: conntrackd "issue" in asymmetric scenario with TCP vs ICMP
Date: Fri, 2 Sep 2022 18:22:16 -0400
Message-ID: <CANf9dFNw9cOQ_mnViaTyZMcJAdsScAX9e6fvV0wb1LW7RYuoCg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=fPTHtawOVcGQCY1cwPlqhB083EJdTF7TgwpafX4TUQg=;
        b=GKguGcgM/wC5zHmpP+jEZUayDuBPFaFI5UY06CCjOD+hQXapxs4Q3TiGJgnW3Duwt0
         qqJ9Zi0S6p8fncbfbYtzcmzUp836jtIxHcOY97TSI1ZDKTxJ0gw4UBPUnvU/bhBTR0cT
         VE4GNHUR3+8x9bOxclVslg86ykRa7s+u9R7aEIbDIYTRPFF1hvnIJKHEfyVsfO22Guhx
         GejWGwnGvpFvr0mgus7FX0ZkuZu3yOQ+WfQKJuVpsi61Pa7JuL/9Gn0S4TsUCngBR9jo
         RoYUg8c5F1sRY0f3D98OGuZeK4TvS2Kpi/K3Y7UrfQviHaeHT2CiXCqdzPetO/5fTVaj
         TNXg==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

(Apologies in advance if this is not the right place for this question).

I am running conntrackd between two Linux firewalls running on Fedora
35 using the following configuration:

    Sync {
        Mode FTFW {
            ResendQueueSize 131072
            PurgeTimeout 60
            ACKWindowSize 300
            DisableExternalCache On
            StartupResync On
        }
        UDP {
            IPv4_address 172.16.1.1
            IPv4_Destination_Address 172.16.1.2
            Port 3781
            Interface bond0
            SndSocketBuffer 1249280
            RcvSocketBuffer 1249280
            Checksum on
        }
        Options {
            TCPWindowTracking Off
            ExpectationSync On
        }
    }
    General {
        Systemd on
        HashSize 32768
        HashLimit 131072
        LogFile on
        Syslog off
        LockFile /var/lock/conntrack.lock
        UNIX {
            Path /var/run/conntrackd.ctl
        }
        NetlinkBufferSize 2097152
        #NetlinkBufferSizeMaxGrowth 8388608
        NetlinkBufferSizeMaxGrowth 83886080
        NetlinkOverrunResync On
        NetlinkEventsReliable Off
        EventIterationLimit 100
        Filter From Userspace {
            Protocol Accept {
                TCP
                UDP
                ICMP
            }
            Address Ignore {
                IPv4_address 127.0.0.1
                IPv4_address 172.16.1.0/29
                IPv4_address 192.168.1.24/29
                IPv6_address ::1
            }
        }
    }

In an asymmetric scenario where incoming traffic flows through
firewall "A" and outgoing traffic through firewall "B", I've noticed
that pings work, but that SSH does not. In the case of pings, the
first ICMP echo reply flowing through firewall "B" sent in response to
the first ICMP echo request is dropped by "B" because the traffic is
"invalid" according to the nft trace, but subequent echo replies make
it through as they are recognized as being part of an existing state.
So far I assumed that the first packet was dropped because "B" hadn't
yet received the [NEW] conntrack state from "A" by the way it received
the echo reply.

However, in the case of an SSH session establishment where the SYN
packet goes through "A" and the SYN-ACK packet goes through "B", nft
trace always shows the SYN-ACK (including retransmissions) as being
dropped because it is "invalid".

Why does the ping reply eventually get recognized as being part of an
established state, but not the SYN-ACK? Is it a misconfiguration in my
conntrackd.conf? Are TCP 3-way handshakes supported by conntrackd in
asymmetric flows?

I'm not sure exactly if I missed some deeper trace I can perform on
the states being sent/received by conntrackd between each firewall. I
thought if I could get more visibility in those that it might become
obvious why the scenario isn't working.

If anyone has hints to help me troubleshoot, or can point to mistakes
in my configuration, my setup, or even my expectations, I would
appreciate it.

Thanks,
-Martin
