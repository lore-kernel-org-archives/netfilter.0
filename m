From: Vincent Arniego <vincent_arniego@yahoo.com>
Subject: Re: [libnetfilter_queue] Load Balancing using multiple queues
Date: Mon, 9 Jun 2008 04:03:58 -0700 (PDT)
Message-ID: <849231.49892.qm@web58312.mail.re3.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@vger.kernel.org



----- Original Message ----
> From: Thomas Jacob <jacob@internet24.de>
> To: Vincent Arniego <vincent_arniego@yahoo.com>
> Cc: netfilter@vger.kernel.org
> Sent: Friday, June 6, 2008 10:46:12 PM
> Subject: Re: [libnetfilter_queue] Load Balancing using multiple queues
> 
> On Fri, 2008-06-06 at 04:08 -0700, Vincent Arniego wrote:
> > Hi Thomas,
> > 
> > That's actually a good suggestion, Unfortunately we can't force teach our 
> subscribers to use a proxy in their setup. >
> > They use a certain equipment that uses 3G and configuring it would be like 
> rocket science to them.
> 
> So you're not load balancing requests to one website then... obviously I
> didn't read your post thoroughly enough ;-)
> 
> A transparent proxy solution could still work (but not with pound).
> 
> > iptables -A FORWARD -p tcp --dport 80 -j NFQUEUE --queue-num 0:5
> > 
> > something like that. This doesn't work btw.
> 
> You could you statistic+connmark to do that, so that all packets
> belonging to one connection are copied to the same queue:
> 
> iptables -N PORT80
> iptables -N PORT80_NEW
> 
> iptables -A FORWARD -p tcp --dport 80 -j PORT80
> 
> iptables -A PORT80 -m connmark --mark 0 -j PORT80_NEW
> 
> iptables -A PORT80_NEW -m statistic --mode nth --every 5 --packet 0 -m
> connmark --mark 0 -j CONNMARK --set-mark 1
> iptables -A PORT80_NEW -m statistic --mode nth --every 5 --packet 1 -m
> connmark --mark 0 -j CONNMARK --set-mark 2
> iptables -A PORT80_NEW -m statistic --mode nth --every 5 --packet 2 -m
> connmark --mark 0 -j CONNMARK --set-mark 3
> iptables -A PORT80_NEW -m statistic --mode nth --every 5 --packet 3 -m
> connmark --mark 0 -j CONNMARK --set-mark 4
> iptables -A PORT80_NEW -m statistic --mode nth --every 5 --packet 4 -m
> connmark --mark 0 -j CONNMARK --set-mark 5
> 
> 
> iptables -A PORT80 -m connmark --mark 1 -j NFQUEUE --queue-num 1
> iptables -A PORT80 -m connmark --mark 2 -j NFQUEUE --queue-num 2
> iptables -A PORT80 -m connmark --mark 3 -j NFQUEUE --queue-num 3
> iptables -A PORT80 -m connmark --mark 4 -j NFQUEUE --queue-num 4
> iptables -A PORT80 -m connmark --mark 5 -j NFQUEUE --queue-num 5


Wow, this is the solution I'm looking for. Its not exactly like automatic load balancing, but spreading across multiple queues can do the trick.

Our application that is using libnetfilter_queue has some delays in processing the packets, around 200 ms max every so and so packets. by doing this, we could share the queue around. So that when a packet gets delayed somehow, the other packets can still move to the other queues.

Thanks a lot! Guys!


      
