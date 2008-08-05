From: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Subject: Re: Setting up a proxy with iptables
Date: Tue, 05 Aug 2008 08:31:39 +0200
Message-ID: <4897F3CB.8090103@unipex.it>
References: <K4YPNL$F8087895A3C60C84D241022EEA93B6DB@libero.it>	 <48941506.6080409@unipex.it> <50805eb10808041406x545a5ed1q6da8302370a0accb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50805eb10808041406x545a5ed1q6da8302370a0accb@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Shawn Fitzgerald <sargon97@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

Shawn Fitzgerald wrote:
> I did an iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j 
> REDIRECT --to-ports 8080 and nothing. Just to make sure the firewall 
> was up I entered iptables -A OUTPUT -j DROP and it did block all 
> outbound traffic.
> 
> What am I missing here?
> 

Nothing it's not an answer.
How it's your lan? How are connected your eth0? Have you log the
incoming packets *before* redirect? Have you tried to tcpdump?
Too little infos...

Michele
