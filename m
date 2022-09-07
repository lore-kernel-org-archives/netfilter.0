From: Martin Gignac <martin.gignac@gmail.com>
Subject: Re: conntrackd "issue" in asymmetric scenario with TCP vs ICMP
Date: Wed, 7 Sep 2022 11:52:34 -0400
Message-ID: <CANf9dFOqhO7AuA2RPq=tUR=Gu9BkdvduZf0qBWNbsfxqAt4_Nw@mail.gmail.com>
References: <CANf9dFNw9cOQ_mnViaTyZMcJAdsScAX9e6fvV0wb1LW7RYuoCg@mail.gmail.com>
 <YxiwKBIbUmjUyjQA@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=vigpJFW30zx7Zq4YDa//7++2CxATL2O5mlzaDjy789M=;
        b=UXY3/tfA0nScFqb10Jh73feA7VuMIH5qna20avyofa+GRToy5ICSTsOu5zGzmO1FYJ
         /bL9HbxYNRVtSZJYufXHXSc4rQbz5CS9/3LBC0zVKhidv20rUfNJ4k/ihiXeFo+veajq
         g+veagTKipnXllU5PhlyVHNcTGZhp4WypT1XiF92yZ1Iwjv4p0A+CoXam/y2AlJqoMwY
         miPZqup/WY0vk0CdKPPGOw3wUnujtGbqQi/yFLfn5y4v1xAlMy05+m/8vU4cmSgw/rl5
         prO9kBjr0hDMglLn7OD496vdgszzkyLRE1N5CPMYIeFdVxlClklgaOSpgvawc4nNmlAc
         zY+Q==
In-Reply-To: <YxiwKBIbUmjUyjQA@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Thanks for the clarification Pablo.

Regards,
-Martin


On Wed, Sep 7, 2022 at 10:52 AM Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>
> On Fri, Sep 02, 2022 at 06:22:16PM -0400, Martin Gignac wrote:
> > Hi,
> >
> > (Apologies in advance if this is not the right place for this question).
> >
> > I am running conntrackd between two Linux firewalls running on Fedora
> > 35 using the following configuration:
> >
> >     Sync {
> >         Mode FTFW {
> >             ResendQueueSize 131072
> >             PurgeTimeout 60
> >             ACKWindowSize 300
> >             DisableExternalCache On
> >             StartupResync On
> >         }
> >         UDP {
> >             IPv4_address 172.16.1.1
> >             IPv4_Destination_Address 172.16.1.2
> >             Port 3781
> >             Interface bond0
> >             SndSocketBuffer 1249280
> >             RcvSocketBuffer 1249280
> >             Checksum on
> >         }
> >         Options {
> >             TCPWindowTracking Off
> >             ExpectationSync On
> >         }
> >     }
> >     General {
> >         Systemd on
> >         HashSize 32768
> >         HashLimit 131072
> >         LogFile on
> >         Syslog off
> >         LockFile /var/lock/conntrack.lock
> >         UNIX {
> >             Path /var/run/conntrackd.ctl
> >         }
> >         NetlinkBufferSize 2097152
> >         #NetlinkBufferSizeMaxGrowth 8388608
> >         NetlinkBufferSizeMaxGrowth 83886080
> >         NetlinkOverrunResync On
> >         NetlinkEventsReliable Off
> >         EventIterationLimit 100
> >         Filter From Userspace {
> >             Protocol Accept {
> >                 TCP
> >                 UDP
> >                 ICMP
> >             }
> >             Address Ignore {
> >                 IPv4_address 127.0.0.1
> >                 IPv4_address 172.16.1.0/29
> >                 IPv4_address 192.168.1.24/29
> >                 IPv6_address ::1
> >             }
> >         }
> >     }
> >
> > In an asymmetric scenario where incoming traffic flows through
> > firewall "A" and outgoing traffic through firewall "B", I've noticed
> > that pings work, but that SSH does not. In the case of pings, the
> > first ICMP echo reply flowing through firewall "B" sent in response to
> > the first ICMP echo request is dropped by "B" because the traffic is
> > "invalid" according to the nft trace, but subequent echo replies make
> > it through as they are recognized as being part of an existing state.
> > So far I assumed that the first packet was dropped because "B" hadn't
> > yet received the [NEW] conntrack state from "A" by the way it received
> > the echo reply.
> >
> > However, in the case of an SSH session establishment where the SYN
> > packet goes through "A" and the SYN-ACK packet goes through "B", nft
> > trace always shows the SYN-ACK (including retransmissions) as being
> > dropped because it is "invalid".
> >
> > Why does the ping reply eventually get recognized as being part of an
> > established state, but not the SYN-ACK? Is it a misconfiguration in my
> > conntrackd.conf? Are TCP 3-way handshakes supported by conntrackd in
> > asymmetric flows?
> >
> > I'm not sure exactly if I missed some deeper trace I can perform on
> > the states being sent/received by conntrackd between each firewall. I
> > thought if I could get more visibility in those that it might become
> > obvious why the scenario isn't working.
> >
> > If anyone has hints to help me troubleshoot, or can point to mistakes
> > in my configuration, my setup, or even my expectations, I would
> > appreciate it.
>
> Flow should be distributed evenly between routers, pure assymetric
> packet-based distribution is prone to race between internal state
> updates triggered by packets and the state synchronization itself.
