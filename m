From: anil dahiya <anildahiya80@gmail.com>
Subject: Re: Sending ICMP echo request out
Date: Tue, 13 Dec 2011 10:41:58 +0530
Message-ID: <CAHGPgw1Pg2GLb_AX_-EFBJz9swn5_AfbNCY7F164fnoqm3yKYA@mail.gmail.com>
References: <CAGZFCEEux4TBE+JAqzx9CDJ1HGdNXnqQBHBxhJ8TXEQh3Zq7_w@mail.gmail.com>
	<CAHGPgw1bL7XF6Ef29N_YQ-dAW3RYQe7j4-2zuWhFXQddW+Yg_g@mail.gmail.com>
	<1323374344.5818.1.camel@hakkenden.homenet>
	<CAHGPgw3hvXWnbJM=EBKbiN7LKJFbA2hHdiV0==DO_b_CFtJ37g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=TADPOguuJ3DVcFh7yg/4mWmTDNBXz5VP3SeT2Lqmsc4=;
        b=aNRK2GZW0+2gsYm92diK/NqTFV1L4XX1hNcPWdMJIecD3u5HlZzOq3QLwfzpXPgCjR
         LDZrqcxW87YRMNRgN4lMido3BISIfisovFy1cVTe8n+4oicYmllW6NDe61W9/0NWuijP
         1+pHRX5Yw6bilu2uu1DWnSc1uvH+FSHzHctuk=
In-Reply-To: <CAHGPgw3hvXWnbJM=EBKbiN7LKJFbA2hHdiV0==DO_b_CFtJ37g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: "Nikolay S." <nowhere@hakkenden.ath.cx>
Cc: linux-newbie <linux-newbie@vger.kernel.org>, Netfilter mailing list <netfilter@vger.kernel.org>, linux-net@vger.kernel.org

Here are my findings:
---------------------------------------------------------------------

Reverse Path Filtering which is enable by default on linux.
Basically, if the reply to the packet doesn't go out using the
interface through which packet came in then linux box ,with Reverse
Path Filtering enable,
consider the packet as bogus packet and ignores it.

=46YI, http://tldp.org/HOWTO/Adv-Routing-HOWTO/lartc.kernel.rpf.html

To see if any packets are being dropped then set flag in the
log_martians file
(/proc/sys/net/ipv4/conf/<interfacename>/log_martians) to tell kernel
to
log ignored packets in syslog.

echo 1 >/proc/sys/net/ipv4/conf/<interfacename>/log_martians

After settting log_martians for inrterface eth1 192.168.12.6, I could
see that packets are being dropped by system-2:
$echo 1 > /proc/sys/net/ipv4/conf/eth1/log_martians
$dmesg
martian source 192.168.12.6 from 192.168.11.5, on dev eth1
ll header: 00:80:48:1e:47:68:00:80:48:3d:56:98:08:00
martian source 192.168.12.6 from 192.168.11.5, on dev eth1
ll header: 00:80:48:1e:47:68:00:80:48:3d:56:98:08:00
martian source 192.168.12.6 from 192.168.11.5, on dev eth1
ll header: 00:80:48:1e:47:68:00:80:48:3d:56:98:08:00
martian source 192.168.12.6 from 192.168.11.5, on dev eth1
ll header: 00:80:48:1e:47:68:00:80:48:3d:56:98:08:00
martian source 192.168.12.6 from 192.168.11.5, on dev eth1
ll header: 00:80:48:1e:47:68:00:80:48:3d:56:98:08:00
martian source 192.168.12.6 from 192.168.11.5, on dev eth1
ll header: 00:80:48:1e:47:68:00:80:48:3d:56:98:08:00

After turning off Reverse Path Filtering as shown below and then I did
ping 192.168.12.6 from 192.168.11.5 .  I could see as shown below via
tcpdump taken on System-2, ICMP echo packet coming on eth1
(192.168.12.6) and ICMP Reply packet going out using different
interface eth0 192.168.11.6 as it was expected.

To disable Reverse Path Filtering
$echo 2 > /proc/sys/net/ipv4/conf/<interfacename>/rp_filter


