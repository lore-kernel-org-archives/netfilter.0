From: Fabio Marcone <fabio.marcone@duet.it>
Subject: Re: tc and virtual interfaces
Date: Fri, 10 Jul 2009 15:54:04 +0200
Message-ID: <4A5747FC.1040509@duet.it>
References: <4A572D8C.7010703@duet.it> <4A573D34.7080100@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A573D34.7080100@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

thanks for your reply,
>
> eth0:0 is not an interface, it is an IPv4 alias on eth0. The real and 
> only interface here is eth0.
ok, so I can't set up a queue on it, isn't it?

>
> tun0 is an interface on its own. However, if encapsulating traffic 
> happens to go through eth0, it will be affected by traffic shaping 
> just as any other traffic going through eth0.
ok, and I can limit datarate on tun0 and on eth0 ? the first is applied 
only on vpn packets and the last on all eth0 outgoinig traffic I think...


thanks,
Fabio
