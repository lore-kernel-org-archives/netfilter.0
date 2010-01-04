From: Kenneth Sande <sandekt@wow-ia.net>
Subject: Re: Squid Redirection
Date: Mon, 04 Jan 2010 13:38:27 -0500
Message-ID: <4B4235A3.2010409@wow-ia.net>
References: <8ec0428d1001041031t5362a011ie9c19ff589cb38c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <8ec0428d1001041031t5362a011ie9c19ff589cb38c@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Aaron Clausen <mightymartianca@gmail.com>
Cc: netfilter@vger.kernel.org

I do it this way for my one internal subnet. There may be more and 
better options, but this works for me.

"iptables -t nat -A PREROUTING -i ${INT_INTERFACE} -s ${INT_NETWORK} -p 
tcp --dport 80 --sport 1024:65535 -m state --state 
NEW,ESTABLISHED,RELATED -j REDIRECT --to-port 3128"

Squid must also be set up to accept transparent connections.


-Ken Sande/KC8QNI




Aaron Clausen wrote:
> I'm running Squid on my gateway router (on the internal ethernet only
> of course) and have been struggling to figure out how to redirect port
> 80 traffic to it (transparent proxy).  All the instructions I've seen
> are for Squid hosted on another server.  Anyone have any tips?
>
>   
