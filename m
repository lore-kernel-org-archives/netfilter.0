From: vDev <vijaypas@gmail.com>
Subject: Re: TCP LAST ACK incorrectly treated as invalid
Date: Tue, 21 Oct 2014 17:14:29 -0500
Message-ID: <CAC=w+U6j+V6zLvdVBQKYjBSRq6YXshLPzXyg3G-NYZvk23CCEQ@mail.gmail.com>
References: <CAC=w+U7t8K2yjKtj7NDfS-xrCLRxoZ_hPxBU=EiD57v+eQnCMA@mail.gmail.com>
	<alpine.DEB.2.10.1410210852310.27469@blackhole.kfki.hu>
	<CAC=w+U5v6oj0zJFTZvjPomyf+pFdFCJrXgdWVG7QQDuttuhC1g@mail.gmail.com>
	<alpine.DEB.2.10.1410212037070.32297@blackhole.kfki.hu>
	<CAC=w+U7h2njKOB74XwP-C-Y37kcTDLKw2vGCUuK+afzCueqpQg@mail.gmail.com>
	<alpine.DEB.2.10.1410212228290.741@blackhole.kfki.hu>
	<alpine.DEB.2.10.1410212248510.938@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=tHb4Kaqjwxkx9bT+m0uEVdZrAmg1tlWktCCA+bqx+3E=;
        b=lxlq3tCush9Dle3pDC/w+7JbhtR1Dyx+8YntnnPQtxrzgAJtqqh7CfCE7vTH45+5tQ
         iSW3bBCwRoojyf5F0ngnRSquLVlQe9zn7vzIDidnUm0e9D5LjQVa7i0XE1ujWAgsz+l6
         XeyhTjSdo6WqtDGqNX/OHz3vgkwjjiWudIunAS4ZuEs6y3U/d1Rfk12Qsi2LP8kXijH+
         URDsVY1qaT12NeUJt/Xgs2kmTdnY5u1jgIUgi0dxQOepgY0XQI/keZymXixe9yiqhTug
         vu93CkhMS0WQermGAf1PwWEREZbPA1XtjkHEH9uK6bjkzit63lK0d5jyCzVKl8UY5dBK
         ZVPw==
In-Reply-To: <alpine.DEB.2.10.1410212248510.938@blackhole.kfki.hu>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

I am unable to post a pcap file at this point but here is an ASCII
output. The last ACK (ID: 6200) was considered invalid due to III
evaluating to 0 and res=0 in the earlier trace.

tcpdump: listening on eth2, link-type EN10MB (Ethernet), capture size
262144 bytes
16:39:34.462344 IP (tos 0x0, ttl 63, id 11, offset 0, flags [none],
proto TCP (6), length 44)
    Linux_Router.1026 > REMOTE_SERVER.63001: Flags [S], cksum 0xeaa4
(correct), seq 1278607360, win 1500, options [mss 536], length 0
16:39:34.518272 IP (tos 0x0, ttl 52, id 0, offset 0, flags [DF], proto
TCP (6), length 44)
    REMOTE_SERVER.63001 > Linux_Router.1026: Flags [S.], cksum 0xaf17
(correct), seq 913887703, ack 1278607361, win 14600, options [mss
536], length 0
16:39:34.529264 IP (tos 0x0, ttl 63, id 12, offset 0, flags [none],
proto TCP (6), length 40)
    Linux_Router.1026 > REMOTE_SERVER.63001: Flags [.], cksum 0xf664
(correct), seq 1, ack 1, win 1500, length 0
16:39:35.199013 IP (tos 0x0, ttl 63, id 13, offset 0, flags [none],
proto TCP (6), length 70)
    Linux_Router.1026 > REMOTE_SERVER.63001: Flags [P.], cksum 0x54a7
(correct), seq 1:31, ack 1, win 1500, length 30
16:39:35.255619 IP (tos 0x0, ttl 52, id 6197, offset 0, flags [DF],
proto TCP (6), length 40)
    REMOTE_SERVER.63001 > Linux_Router.1026: Flags [.], cksum 0xc31a
(correct), seq 1, ack 31, win 14600, length 0
16:39:35.256164 IP (tos 0x0, ttl 52, id 6198, offset 0, flags [DF],
proto TCP (6), length 58)
    REMOTE_SERVER.63001 > Linux_Router.1026: Flags [P.], cksum 0xc6ca
(correct), seq 1:19, ack 31, win 14600, length 18
16:39:35.256521 IP (tos 0x0, ttl 52, id 6199, offset 0, flags [DF],
proto TCP (6), length 40)
    REMOTE_SERVER.63001 > Linux_Router.1026: Flags [F.], cksum 0xc307
(correct), seq 19, ack 31, win 14600, length 0
16:39:35.266911 IP (tos 0x0, ttl 63, id 14, offset 0, flags [none],
proto TCP (6), length 40)
    Linux_Router.1026 > REMOTE_SERVER.63001: Flags [.], cksum 0xf634
