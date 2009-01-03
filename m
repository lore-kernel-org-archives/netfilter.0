From: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Subject: Re: help on tc with kernels >= 2.6.27
Date: Sat, 03 Jan 2009 12:47:02 +0100
Message-ID: <495F5036.2090104@unipex.it>
References: <37b3b63f0901021046n40962c84mef64cab10153261e@mail.gmail.com>	<20090102204908.7ec18094@catlap> <495F39BE.1070901@unipex.it> <001701c96d92$43c4e600$cb4eb200$@jorge@decimal.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <001701c96d92$43c4e600$cb4eb200$@jorge@decimal.pt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jorge Bastos <mysql.jorge@decimal.pt>
Cc: 'Marek Kierdelewicz' <marek@piasta.pl>, 'Jorge Bastos' <jorge.decimal@gmail.com>, netfilter@vger.kernel.org

Jorge Bastos wrote:
> Hi Michele,
> 

Ciao,

> For htb, the script Marek wrote here, shape's the traffic, but it 
> gets a bit unstable, sometimes if goes down, other goes up, for a 
> considered number of seconds, so I believe it's a pike.
> 

I have a "big" environ with htb (kernel .26) and it works well, without
problems. Never seen up and down course.


> Here's what Marek wrote here:
<-cut->

> 
> With cbq, the traffic was always stable at a constant speed, the 
> oscillation wasn't more than about 1kb.
> 

Also here the same.

> What I use for cbq, is the cbq.init script that generates this rules:
> 
> 
> 
> 

<-cut->

> For cbq, instead of the 20kb/sec, it goes to 1/2, sometimes 4 or 5, 
> but never more than that.
> 


With that rules, also here :( . Starting to say that I'm not a big tc
expert but after some test, it's seem that tbf create the problems:
if you try to remove that rule, it'll work. Also tried sfq or cbq like last
queuing and seem to shape correctly. (my test was done with scp and iptraf)
Have you tried it?

Michele
