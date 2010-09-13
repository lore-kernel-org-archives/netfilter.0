From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: ULOGD and other logs
Date: Mon, 13 Sep 2010 15:33:45 +0200
Message-ID: <4C8E2839.3060604@netfilter.org>
References: <AANLkTi=tPs=39vmRzc=41z=Vt8kHmK7vygKrfn5=0rh=@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=tPs=39vmRzc=41z=Vt8kHmK7vygKrfn5=0rh=@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: Netfilter mailing list <netfilter@vger.kernel.org>, laforge@gnumonks.org, Eric Leblond <eleblond@edenwall.com>, chifflier@edenwall.com

On 13/09/10 15:12, ratheesh k wrote:
> Hi ,
>
>   I am using ulogd to   store iptables logs to /tmp/logfile.txt.  There
> is an application ( say X ) running on userspace ( using nfqueue  in
> FORWARD chain in filter table ) to do some kind of blocking  packets
> based on time ( some  thing like a minimal parental control feature ).
> I would also want to generate some logs and put into the same
> /tmp/logfile.txt file.  Since  ulogd and  X are using same file , we
> need some file locking mechanism. Is there any other way to forward
> these message to netlink socket and ulogd can itself handle, so that i
> dont have to do any kind of synchronization.
>
> May be i can put the question in this way: Kernel is sending some
> message and ulogd listens and receives the message on netlink socket.
> Could any other application in userspace  , send some  message  to
> this socket and ulogd can read and write to the log file f ?

There's the UNIX plugin for ulogd2 (not yet in mainline) that Eric 
Leblond and Pierre Chifflier contributed time ago. However, some minor 
issues prevented to push into mainline, any word on it, Eric, Pierre?
