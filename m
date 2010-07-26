From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Bidirectionally Route all traffic to an ip to another ip
Date: Mon, 26 Jul 2010 11:34:34 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1007261133020.22382@obet.zrqbmnf.qr>
References: <00bf01cb2ca4$3d6af6f0$b840e4d0$@usa.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <00bf01cb2ca4$3d6af6f0$b840e4d0$@usa.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jwexler@mail.usa.com
Cc: netfilter@vger.kernel.org

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

