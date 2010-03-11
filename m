From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: iptables NATed or not NATed
Date: Thu, 11 Mar 2010 09:21:01 +0100
Message-ID: <20100311092101.63e64dbc@catlap>
References: <4B989616.7000904@perfaction.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B989616.7000904@perfaction.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Patrick Chemla <patrick.chemla@perfaction.net>
Cc: netfilter@vger.kernel.org

>Hi,

Hi,

>It is very strange because it is a small percentage of packets, not
>all the packets from a specific server, directed to the same port
>than others who are routed and NATed the right way, at the same time.
>Again: a small percentage of packets issued by the same server, to the 
>same destination port, maybe not the same public server are routed 
>without NATing, while most of the packets from the same computer are 
>well routed and NATed.

Try using "ip ro sh cache" to see what's in there. If you see "stale"
cache entries "ip ro flush cache" should fix the problem.

Best regards,
Marek
