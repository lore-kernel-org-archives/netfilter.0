From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: only the first FORWARD rule is matching
Date: Tue, 28 Oct 2014 10:08:07 +0530
Message-ID: <CAA5aLPjs9Oi4WS5dZ_v5nbEkZ+D++o3OxqhO62sBBDLvQTA=wQ@mail.gmail.com>
References: <006f01cff1e9$e8e269a0$baa73ce0$@eazyraider.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=yGxq/JkFWJ/ZrurwnWBdCA6Ej64V7RNy04ttdUF/V8M=;
        b=0iRRaD5nl9EzWAudnsPqfUmGB7YUDDe95beZnnyaoNOsduhELPX2kWCt1lIp/lN7VS
         AwV0ceKo4mJCV64tafchS5AiBsSkdIqFxodv2wMSzmI05WqasvR/c0sU9qtBWET1nTJv
         Njbycj3WAyaM4DNMWJX1Py5x5cyLmso9Co0207cGkOBnyo9F00bB2LaUZkUuwisqxxxP
         pv7R1dW0HMou/J4OA/ax3aWUgYzMB8LDl/USJU40ji3qSRjOnSXl15lmUeENlHCDmDii
         EBi8UJ+oP0ZUUxV1P4NtonUPHukDr+2nz0xzHJd5gwnzOCbAdj0xjxpodmTTGpjJGd2w
         K1hg==
In-Reply-To: <006f01cff1e9$e8e269a0$baa73ce0$@eazyraider.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

As you say that you are forwarding it to different host that means u
must be having some natting  rules also. Kindly post output of
iptables -t nat  -l -n -v.

On Mon, Oct 27, 2014 at 6:58 PM, Ralf Schwarzmaier <ralf@eazyraider.de> wrote:
> Hello,
>
> I'm stuck with a problem regarding two most identical iptables rules, except
> the IP and UDP Port.
>
> What I'm trying to do:
> My linux box is receiving Packets on two different UDP Ports at eth0
> (192.168.1.0/24) and I'm trying to forward those packets to different hosts
> in the network connected to eth1 (192.168.245.0/24).
>
> The Problem:
> Only the first added iptables FORWARD rule is working.
> root@thebox:~# iptables -I FORWARD -i eth0 -p udp --dport 20044 -j ACCEPT
>
> If I add the second rule, it gets completely ignored.
> root@thebox:~# iptables -I FORWARD -i eth0 -p udp --dport 20048 -j ACCEPT
>
> And iptables confirms this in the packet statistics.
> root@thebox:~# iptables -L -v -n
> Chain INPUT (policy ACCEPT 9523 packets, 11M bytes)
>  pkts bytes target     prot opt in     out     source
> destination
>
> Chain FORWARD (policy DROP 0 packets, 0 bytes)
>  pkts bytes target     prot opt in     out     source
> destination
>     0     0 ACCEPT     udp  --  eth0   *       0.0.0.0/0
> 0.0.0.0/0            udp dpt:20048
> 27858   32M ACCEPT     udp  --  eth0   *       0.0.0.0/0
> 0.0.0.0/0            udp dpt:20044
>
> Chain OUTPUT (policy ACCEPT 219 packets, 80793 bytes)
>  pkts bytes target     prot opt in     out     source
> destination
>
>
> The interesting fakt is, that if I delete the rules and add them in reverse
> order, the other rule is working.
>
> Just to go for sure, here is a snipped of the tcpdump output where you can
> see the packets arriving at the box on eth0.
> root@thebox:~# tcpdump -n -i eth0 udp
> [ 1601.022974] device eth0 entered promiscuous mode
> tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
> listening on eth0, link-type EN10MB (Ethernet), capture size 65535 bytes
> 07:31:04.589742 IP 192.168.1.5.514 > 192.168.1.1.514: SYSLOG kernel.info,
> length: 62
> 07:31:04.611714 IP 192.168.1.1.10038 > 192.168.1.5.20044: UDP, length 1408
> 07:31:04.611843 IP 192.168.1.1.10038 > 192.168.1.5.20048: UDP, length 1408
> 07:31:04.612004 IP 192.168.1.1.10038 > 192.168.1.5.20044: UDP, length 1374
> 07:31:04.612124 IP 192.168.1.1.10038 > 192.168.1.5.20048: UDP, length 1374
> 07:31:04.621323 IP 192.168.1.1.10038 > 192.168.1.5.20044: UDP, length 456
> 07:31:04.621374 IP 192.168.1.1.10038 > 192.168.1.5.20048: UDP, length 456
> 07:31:04.651705 IP 192.168.1.1.10038 > 192.168.1.5.20044: UDP, length 1378
> 07:31:04.651816 IP 192.168.1.1.10038 > 192.168.1.5.20048: UDP, length 1378
>
> Maybe the sourceport of the packets is reason for this strange behaviour.
>
> Versioninformations:
> iptables v1.4.14
> kernel 3.4.4
>
> Does anybody an idea to get my problem solved, or even the reason for?
>
> I really appreciate any help you can provide to solve the problem.
>
> Ralf Schwarzmaier
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