$tcpdump -i eth1 proto ICMP
tcpdump: verbose output suppressed, use -v or -vv for full protocol dec=
ode
listening on eth1, link-type EN10MB (Ethernet), capture size 65535 byte=
s
12:16:12.204647 IP 192.168.11.5 > 192.168.12.6: ICMP echo request, id
17169, seq 353, length 64
12:16:13.204810 IP 192.168.11.5 > 192.168.12.6: ICMP echo request, id
17169, seq 354, length 64
12:16:14.204820 IP 192.168.11.5 > 192.168.12.6: ICMP echo request, id
17169, seq 355, length 64
12:16:15.204988 IP 192.168.11.5 > 192.168.12.6: ICMP echo request, id
17169, seq 356, length 64
12:16:16.205003 IP 192.168.11.5 > 192.168.12.6: ICMP echo request, id
17169, seq 357, length 64
12:16:17.205163 IP 192.168.11.5 > 192.168.12.6: ICMP echo request, id
17169, seq 358, length 64
12:16:18.205185 IP 192.168.11.5 > 192.168.12.6: ICMP echo request, id
17169, seq 359, length 64
12:16:19.205336 IP 192.168.11.5 > 192.168.12.6: ICMP echo request, id
17169, seq 360, length 64
12:16:20.205358 IP 192.168.11.5 > 192.168.12.6: ICMP echo request, id
17169, seq 361, length 64

$tcpdump -i eth0 proto ICMP
tcpdump: verbose output suppressed, use -v or -vv for full protocol dec=
ode
listening on eth0, link-type EN10MB (Ethernet), capture size 65535 byte=
s
12:16:12.204677 IP 192.168.12.6 > 192.168.11.5: ICMP echo reply, id
17169, seq 353, length 64
12:16:13.204840 IP 192.168.12.6 > 192.168.11.5: ICMP echo reply, id
17169, seq 354, length 64
12:16:14.204851 IP 192.168.12.6 > 192.168.11.5: ICMP echo reply, id
17169, seq 355, length 64
12:16:15.205019 IP 192.168.12.6 > 192.168.11.5: ICMP echo reply, id
17169, seq 356, length 64
12:16:16.205033 IP 192.168.12.6 > 192.168.11.5: ICMP echo reply, id
17169, seq 357, length 64
12:16:17.205195 IP 192.168.12.6 > 192.168.11.5: ICMP echo reply, id
17169, seq 358, length 64
12:16:18.205215 IP 192.168.12.6 > 192.168.11.5: ICMP echo reply, id
17169, seq 359, length 64
12:16:19.205362 IP 192.168.12.6 > 192.168.11.5: ICMP echo reply, id
17169, seq 360, length 64
12:16:20.205388 IP 192.168.12.6 > 192.168.11.5: ICMP echo reply, id
17169, seq 361, length 64


Thanks,
Anil


2011/12/13 anil dahiya <anildahiya80@gmail.com>:
> Thanks, It was issue of reverse path filtering.
>
> Regards,
> Anil
>
> On Fri, Dec 9, 2011 at 1:29 AM, Nikolay S. <nowhere@hakkenden.ath.cx>=
 wrote:
>> =F7 =F0=D4., 09/12/2011 =D7 00:00 +0530, anil dahiya =D0=C9=DB=C5=D4=
:
>>> Hi ,
>>>
>>> I have following setup with routing table as shown below:
>>>
>>> +-----------------------+
>>> | =9A =9ASystem-1 =9A =9A =9A|
>>> | =9A =9A "client" =9A =9A =9A =9A |
>>> |------------------------|
>>> | =9A192.168.11.5 =9A |
>>> +----------------------+
>>> =9A =9A =9A =9A|
>>> =9A =9A =9A =9A|
>>> +------+-----+
>>> | =9A Switch =9A +----------------------+
>>> +------+-----+ =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A|
>>> =9A =9A =9A =9A| =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A=
 =9A =9A =9A |
>>> =9A =9A =9A =9A| =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A +-----=
--------------------+
>>> =9A =9A =9A =9A| =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A| =9A=
192.168.11.1 =9A =9A =9A|
>>> =9A =9A =9A =9A| =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A|--=
-------------------------|
>>> =9A =9A =9A =9A| =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A| =9A=
 =9A Router =9A =9A =9A =9A =9A =9A|
>>> =9A =9A =9A =9A| =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A|--=
------------------------ |
>>> =9A =9A =9A =9A| =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A| =9A=
 192.168.12.1 =9A =9A |
