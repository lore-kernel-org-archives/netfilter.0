From: Mike Wright <mike.wright@mailinator.com>
Subject: Re: simple/ubiquitous iptables NAT config no longer works
Date: Wed, 26 Oct 2011 10:51:03 -0700
Message-ID: <4EA84887.7090005@mailinator.com>
References: <CAA+mFXNdGDpickA-JNukzmHhgtGM+AtZ=2dDpfvh6G-ZYdY3xA@mail.gmail.com> <CAA+mFXPp3vcLiABSpwNrP6jLmMB8V6QrbiQoUSOysAG1N4V4JQ@mail.gmail.com> <20111018101245.0d910cb6@catus> <CAA+mFXNnJyQLQjL9Tq3=GODy_3G0uM4bns0+zy-10Q7jH2Wxsw@mail.gmail.com> <CAA+mFXP0v2TxRxz0RDWfvwxX5zGG_QPMLygSbQM_tyZ6vLBALg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAA+mFXP0v2TxRxz0RDWfvwxX5zGG_QPMLygSbQM_tyZ6vLBALg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pawel Karpowicz <mafeuser@gmail.com>
Cc: netfilter@vger.kernel.org

On 10/26/2011 10:22 AM, Pawel Karpowicz wrote:
> I didn't get the help so maybe I should ask someone for simple NAT
> configuration for iptables v.1.4.10?
>
>> my ubuntu plays role of simple router. It has 2 interfaces
>> eth0(public), eth1(private):
>>
>> eth0      Link encap:Ethernet  HWaddr 00:18:8b:04:8a:13
>>           inet addr:89.73.128.70  Bcast:255.255.255.255  Mask:255.255.252.0
>>           UP BROADCAST RUNNING MULTICAST  MTU:576  Metric:1
>>           RX packets:8535 errors:0 dropped:0 overruns:0 frame:0
>>           TX packets:4873 errors:0 dropped:0 overruns:0 carrier:0
>>           collisions:0 txqueuelen:1000
>>           RX bytes:3044029 (3.0 MB)  TX bytes:448928 (448.9 KB)
>>           Interrupt:16
>>
>>
>> eth1      Link encap:Ethernet  HWaddr 00:02:b3:8c:dc:e7
>>           inet addr:192.168.10.1  Bcast:192.168.10.255  Mask:255.255.255.0
>>           UP BROADCAST MULTICAST  MTU:1500  Metric:1
>>           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>>           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>>           collisions:0 txqueuelen:1000
>>           RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
>>
>> behind the NAT, there is one machine.

Maybe this will work?

In the nat table:

-A PREROUTING -i eth0 -j DNAT --to-destination 192.168.10.1
-A POSTROUTING -o eth0 -j SNAT --to-source 89.73.128.70

You must also enable forwarding.

I don't know Ubuntu but in Redhat that's

echo 1 > /proc/sys/net/ipv4/ip_forward (temporary)

-- or --

in /etc/sysctl.conf

net.ipv4.ip_forward = 1  (permanent)

hth,
Mike Wright
