From: =?UTF-8?Q?Thomas_Gr=c3=bcnert?= 
        <thomas.gruenert@realestatepilot.com>
Subject: =?UTF-8?Q?DNS_answer_packet_=28UDP=29_can=c2=b4t_catch=c2=b4d_by_ap?=
 =?UTF-8?Q?plication?=
Date: Fri, 24 Feb 2023 15:59:05 +0100
Message-ID: <939767da-66bb-e6b2-29fc-01e5a0d8a73d@realestatepilot.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: de-DE, en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: 
Cc: netfilter@vger.kernel.org

Hello,

first of all - i am new to this list. please be tolerant of minor 
mistakes on my side.

I am running into a problem where DNS queries get a timeout. The 
original post is https://github.com/rancher/rke2/issues/3924


After some tests and research we saw that a DNS answer packet (UDP) does 
not reach the application. But tcpdump shows that the answer packet 
comes into container right in time. Application sends another packet 
after 5 sec. If the answer packet drops three times the application 
reports an IO timeout.

Problem occurs more often some minutes after having high network load 
inside the container.

netstat presents a counter  "|packet receive errors". This counter 
increments if a packet get lost.|

Udp:
     1482 packets received
     0 packets to unknown port received
     217 packet receive errors
     1699 packets sent
     0 receive buffer errors

All measures are made in inside container. The application runs inside 
this container too.

Host runs on:

Linux version 5.10.0-20-amd64 (debian-kernel@lists.debian.org) (gcc-10 
(Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 
2.35.2) #1 SMP Debian 5.10.158-2 (2022-12-13)

containerd github.com/k3s-io/containerd v1.6.14-k3s1 
6f9c63d571f5026e85a0768f0f2ef03d1c8dbc6e


Does anybody know how to fix the problem, how to do better diagnostic or 
where to go with that?

Thank you in advance!


