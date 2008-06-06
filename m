From: Thomas Jacob <jacob@internet24.de>
Subject: Re: [libnetfilter_queue] Load Balancing using multiple queues
Date: Fri, 06 Jun 2008 16:46:12 +0200
Message-ID: <1212763572.32573.32.camel@enterprise.ims-firmen.de>
References: <363599.48150.qm@web58313.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <363599.48150.qm@web58313.mail.re3.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vincent Arniego <vincent_arniego@yahoo.com>
Cc: netfilter@vger.kernel.org

On Fri, 2008-06-06 at 04:08 -0700, Vincent Arniego wrote:
> Hi Thomas,
> 
> That's actually a good suggestion, Unfortunately we can't force teach our subscribers to use a proxy in their setup. >
> They use a certain equipment that uses 3G and configuring it would be like rocket science to them.

So you're not load balancing requests to one website then... obviously I
didn't read your post thoroughly enough ;-)

A transparent proxy solution could still work (but not with pound).

> iptables -A FORWARD -p tcp --dport 80 -j NFQUEUE --queue-num 0:5
> 
> something like that. This doesn't work btw.

You could you statistic+connmark to do that, so that all packets
belonging to one connection are copied to the same queue:

iptables -N PORT80
iptables -N PORT80_NEW

iptables -A FORWARD -p tcp --dport 80 -j PORT80

iptables -A PORT80 -m connmark --mark 0 -j PORT80_NEW

iptables -A PORT80_NEW -m statistic --mode nth --every 5 --packet 0 -m
connmark --mark 0 -j CONNMARK --set-mark 1
iptables -A PORT80_NEW -m statistic --mode nth --every 5 --packet 1 -m
connmark --mark 0 -j CONNMARK --set-mark 2
iptables -A PORT80_NEW -m statistic --mode nth --every 5 --packet 2 -m
connmark --mark 0 -j CONNMARK --set-mark 3
iptables -A PORT80_NEW -m statistic --mode nth --every 5 --packet 3 -m
connmark --mark 0 -j CONNMARK --set-mark 4
iptables -A PORT80_NEW -m statistic --mode nth --every 5 --packet 4 -m
connmark --mark 0 -j CONNMARK --set-mark 5


iptables -A PORT80 -m connmark --mark 1 -j NFQUEUE --queue-num 1
iptables -A PORT80 -m connmark --mark 2 -j NFQUEUE --queue-num 2
iptables -A PORT80 -m connmark --mark 3 -j NFQUEUE --queue-num 3
iptables -A PORT80 -m connmark --mark 4 -j NFQUEUE --queue-num 4
iptables -A PORT80 -m connmark --mark 5 -j NFQUEUE --queue-num 5





