From: <jwexler@mail.usa.com>
Subject: RE: Bidirectionally Route all traffic to an ip to another ip
Date: Mon, 26 Jul 2010 20:07:33 +0900
Message-ID: <00d501cb2cb2$c97f6000$5c7e2000$@usa.com>
References: <00bf01cb2ca4$3d6af6f0$b840e4d0$@usa.com> <alpine.LSU.2.01.1007261133020.22382@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1007261133020.22382@obet.zrqbmnf.qr>
Content-Language: ja
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Thanks. It still did not work.

Should I only be doing a ip route add 192.168.50.1/32 via 192.168.40.1
statement or should I also be adding iptables commands?
I am having trouble getting the ip route add 192.168.50.1/32 to use dev eth1
instead of eth0.

When I do:
ip route add dev eth5 192.168.50.1/32 via 192.168.40.1
I get an error: RTNETLINK answers: No such process

Should I also be doing some kind of ip addr add dev eth5? And/or add src
192.168.50.1/32 to the ip route add command somehow?

I have tried many combinations but still have not gotten it to work yet.

Thanks!!
JW

-----Original Message-----
From: netfilter-owner@vger.kernel.org
[mailto:netfilter-owner@vger.kernel.org] On Behalf Of Jan Engelhardt
Sent: Monday, July 26, 2010 6:35 PM
To: jwexler@mail.usa.com
Cc: netfilter@vger.kernel.org
Subject: Re: Bidirectionally Route all traffic to an ip to another ip

On Monday 2010-07-26 11:23, jwexler@mail.usa.com wrote:

>Greetings,
>
>I need to be able to do the following:
>
>Physical Router located at 192.168.40.1
>
>On Ubuntu 10.04 Lucid machine:
>eth0 with static ip 192.168.40.2
>eth1 with static ip 192.168.40.3
>eth2 with static ip 192.168.40.4
>
>Associate a virtual address to eth1 with an entirely different network
>address such as 192.168.50.1
>Do the same (virtual address) for eth2 -- e.g. 192.168.60.1
>
>In the application:
>register phone number A at 192.168.40.1 (The application will automatically
>use eth0 for this)
>register phone number B at 192.168.50.1
>register phone number C at 192.168.60.1
>
>Somehow forward all traffic (including the register request) sent to
>192.168.50.1 to 192.168.40.1 as if the register had been made directly to
>192.168.40.1. In other words, the app "sends" registration and traffic to
>192.168.50.1 but then Ubuntu forwards it to 192.168.40.1 (but the app does
>not know that).


ip route add 192.168.50.1/32 via 192.168.40.1

etc.

--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

