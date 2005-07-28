From: "Andrew" <andrewna@mymcsb.com>
Subject: RE: Problem downloading large files from Apache from far
Date: Thu, 28 Jul 2005 15:18:00 +0800
Message-ID: <NJBBIPFCOLMFJFKBPLDMIEKCCCAA.andrewna@mymcsb.com>
References: <5d2f379105072722046f7e3285@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5d2f379105072722046f7e3285@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: "curby ." <curby.public@gmail.com>
Cc: netfilter@lists.netfilter.org

Hi Curby,

Thanks for your suggestion.

However, i'm a bit unclear about the machine between iptables and pix.
Say if pix is 192.168.1.52 and the linux box with iptables is 192.168.1.3
does it mean we add another testbox  192.168.1.7? how to make the traffic
pass through the testbox?

BTW, I do have a TCP dump. What I notice is the packet being rejected by the
firewall (iptables) after a few exchanges of packets

Here:
19:05:08.778740 IP 192.168.1.3.32877 > 192.168.1.1.domain:  38634+ PTR?
4.1.168.192.in-addr.arpa. (42)
19:05:08.779552 arp who-has 192.168.1.3 tell 192.168.1.1
19:05:08.779567 arp reply 192.168.1.3 is-at 00:02:b3:1b:5a:a6
19:05:08.779682 IP 192.168.1.1.domain > 192.168.1.3.32877:  38634 NXDomain
0/1/0 (119)
19:05:08.779971 IP 192.168.1.3.32877 > 192.168.1.1.domain:  14470+ PTR?
3.1.168.192.in-addr.arpa. (42)
19:05:08.780177 IP 192.168.1.1.domain > 192.168.1.3.32877:  14470 NXDomain
0/1/0 (119)
19:05:08.780464 IP 192.168.1.3.32877 > 192.168.1.1.domain:  10355+ PTR?
1.1.168.192.in-addr.arpa. (42)
19:05:08.780657 IP 192.168.1.1.domain > 192.168.1.3.32877:  10355 NXDomain
0/1/0 (119)
19:05:09.183658 802.1d config 8000.00:03:31:31:f0:c0.801a root
8000.00:03:31:31:f0:c0 pathcost 0 age 0 max 20 hello 2 fdelay 15
19:05:11.184590 802.1d config 8000.00:03:31:31:f0:c0.801a root
8000.00:03:31:31:f0:c0 pathcost 0 age 0 max 20 hello 2 fdelay 15
19:05:11.867284 IP bb220-255-196-119.singnet.com.sg.1500 > 192.168.1.3.http:
S 1871688504:1871688504(0) win 16384 <mss 1380,nop,nop,sackOK>
19:05:11.867374 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1500:
S 2773111660:2773111660(0) ack 1871688505 win 5840 <mss 1460,nop,nop,sackOK>
19:05:11.867758 IP 192.168.1.3.32877 > 192.168.1.1.domain:  43253+ PTR?
119.196.255.220.in-addr.arpa. (46)
19:05:11.868131 IP 192.168.1.1.domain > 192.168.1.3.32877:  43253 1/3/3
(206)
19:05:13.187354 802.1d config 8000.00:03:31:31:f0:c0.801a root
8000.00:03:31:31:f0:c0 pathcost 0 age 0 max 20 hello 2 fdelay 15
19:05:13.778252 arp who-has 192.168.1.1 tell 192.168.1.3
19:05:13.778377 arp reply 192.168.1.1 is-at 00:02:b3:1b:55:37
19:05:14.844347 IP bb220-255-196-119.singnet.com.sg.1500 > 192.168.1.3.http:
S 1871688504:1871688504(0) win 16384 <mss 1380,nop,nop,sackOK>
19:05:14.844415 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1500:
S 2773111660:2773111660(0) ack 1871688505 win 5840 <mss 1460,nop,nop,sackOK>
19:05:15.190120 802.1d config 8000.00:03:31:31:f0:c0.801a root
8000.00:03:31:31:f0:c0 pathcost 0 age 0 max 20 hello 2 fdelay 15
19:05:15.376123 IP bb220-255-196-119.singnet.com.sg.1501 > 192.168.1.3.http:
S 1698186917:1698186917(0) win 16384 <mss 1380,nop,nop,sackOK>
19:05:15.376207 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
S 2779781512:2779781512(0) ack 1698186918 win 5840 <mss 1460,nop,nop,sackOK>
19:05:15.391665 IP bb220-255-196-119.singnet.com.sg.1501 > 192.168.1.3.http:
. ack 1 win 16560
19:05:15.399906 IP bb220-255-196-119.singnet.com.sg.1501 > 192.168.1.3.http:
P 1:382(381) ack 1 win 16560
19:05:15.399942 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. ack 382 win 6432
19:05:15.407262 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 1:1381(1380) ack 382 win 6432
19:05:15.407283 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 1381:2761(1380) ack 382 win 6432
19:05:15.431318 IP bb220-255-196-119.singnet.com.sg.1501 > 192.168.1.3.http:
. ack 2761 win 16560
19:05:15.431398 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 2761:4141(1380) ack 382 win 6432
19:05:15.431411 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 4141:5521(1380) ack 382 win 6432
19:05:15.431419 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 5521:6901(1380) ack 382 win 6432
19:05:15.457332 IP bb220-255-196-119.singnet.com.sg.1501 > 192.168.1.3.http:
. ack 5521 win 16560
19:05:15.457353 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 6901:8281(1380) ack 382 win 6432
19:05:15.457361 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 8281:9661(1380) ack 382 win 6432
19:05:15.457368 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 9661:11041(1380) ack 382 win 6432
19:05:15.478185 IP bb220-255-196-119.singnet.com.sg.1501 > 192.168.1.3.http:
. ack 8281 win 16560
19:05:15.478219 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
P 11041:12421(1380) ack 382 win 6432
19:05:15.478228 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 12421:13801(1380) ack 382 win 6432
19:05:15.478234 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 13801:15181(1380) ack 382 win 6432
19:05:15.482370 IP bb220-255-196-119.singnet.com.sg.1501 > 192.168.1.3.http:
. ack 11041 win 16560
19:05:15.482388 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 15181:16561(1380) ack 382 win 6432
19:05:15.482395 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
P 16561:17941(1380) ack 382 win 6432
19:05:15.482498 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 17941:19321(1380) ack 382 win 6432
19:05:15.502643 IP bb220-255-196-119.singnet.com.sg.1501 > 192.168.1.3.http:
. ack 13801 win 13800
19:05:15.502666 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 19321:20701(1380) ack 382 win 6432
19:05:15.502674 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 20701:22081(1380) ack 382 win 6432
19:05:15.502680 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 22081:23461(1380) ack 382 win 6432
19:05:15.507524 IP bb220-255-196-119.singnet.com.sg.1501 > 192.168.1.3.http:
. ack 16561 win 11040
19:05:15.507542 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 23461:24841(1380) ack 382 win 6432
19:05:15.507549 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 24841:26221(1380) ack 382 win 6432
19:05:15.507555 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
P 26221:27601(1380) ack 382 win 6432
19:05:15.517639 IP bb220-255-196-119.singnet.com.sg.1501 > 192.168.1.3.http:
. ack 19321 win 8280
19:05:15.528449 IP bb220-255-196-119.singnet.com.sg.1501 > 192.168.1.3.http:
. ack 22081 win 5520
19:05:15.533313 IP bb220-255-196-119.singnet.com.sg.1501 > 192.168.1.3.http:
. ack 24841 win 2760
19:05:15.538463 IP bb220-255-196-119.singnet.com.sg.1501 > 192.168.1.3.http:
. ack 27601 win 0
19:05:15.557989 IP bb220-255-196-119.singnet.com.sg.1501 > 192.168.1.3.http:
. ack 27601 win 16560
19:05:15.558048 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 27601:28981(1380) ack 382 win 6432
19:05:15.558060 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 28981:30361(1380) ack 382 win 6432
19:05:15.558067 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 30361:31741(1380) ack 382 win 6432
19:05:15.558074 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 31741:33121(1380) ack 382 win 6432
19:05:15.558082 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 33121:34501(1380) ack 382 win 6432
19:05:15.558090 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 34501:35881(1380) ack 382 win 6432
19:05:15.558097 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 35881:37261(1380) ack 382 win 6432
19:05:15.558104 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 37261:38641(1380) ack 382 win 6432
19:05:15.558112 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 38641:40021(1380) ack 382 win 6432
19:05:15.578985 IP bb220-255-196-119.singnet.com.sg.1501 > 192.168.1.3.http:
. ack 30361 win 16560
19:05:15.579021 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 40021:41401(1380) ack 382 win 6432
19:05:15.579029 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 41401:42781(1380) ack 382 win 6432
19:05:15.579035 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
P 42781:44161(1380) ack 382 win 6432
19:05:15.588844 IP bb220-255-196-119.singnet.com.sg.1501 > 192.168.1.3.http:
. ack 33121 win 16560
19:05:15.588883 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 44161:45541(1380) ack 382 win 6432
19:05:15.588891 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 45541:46921(1380) ack 382 win 6432
19:05:15.588898 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 46921:48301(1380) ack 382 win 6432
19:05:15.598643 IP bb220-255-196-119.singnet.com.sg.1501 > 192.168.1.3.http:
. ack 33121 win 16560 <nop,nop,sack sack 1 {931515784:931517164} >
19:05:15.598694 IP 192.168.1.3 > bb220-255-196-119.singnet.com.sg: icmp 60:
192.168.1.3 tcp port http unreachable
19:05:15.815947 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 33121:34501(1380) ack 382 win 6432
19:05:15.865935 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1500:
S 2773111660:2773111660(0) ack 1871688505 win 5840 <mss 1460,nop,nop,sackOK>
19:05:15.867431 IP 202.157.128.61 > 192.168.1.3: icmp 36: host
bb220-255-196-119.singnet.com.sg unreachable - admin prohibited filter
19:05:15.867787 IP 192.168.1.3.32877 > 192.168.1.1.domain:  14017+ PTR?
61.128.157.202.in-addr.arpa. (45)
19:05:15.948099 IP bb220-255-196-119.singnet.com.sg.1501 > 192.168.1.3.http:
. ack 34501 win 16560 <nop,nop,sack sack 1 {931515784:931517164} >
19:05:15.948149 IP 192.168.1.3 > bb220-255-196-119.singnet.com.sg: icmp 60:
192.168.1.3 tcp port http unreachable
19:05:15.953041 IP 192.168.1.1.domain > 192.168.1.3.32877:  14017 NXDomain
0/1/0 (106)
19:05:16.271906 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 33121:34501(1380) ack 382 win 6432
19:05:16.292634 IP bb220-255-196-119.singnet.com.sg.1501 > 192.168.1.3.http:
. ack 34501 win 16560 <nop,nop,sack sack 1 {931515784:931517164} >
19:05:16.292675 IP 192.168.1.3 > bb220-255-196-119.singnet.com.sg: icmp 60:
192.168.1.3 tcp port http unreachable
19:05:17.183767 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 33121:34501(1380) ack 382 win 6432
19:05:17.192868 802.1d config 8000.00:03:31:31:f0:c0.801a root
8000.00:03:31:31:f0:c0 pathcost 0 age 0 max 20 hello 2 fdelay 15
19:05:17.203753 IP bb220-255-196-119.singnet.com.sg.1501 > 192.168.1.3.http:
. ack 34501 win 16560 <nop,nop,sack sack 1 {931515784:931517164} >
19:05:17.203795 IP 192.168.1.3 > bb220-255-196-119.singnet.com.sg: icmp 60:
192.168.1.3 tcp port http unreachable
19:05:19.007492 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 33121:34501(1380) ack 382 win 6432
19:05:19.031526 IP bb220-255-196-119.singnet.com.sg.1501 > 192.168.1.3.http:
. ack 34501 win 16560 <nop,nop,sack sack 1 {931515784:931517164} >
19:05:19.031588 IP 192.168.1.3 > bb220-255-196-119.singnet.com.sg: icmp 60:
192.168.1.3 tcp port http unreachable
19:05:19.195624 802.1d config 8000.00:03:31:31:f0:c0.801a root
8000.00:03:31:31:f0:c0 pathcost 0 age 0 max 20 hello 2 fdelay 15
19:05:21.198394 802.1d config 8000.00:03:31:31:f0:c0.801a root
8000.00:03:31:31:f0:c0 pathcost 0 age 0 max 20 hello 2 fdelay 15
19:05:21.865045 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1500:
S 2773111660:2773111660(0) ack 1871688505 win 5840 <mss 1460,nop,nop,sackOK>
19:05:22.654935 IP 192.168.1.3.http > bb220-255-196-119.singnet.com.sg.1501:
. 33121:34501(1380) ack 382 win 6432
19:05:22.671600 IP bb220-255-196-119.singnet.com.sg.1501 > 192.168.1.3.http:
. ack 34501 win 16560 <nop,nop,sack sack 1 {931515784:931517164} >
19:05:22.671639 IP 192.168.1.3 > bb220-255-196-119.singnet.com.sg: icmp 60:
192.168.1.3 tcp port http unreachable



Regards,

Andrew

-----Original Message-----
From: curby . [mailto:curby.public@gmail.com]
Sent: Thursday, July 28, 2005 1:04 PM
To: Andrew
Cc: netfilter@lists.netfilter.org
Subject: Re: Problem downloading large files from Apache from far


On 7/26/05, Andrew <andrewna@mymcsb.com> wrote:
> But the question is, why are subsequent packets coming from the remote
> machine being identified as INVALID? Will allowing INVALID packets cause
> other problems?

Allowing INVALID is generally unnecessary, and can let certain port
scans through undetected.

> The Linux machine is actually behind another Cisco PIX firewall. Could the
> hardware firewall be translating the packets wrongly? Any ideas?

Can you try with a machine between the firewalls?  That would simulate
a web request but bypass PIX.

[iptables]---[testbox]---[PIX]---[Internet]

Running a tcpdump might also give useful information.




