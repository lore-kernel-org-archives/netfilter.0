From: Ilo Lorusso <sneak147@gmail.com>
Subject: port based routing - help with tcpdump
Date: Mon, 8 Nov 2010 11:51:59 +0200
Message-ID: <AANLkTik6E8KDgN8S+J952ULLpzUjy2yAY9oNA1jv+ZEJ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=mmhJ3kYto3M1Pp5qwMwJZ/Bjmxh1WaM5d9kMm2F7LGQ=;
        b=JC8iivWzzwKj6Feyuqe/cRDFQ/RyCR479HaswtVRKDN8NcVRos0R9a5oRGdHQE/ii/
         cSreuOXaIKlkZRjQ9sllKujgxHspP7AYrRGVUvpSAr1A9WitptxgGXjSYO9Thv2BMUhX
         ewrgydYha02jIUnKN+lI/DSFThTHBXQXfHpJY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,


I implement port based routing using a howto I found from a website
(http://www.sparksupport.com/blog/tag/port-based-routing),
which I can see is working based on various tcpdumps from
various boxes. The problem is the port I route out to the alternate
interface does not connect even though I do see the traffic comeback
so I know the routing is working fine.

Below is a tcpdump when I try conenct to port 80 which I routed though
my alternated GW  10.0.2.1 and as you can see the traffic does come
back just does not connect? any Idea why..

 @ilo-desktop ~]# telnet 74.125.79.104 80
Trying 74.125.79.104...


11:01:30.358990 IP 10.0.2.1.59816 > 74.125.79.104.http: Flags [S], seq
111773512                                             9, win 5840,
options [mss 1460,sackOK,TS val 991674177 ecr 0,nop,wscale 5], leng
                                         th 0
11:01:30.625464 IP 74.125.79.104.http > 10.0.2.1.59816: Flags [S.],
seq 14219171                                             55, ack
1117735130, win 5672, options [mss 1380,sackOK,TS val 1342305044 ecr
991                                             674177,nop,wscale 6],
length 0
11:01:30.986013 IP 74.125.79.104.http > 10.0.2.1.59816: Flags [S.],
seq 14219171                                             55, ack
1117735130, win 5672, options [mss 1380,sackOK,TS val 1342305404 ecr
991                                             674177,nop,wscale 6],
length 0
11:01:31.586854 IP 74.125.79.104.http > 10.0.2.1.59816: Flags [S.],
seq 14219171                                             55, ack
1117735130, win 5672, options [mss 1380,sackOK,TS val 1342306005 ecr
991                                             674177,nop,wscale 6],
length 0
11:01:32.787899 IP 74.125.79.104.http > 10.0.2.1.59816: Flags [S.],
seq 14219171                                             55, ack
1117735130, win 5672, options [mss 1380,sackOK,TS val 1342307207 ecr
991                                             674177,nop,wscale 6],
length 0
11:01:33.358763 IP 10.0.2.1.59816 > 74.125.79.104.http: Flags [S], seq
111773512                                             9, win 5840,
options [mss 1460,sackOK,TS val 991677177 ecr 0,nop,wscale 5], leng
                                         th 0
11:01:33.624065 IP 74.125.79.104.http > 10.0.2.1.59816: Flags [S.],
seq 14219171                                             55, ack
1117735130, win 5672, options [mss 1380,sackOK,TS val 1342308043 ecr
991                                             674177,nop,wscale 6],
length 0
11:01:35.191210 IP 74.125.79.104.http > 10.0.2.1.59816: Flags [S.],
seq 14219171                                             55, ack
1117735130, win 5672, options [mss 1380,sackOK,TS val 1342309609 ecr
991                                             674177,nop,wscale 6],
length 0
11:01:39.358765 IP 10.0.2.1.59816 > 74.125.79.104.http: Flags [S], seq
111773512                                             9, win 5840,
options [mss 1460,sackOK,TS val 991683177 ecr 0,nop,wscale 5], leng
                                         th 0
