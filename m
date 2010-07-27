From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: making QoS for FTP traffic using tc HTB
Date: Tue, 27 Jul 2010 09:09:49 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1007270908090.31566@obet.zrqbmnf.qr>
References: <AANLkTiltEFL_FDC2Ah1RedeQTDHji94UbAGUyn39lT1e@mail.gmail.com> <1280212265.1462.65.camel@andybev>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1280212265.1462.65.camel@andybev>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Beverley <andy@andybev.com>
Cc: =?UTF-8?Q?Mamadou_Tour=C3=A9?= <e2ia.ci@gmail.com>, netfilter@vger.kernel.org


On Tuesday 2010-07-27 08:31, Andrew Beverley wrote:

>> I've some problem with making Qos.
>> All my pass through a linux box which is in Bridge mode.
>> I'd to implement a QoS to allocate 25Kbit of bandwith to the FTP
>> traffic. So I've made these commands:
>
><snip>
>
>> tc filter add dev  eth1  protocol ip parent 1:  prio 1 u32   match ip  src
>> 192.168.2.88/32  match ip dport  20  0xffff flowid  1:8170
>> tc filter add dev  eth1  protocol ip parent 1:  prio 1 u32   match ip  dst
>> 192.168.2.88/32    0xff match ip dport  21  0xffff flowid  1:8170
>> --------------------------------------------------------------------
>> The filter tc filter add dev  eth1.....
>> Is never match for the FTP downstream.
>
>FTP is quite a complex protocol that jumps around port numbers
>(especially passive FTP - see http://slacksite.com/other/ftp.html). I've
>not looked at your rules close enough to see whether that is the
>problem, but I would recommend using the iptables FTP connection
>tracking module with iptables to track the connection, then MARK it, and
>then use the mark in the filter.

Port 20 is generally no longer used - because it's a privileged lowport.
You can use -m conntrack --ctstate RELATED -m helper --helper ftp
-j CONNMARK to tag the data stream with a ctmark, plus
another rule with -j CONNMARK --restore-mark
to put it back onto the nfmark for use with tc.