>>> =9A =9A =9A =9A| =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A +-----=
---------------------+
>>> =9A =9A =9A =9A| =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A=
 =9A =9A =9A =9A =9A|
>>> =9A =9A =9A =9A| =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A=
 =9A =9A =9A =9A =9A|
>>> +------------------------+ =9A =9A =9A =9A =9A =9A =9A =9A|
>>> | =9A192.168.11.6 =9A =9A =9A| =9A =9A =9A =9A =9A =9A =9A =9A|
>>> |--------------------------| =9A =9A =9A =9A =9A =9A =9A =9A|
>>> | =9A System-2 =9A =9A =9A =9A| =9A =9A =9A =9A =9A =9A =9A =9A|
>>> |--------------------------| =9A =9A =9A =9A =9A =9A =9A =9A|
>>> | =9A 192.168.12.6 =9A =9A| =9A =9A =9A =9A =9A =9A =9A =9A|
>>> | =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A|-------------=
---+
>>> +------------------------+
>>>
>>> Routing table details of setup
>>> ------------------------------------------
>>> System-1
>>> -----
>>> $route -n
>>> Kernel IP routing table
>>> Destination =9A =9A Gateway =9A =9A =9A =9A Genmask =9A =9A =9A =9A=
 Flags Metric Ref =9A =9AUse Iface
>>> 192.168.11.0 =9A =9A0.0.0.0 =9A =9A =9A =9A 255.255.255.0 =9A U =9A=
 =9A 1 =9A =9A =9A0 =9A =9A =9A =9A0 eth1
>>> 0.0.0.0 =9A =9A =9A =9A 192.168.11.1 =9A =9A0.0.0.0 =9A =9A =9A =9A=
 UG =9A =9A0 =9A =9A =9A0 =9A =9A =9A =9A0 eth1
>>>
>>>
>>> Router
>>> -----------
>>> $route -n
>>> Kernel IP routing table
>>> Destination =9A =9A Gateway =9A =9A =9A =9A Genmask =9A =9A =9A =9A=
 Flags Metric Ref =9A =9AUse Iface
>>> 192.168.12.0 =9A =9A0.0.0.0 =9A =9A =9A =9A 255.255.255.0 =9A U =9A=
 =9A 0 =9A =9A =9A0 =9A =9A =9A =9A0 eth1
>>> 192.168.11.0 =9A =9A0.0.0.0 =9A =9A =9A =9A 255.255.255.0 =9A U =9A=
 =9A 0 =9A =9A =9A0 =9A =9A =9A =9A0 eth0
>>>
>>>
>>> System-2
>>> ------
>>> $route -n
>>> Kernel IP routing table
>>> Destination =9A =9A Gateway =9A =9A =9A =9A Genmask =9A =9A =9A =9A=
 Flags Metric Ref =9A =9AUse Iface
>>> 192.168.12.0 =9A =9A0.0.0.0 =9A =9A =9A =9A 255.255.255.0 =9A U =9A=
 =9A 0 =9A =9A =9A0 =9A =9A =9A =9A0 eth1
>>> 192.168.11.0 =9A =9A0.0.0.0 =9A =9A =9A =9A 255.255.255.0 =9A U =9A=
 =9A 0 =9A =9A =9A0 =9A =9A =9A =9A0 eth0
>>> 0.0.0.0 =9A =9A =9A =9A 192.168.12.1 =9A =9A0.0.0.0 =9A =9A =9A =9A=
 UG =9A =9A0 =9A =9A =9A0 =9A =9A =9A =9A0 eth1
>>>
>>>
>>> When I do ping from system-1 192.168.11.5 to system-2 192.168.12.6 =
,
>>> ping echo packet is reaching on system-2 through NIC 192.168.12.6 b=
ut
>>> system is not sending any response to 192.168.11.5 using either of =
NIC
>>> i.e 192.168.11.6 or 192.168.12.6 ? Why this is happening ? Can you
>>> help me ?
>>>
>>> I have observed same type of symtoms when I do SSH from 192.168.11.=
5
>>> to 192.168.12.6
>>>
>>> FYI,
>>> ip_forwarding is enable on router and iptables are no configured on
>>> any of system .
>>
>> I think, reverse path filtering is the problem here.
>>
>>>
>>> Thanks,
>>> Anil
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe netfilter=
" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at =9Ahttp://vger.kernel.org/majordomo-info.htm=
l
>>
>>
