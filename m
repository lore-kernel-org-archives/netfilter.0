From: Ashwin Rao <ashwin.shirvanthe@gmail.com>
Subject: Re: Forwarding packets received by tun device
Date: Sat, 4 Aug 2012 20:23:45 -0700
Message-ID: <CAJNbMrw59=xaqrHopAFiKJYgwC6EdEL1W7XCU1cenFSgb=c6hw@mail.gmail.com>
References: <CAJNbMrwUnLwUYRm==4cO2j42_DbBJ83WHG5=7z8HPR3k9Dr7Nw@mail.gmail.com>
	<CADGd2DqXkiLLRXjxay1Cia03J5kcV+7HbSbQB8aBMK+PmmWecg@mail.gmail.com>
	<CAJNbMry6UgE1C=psDorGB9KijV6nanTChL6ydf5gmO4+V9jozg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=HfofT36VCTyGeh6ppZjlUE6WxZ4sjqp+ewo0Na3O7eY=;
        b=kxnAnX1L8E3OL3HGFSXFqcOCmJMYz0pe5UBi3nd/teRKld+hAgkqTOm3bR5HJJI7bi
         Pivi6w6oHtKo1i8yItI34/cLT1JSYPhJbDOEQPRcZb1mF2dTEdB28k8bGFiQYroX9Bkd
         zVuGF6z2oABOf/Dm2otMAT2RWkRTXnp0ENJuYzWnXWnPiomlpmBQJVy6aQ7/v72nJ2C1
         iP5ltj15SN8u4kIDIbKQ4rsaw1NNLrPSUwY4FGyZnQ8ELq8jf5jwsdyA6bJVNVdbiZkc
         NGf+2rp9lSJp0tEtN+wEAElv+XyYHNLoqz4Wu4pPSbthQ9oWlmyy5wsOH7O3u9dXRH9h
         +SBw==
In-Reply-To: <CAJNbMry6UgE1C=psDorGB9KijV6nanTChL6ydf5gmO4+V9jozg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Sat, Aug 4, 2012 at 7:01 AM, Ashwin Rao <ashwin.shirvanthe@gmail.com> wrote:
>
>
> On Saturday, August 4, 2012, John Lauro <johnalauro@gmail.com> wrote:
>> What kernel version do you have?
> The kernel version is 3.2.6 on an ubuntu 12.04 machine.
>
>> You may want to verify
>>  cat /proc/sys/net/ipv4/conf/*/rp_filter
>> returns all 0.
>
> Yes I observe a value of 0 for all entries.
>

I realized that there was some bug in the checksum of the packets I
was writing. I fixed this. Now, the packets now reach the FORWARD
table however I want to NAT these packets and the packets are not
being processed by the NAT table.

>
>> On Sat, Aug 4, 2012 at 2:31 AM, Ashwin Rao <ashwin.shirvanthe@gmail.com>
>> wrote:
>>> Hi,
>>>
>>> I am currently writing raw packets to the file descriptor
>>> corresponding to a tun device (tun0). My tun device has an ip address
>>> of 192.168.1.1 and the packets I write have a source ip of
>>> 192.168.1.0/24. I confirm that these packets have been received by the
>>> tunnel device using the following ifconfig command which shows that
>>> 567 kB (the amount I wrote) was received. All these packet received
>>> were either TCP syn packets or DNS queries.
>>>
>>> # ifconfig tun0
>>> tun0      Link encap:UNSPEC  HWaddr
>>> 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
>>>           inet addr:192.168.1.1  P-t-P:192.168.1.1  Mask:255.255.254.0
>>>           UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1500  Metric:1
>>>           RX packets:9427 errors:0 dropped:0 overruns:0 frame:0
>>>           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>>>           collisions:0 txqueuelen:500
>>>           RX bytes:567119 (567.1 KB)  TX bytes:0 (0.0 B)
>>>
>>> Similarly when I run tcpdump -i tun0 I can see the packets written by
>>> my process. I did this to ensure that the packets were correctly
>>> written. To forward these packets to the Internet I have added a rule
>>> in the NAT table to ensure that these packets get NATed on their way
>>> out. I have added routing table rules that explicitly route packets
>>> from 192.168.1.0/24.  I verified this using the command
>>>
>>> # ip -s route get 1.2.3.4 from 192.168.1.1
>>> 1.2.3.4 from 192.168.1.1 via 128.a.b.c dev eth1
>>>     cache  users 1
>>>
>>> However I cannot see the packets written by my process in the logs of
>>> any chains. I have enabled logging on all the primary chains -- INPUT,
>>> OUTPUT, FORWARD, and all the chains in the nat table -- PREROUTING,
>>> INPUT, OUTPUT POSTROUTING, and all the chains in the raw table --
>>> PREROUTING, and OUTPUT. However, I fail to see the packets. I do not
>>> know how to determine the place where these packets are being dumped.
>>> I have enabled rp_filter in all my interfaces and I am logging the
>>> martian packets however these packets are not being reported as
>>> martians as well (which is expected).
>>>
>>> On the other hand if I FORWARD packets received on my ethernet
>>> interface to the tunnel interface I can see them being transmitted by
>>> my tunnel interface. These packets are received by my process that is
>>> reading on the file descriptor corresponding to my tunnel interface. I
>>> can also see these packets getting logged in the FORWARD chain.
>>>
>>> I was hoping that since ethernet to tunnel forwarding is working I
>>> should be able to get the tunnel to ethernet forwarding to work.
>>> However, I fail to locate the reason and the place where the
>>> forwarding fails. I had a look at the tun driver which shows that the
>>> rx counters are incremented when netif_rx_ni(skb) succeeds. I am under
>>> the assumption that once these packets are received then I must be
>>> able to see them in the logs of at least one chain. I would like to
>>> know as to why these packets are being dropped.
>>>
>>> Regards,
>>> Ashwin
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
