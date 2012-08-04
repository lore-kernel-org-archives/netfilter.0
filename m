From: Ashwin Rao <ashwin.shirvanthe@gmail.com>
Subject: Forwarding packets received by tun device
Date: Fri, 3 Aug 2012 23:31:22 -0700
Message-ID: <CAJNbMrwUnLwUYRm==4cO2j42_DbBJ83WHG5=7z8HPR3k9Dr7Nw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=Rd6TAVqoPfeNDRFJFCE5peGEz0/0TzwxSEek6+bTaZw=;
        b=lAZWrb38MZVfPU90XxCy6rAAYiFfeHn9HD2wcLoHMOSI82HfvNR403BF3NnB6d8AHG
         kctefWTl4oIXnCYWF3pY3Atyt1cqvuTQYV5QUcgWJ1f5pCyajWTuuyDaEt+SKMJpCWBE
         7cEF2QOigPLfiTueC1VySkk+kXo3h/TDVhxubvjWqQbrhKcFHXbEU2U1KHZV02/dpk0o
         Lr477VkJizF+b48QaK1xgrnlra/TGG7QUKPUuKwivSRW9HlCrHqC5O0km8QlJfsfkUU/
         Frya5SXaL1qo4j+UtRoKXiYsVkTuM/jOaeGqpWTcYtWzQHLVr227anFJ8OUVKVaTXf1N
         boqA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I am currently writing raw packets to the file descriptor
corresponding to a tun device (tun0). My tun device has an ip address
of 192.168.1.1 and the packets I write have a source ip of
192.168.1.0/24. I confirm that these packets have been received by the
tunnel device using the following ifconfig command which shows that
567 kB (the amount I wrote) was received. All these packet received
were either TCP syn packets or DNS queries.

# ifconfig tun0
tun0      Link encap:UNSPEC  HWaddr
00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
          inet addr:192.168.1.1  P-t-P:192.168.1.1  Mask:255.255.254.0
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1500  Metric:1
          RX packets:9427 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:500
          RX bytes:567119 (567.1 KB)  TX bytes:0 (0.0 B)

Similarly when I run tcpdump -i tun0 I can see the packets written by
my process. I did this to ensure that the packets were correctly
written. To forward these packets to the Internet I have added a rule
in the NAT table to ensure that these packets get NATed on their way
out. I have added routing table rules that explicitly route packets
from 192.168.1.0/24.  I verified this using the command

# ip -s route get 1.2.3.4 from 192.168.1.1
1.2.3.4 from 192.168.1.1 via 128.a.b.c dev eth1
    cache  users 1

However I cannot see the packets written by my process in the logs of
any chains. I have enabled logging on all the primary chains -- INPUT,
OUTPUT, FORWARD, and all the chains in the nat table -- PREROUTING,
INPUT, OUTPUT POSTROUTING, and all the chains in the raw table --
PREROUTING, and OUTPUT. However, I fail to see the packets. I do not
know how to determine the place where these packets are being dumped.
I have enabled rp_filter in all my interfaces and I am logging the
martian packets however these packets are not being reported as
martians as well (which is expected).

On the other hand if I FORWARD packets received on my ethernet
interface to the tunnel interface I can see them being transmitted by
my tunnel interface. These packets are received by my process that is
reading on the file descriptor corresponding to my tunnel interface. I
can also see these packets getting logged in the FORWARD chain.

I was hoping that since ethernet to tunnel forwarding is working I
should be able to get the tunnel to ethernet forwarding to work.
However, I fail to locate the reason and the place where the
forwarding fails. I had a look at the tun driver which shows that the
rx counters are incremented when netif_rx_ni(skb) succeeds. I am under
the assumption that once these packets are received then I must be
able to see them in the logs of at least one chain. I would like to
know as to why these packets are being dropped.

Regards,
Ashwin
