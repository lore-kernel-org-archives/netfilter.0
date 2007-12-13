From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Network Communication Issues
Date: Thu, 13 Dec 2007 12:21:58 -0600
Message-ID: <47617846.5090101@riverviewtech.net>
References: <000b01c83ce4$71df9fb0$fe02a8c0@brammo.main> <4760800B.7040601@riverviewtech.net> <003e01c83db1$25d10460$fe02a8c0@brammo.main>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <003e01c83db1$25d10460$fe02a8c0@brammo.main>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 12/13/07 11:54, Jacob Lear wrote:
> [root@router ~]$ ping 192.168.1.11
> PING 192.168.1.11 (192.168.1.11) 56(84) bytes of data.
> 64 bytes from 192.168.1.11: icmp_seq=0 ttl=128 time=1.45 ms
> wrong data byte #30 should be 0x1e but was 0x8
> #16     10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 8 0 6 4 8 0 6 4 8 0 
> 6 4 1e 1f 20 1d 1e 1f
> #48     20 21 1e 1f 20 21 1e 1f
> 64 bytes from 192.168.1.11: icmp_seq=1 ttl=128 time=0.092 ms
> wrong data byte #30 should be 0x1e but was 0x72
> #16     10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 72 53 9 2 72 53 9 2 
> 72 53 9 2 1e 1f 20 1d 1e 1f
> #48     20 21 1e 1f 20 21 1e 1f

All references I see to "wrong data byte #30 should be 0x1e but was" 
suggest wrong drivers for the NIC.  Any thoughts?

> Here's the ifconfig output for the two NICs on "router":
> 
> eth1      Link encap:Ethernet  HWaddr 00:15:C5:F1:9B:13
>           inet addr:192.168.2.1  Bcast:192.168.2.255  Mask:255.255.255.0
>           inet6 addr: fe80::215:c5ff:fef1:9b13/64 Scope:Link
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:100525429 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:31105444 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:1000
>           RX bytes:124476618047 (115.9 GiB)  TX bytes:26593739981 (24.7 GiB)
>           Interrupt:169 Memory:f4000000-f4011100
> 
> 
> 
> eth2      Link encap:Ethernet  HWaddr 00:18:F8:09:48:6D
>           inet addr:192.168.1.1  Bcast:192.168.1.255  Mask:255.255.255.0
>           inet6 addr: fe80::218:f8ff:fe09:486d/64 Scope:Link
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:84630 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:77754600 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:1000
>           RX bytes:9127453 (8.7 MiB)  TX bytes:111588916824 (103.9 GiB)
>           Interrupt:193 Base address:0xcc00

Well, there is no subnet problem that I see.

> The Windows servers have similar settings. Each server has two NICs 
> -- For example, Fileshare has the main one configured as 192.168.2.10 
> with a mask of 255.255.255.0 and Gateway 192.168.2.1. The DNS and 
> WINS are set to point to the two domain controllers. The second 
> adapter is configured as 192.168.1.10 with a mask of 255.255.255.0. 
> I've left everything else blank.

Ok...

I'm not entirely sure that the blank gateway on the second NIC is not a 
problem, though I don't think it is your current problem.  I've had 
mixed results not putting a gateway in on all interface config panels in 
Windows before.

> I'll try this later tonight or tomorrow night.

Ok.  Based on what I said above, I'm not thinking that this will make a 
lot of difference, but go ahead and try it if any way if you don't mind. 
  At least that way we will know for sure.



Grant. . . .
