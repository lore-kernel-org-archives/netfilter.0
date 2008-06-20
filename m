From: Doug Kehn <rdkehn@yahoo.com>
Subject: Re: conntrack and PREROUTING
Date: Fri, 20 Jun 2008 05:49:46 -0700 (PDT)
Message-ID: <624017.96549.qm@web52002.mail.re2.yahoo.com>
References: <alpine.LNX.1.10.0806200942340.11250@fbirervta.pbzchgretzou.qr>
Reply-To: rdkehn@yahoo.com
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0806200942340.11250@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Hi Jan,


--- On Fri, 6/20/08, Jan Engelhardt wrote:

> 
> >Hi All,
> >
> >Is the PREROUTING chain bypassed if a connection is
> ESTABLISHED?
> 
> Generally, no. For the nat table yes, which is only
> consulted on
> new connections.
> 
> >There are hints to this in the documents I've read
> but I haven't
> >found anything definitive.
> >
> >I'm using Dansguardian with TinyProxy with the
> following rule:
> >
> >iptables -t nat -A PREROUTING -d !
> 192.168.2.0/255.255.255.0 -i eth0
> >-p tcp -m tcp --dport 80 -j REDIRECT --to-ports 3129
> >
> >Everything is working, from a proxy perspective, as
> expected. 
> >However, if I play a high bit-rate (>4 Mbps) video
> stream over HTTP,
> >the playback is very choppy.  The choppiness is due to
> ACK latency
> >through the proxy.  (Video playback is fine if I remove
> the proxy.)
> >
> >I know I could just create a nat PREROUTING rule to
> bypass the proxy
> >for the site I'm attempting to stream video from
> but I'm looking for
> >a more general solution.  Thus, what I'm attempting
> to do is have
> >ACKs bypass the proxy after the connection is
> ESTABLISHED.  I tried
> >using the raw table in PREROUTING but the my rule was
> never hit. 
> >(Thus, the reason for my first question.) The raw table
> rules I
> >attempted were:
> >
> >iptables -t raw -A PREROUTING -d !
> 192.168.2.0/255.255.255.0 -i eth0
> >-p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK ACK -m tcp
> --dport 80 -m
> >state --state ESTABLISHED -j NOTRACK
> >
> >   -and-
> >
> >iptables -t raw -A PREROUTING -d !
> 192.168.2.0/255.255.255.0 -i eth0
> >-p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK ACK -m tcp
> --dport 80 -m
> >conntrack --ctstate ESTABLISHED -j NOTRACK
> >
> >Does this even make sense?
> 
> Yes, but:
> 
> >Is what I'm attempting to do possible with the
> existing
> >implementation?
> 
> The connection tracking and NAT subsystems might get
> confused if
> they do not see all ACKs despite the TCP window moving on.
> You
> will know when the connection hangs.

The connections do hang if I change the rule to:

iptables -t raw -A PREROUTING -d ! 192.168.2.0/255.255.255.0 -i eth0 -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK ACK -m tcp --dport 80 -j NOTRACK

This makes sense, I believe, because the ACK to the SYN-ACK wouldn't be tracked and the connection state would never reach ESTABLISHED.

Regards,
...doug
 


      
