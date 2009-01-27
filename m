From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: martian destination and RAW iptable
Date: Tue, 27 Jan 2009 19:19:58 +0100
Message-ID: <497F504E.9040807@chello.at>
References: <ea182b20901270724r3c7909dbo7ddec6bc92c8afa6@mail.gmail.com> <ea182b20901270725n3fde42e4i166b346a919a3050@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ea182b20901270725n3fde42e4i166b346a919a3050@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Yury Polyanskiy wrote:
> Hello everyone!
>
> I wanted to filter out the annoying logs:
>
> Jan 24 00:19:54 tetra kernel: martian destination 0.0.0.0 from 1.2.3.4, dev eth0
>
> and issued the following:
>
> #iptables -t raw -I PREROUTING -s 1.2.3.4 -d 0.0.0.0 -j DROP
> #iptables -t raw -I PREROUTING -s 1.2.3.4 -j DROP
>
> Amazingly, I'm still getting those pesky log messages. How is this possible?
>
> # uname -a
> Linux xxx.xxx.xxx.EDU 2.6.28 #1 SMP PREEMPT Fri Jan 16 00:41:03 EST
> 2009 i686 GNU/Linux
>
>   
find /proc -name log_martians

set the one for your interface to `0'.

greets

mart