11:01:39.625087 IP 74.125.79.104.http > 10.0.2.1.59816: Flags [S.],
seq 14219171                                             55, ack
1117735130, win 5672, options [mss 1380,sackOK,TS val 1342314043 ecr
991                                             674177,nop,wscale 6],
length 0
11:01:39.999634 IP 74.125.79.104.http > 10.0.2.1.59816: Flags [S.],
seq 14219171                                             55, ack
1117735130, win 5672, options [mss 1380,sackOK,TS val 1342314415 ecr
991                                             674177,nop,wscale 6],
length 0
11:02:05.826188 IP 10.0.2.1.59817 > 74.125.79.104.http: Flags [S], seq
168233514                                             2, win 5840,
options [mss 1460,sackOK,TS val 991709644 ecr 0,nop,wscale 5], leng
                                         th 0
11:02:06.106506 IP 74.125.79.104.http > 10.0.2.1.59817: Flags [S.],
seq 14990426                                             74, ack
1682335143, win 5672, options [mss 1380,sackOK,TS val 2101745572 ecr
991                                             709644,nop,wscale 6],
length 0
11:02:06.497469 IP 74.125.79.104.http > 10.0.2.1.59817: Flags [S.],
seq 14990426                                             74, ack
1682335143, win 5672, options [mss 1380,sackOK,TS val 2101745980 ecr
991                                             709644,nop,wscale 6],
length 0
11:02:07.096684 IP 74.125.79.104.http > 10.0.2.1.59817: Flags [S.],
seq 14990426                                             74, ack
1682335143, win 5672, options [mss 1380,sackOK,TS val 2101746580 ecr
991                                             709644,nop,wscale 6],
length 0
11:02:08.296750 IP 74.125.79.104.http > 10.0.2.1.59817: Flags [S.],
seq 14990426                                             74, ack
1682335143, win 5672, options [mss 1380,sackOK,TS val 2101747780 ecr
991                                             709644,nop,wscale 6],
length 0
11:02:08.825773 IP 10.0.2.1.59817 > 74.125.79.104.http: Flags [S], seq
168233514                                             2, win 5840,
options [mss 1460,sackOK,TS val 991712644 ecr 0,nop,wscale 5], leng
                                         th 0
11:02:09.088040 IP 74.125.79.104.http > 10.0.2.1.59817: Flags [S.],
seq 14990426                                             74, ack
1682335143, win 5672, options [mss 1380,sackOK,TS val 2101748572 ecr
991                                             709644,nop,wscale 6],
length 0
11:02:10.696694 IP 74.125.79.104.http > 10.0.2.1.59817: Flags [S.],
seq 14990426                                             74, ack
1682335143, win 5672, options [mss 1380,sackOK,TS val 2101750180 ecr
991                                             709644,nop,wscale 6],
length 0
11:02:14.825755 IP 10.0.2.1.59817 > 74.125.79.104.http: Flags [S], seq
168233514                                             2, win 5840,
options [mss 1460,sackOK,TS val 991718644 ecr 0,nop,wscale 5], leng
                                         th 0
11:02:15.089043 IP 74.125.79.104.http > 10.0.2.1.59817: Flags [S.],
seq 14990426                                             74, ack
1682335143, win 5672, options [mss 1380,sackOK,TS val 2101754572 ecr
991                                             709644,nop,wscale 6],
length 0
11:02:15.498657 IP 74.125.79.104.http > 10.0.2.1.59817: Flags [S.],
seq 14990426                                             74, ack
1682335143, win 5672, options [mss 1380,sackOK,TS val 2101754980 ecr
991                                             709644,nop,wscale 6],
length 0





eth0      Link encap:Ethernet  HWaddr 00:15:58:DB:64:0F
          inet addr:172.69.128.97  Bcast:172.69.128.127  Mask:255.255.255.128
          inet6 addr: fe80::215:58ff:fedb:640f/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:4547216 errors:0 dropped:0 overruns:0 frame:0
          TX packets:4630235 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:2953576440 (2.7 GiB)  TX bytes:3492554030 (3.2 GiB)
          Interrupt:17



neta      Link encap:UNSPEC  HWaddr
AC-45-80-62-00-00-71-72-00-00-00-00-00-00-00-00
          inet addr:10.0.2.1  P-t-P:10.0.2.1  Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP  MTU:1476  Metric:1
          RX packets:2975 errors:0 dropped:0 overruns:0 frame:0
          TX packets:6405 errors:170 dropped:0 overruns:0 carrier:0
          collisions:170 txqueuelen:0
          RX bytes:141060 (137.7 KiB)  TX bytes:384796 (375.7 KiB)