(correct), seq 31, ack 19, win 1500, length 0
16:39:35.273232 IP (tos 0x0, ttl 63, id 15, offset 0, flags [none],
proto TCP (6), length 40)
    Linux_Router.1026 > REMOTE_SERVER.63001: Flags [F.], cksum 0xf632
(correct), seq 31, ack 20, win 1500, length 0
16:39:35.328857 IP (tos 0x0, ttl 52, id 6200, offset 0, flags [DF],
proto TCP (6), length 40)
    REMOTE_SERVER.63001 > Linux_Router.1026: Flags [.], cksum 0xc306
(correct), seq 20, ack 32, win 14600, length 0
16:39:35.329297 IP (tos 0x0, ttl 64, id 0, offset 0, flags [DF], proto
TCP (6), length 40)
    Linux_Router.1026 > REMOTE_SERVER.63001: Flags [R], cksum 0x047f
(correct), seq 1278607392, win 0, length 0
16:39:38.293532 IP (tos 0x0, ttl 63, id 16, offset 0, flags [none],
proto TCP (6), length 40)
    Linux_Router.1026 > REMOTE_SERVER.63001: Flags [F.], cksum 0xf632
(correct), seq 31, ack 20, win 1500, length 0
16:39:41.333370 IP (tos 0x0, ttl 63, id 17, offset 0, flags [none],
proto TCP (6), length 40)
    Linux_Router.1026 > REMOTE_SERVER.63001: Flags [F.], cksum 0xf632
(correct), seq 31, ack 20, win 1500, length 0
16:39:44.373300 IP (tos 0x0, ttl 63, id 18, offset 0, flags [none],
proto TCP (6), length 40)
    Linux_Router.1026 > REMOTE_SERVER.63001: Flags [F.], cksum 0xf632
(correct), seq 31, ack 20, win 1500, length 0
16:39:47.413089 IP (tos 0x0, ttl 63, id 19, offset 0, flags [none],
proto TCP (6), length 40)
    Linux_Router.1026 > REMOTE_SERVER.63001: Flags [F.], cksum 0xf632
(correct), seq 31, ack 20, win 1500, length 0
16:39:50.452954 IP (tos 0x0, ttl 63, id 20, offset 0, flags [none],
proto TCP (6), length 40)
    Linux_Router.1026 > REMOTE_SERVER.63001: Flags [F.], cksum 0xf632
(correct), seq 31, ack 20, win 1500, length 0
16:39:53.492753 IP (tos 0x0, ttl 63, id 21, offset 0, flags [none],
proto TCP (6), length 40)
    Linux_Router.1026 > REMOTE_SERVER.63001: Flags [F.], cksum 0xf632
(correct), seq 31, ack 20, win 1500, length 0
16:39:56.532626 IP (tos 0x0, ttl 63, id 22, offset 0, flags [none],
proto TCP (6), length 40)
    Linux_Router.1026 > REMOTE_SERVER.63001: Flags [F.], cksum 0xf632
(correct), seq 31, ack 20, win 1500, length 0
16:39:59.572464 IP (tos 0x0, ttl 63, id 23, offset 0, flags [none],
proto TCP (6), length 40)
    Linux_Router.1026 > REMOTE_SERVER.63001: Flags [F.], cksum 0xf632
(correct), seq 31, ack 20, win 1500, length 0
16:40:02.612307 IP (tos 0x0, ttl 63, id 24, offset 0, flags [none],
proto TCP (6), length 40)
    Linux_Router.1026 > REMOTE_SERVER.63001: Flags [F.], cksum 0xf632
(correct), seq 31, ack 20, win 1500, length 0
16:40:05.652150 IP (tos 0x0, ttl 63, id 25, offset 0, flags [none],
proto TCP (6), length 40)
    Linux_Router.1026 > REMOTE_SERVER.63001: Flags [F.], cksum 0xf632
(correct), seq 31, ack 20, win 1500, length 0
16:40:08.691960 IP (tos 0x0, ttl 63, id 26, offset 0, flags [none],
proto TCP (6), length 40)
    Linux_Router.1026 > REMOTE_SERVER.63001: Flags [R], cksum 0xcb77
(correct), seq 1278621991, win 0, length 0


On Tue, Oct 21, 2014 at 3:49 PM, Jozsef Kadlecsik
<kadlec@blackhole.kfki.hu> wrote:
> On Tue, 21 Oct 2014, Jozsef Kadlecsik wrote:
>
>> On Tue, 21 Oct 2014, vDev wrote:
>>
>> > OK. Here it is. Please look for III=0 and subsequent res=0.
>>
>> This is not the dump of the TCP stream. Please send a tcpdump recording!
>
> And do not send it as an ascii dump but as a pcap file...
>
> Best regards,
> Joysef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
>           H-1525 Budapest 114, POB. 49, Hungary
