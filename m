From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Possibilities and performance of conntrackd, NATing cluster
Date: Wed, 17 Sep 2008 16:07:14 -0500
Message-ID: <48D17182.1090000@riverviewtech.net>
References: <fc69e1200809160716u3ce5a9e2wce6b0035b4f58cc3@mail.gmail.com> <48CFFE1A.2070205@riverviewtech.net> <48D0DD27.70109@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48D0DD27.70109@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 09/17/08 05:34, Pablo Neira Ayuso wrote:
> If you are refering to an asymmetric setup where the packets can be 
> filtered by whatever node, it's likely that you'll experience 
> problems. The daemon `conntrackd' is asynchronous, so there are race 
> conditions between the packets and the state updates, ie. one of the 
> firewall nodes may receive a packet but its state may not be 
> up-to-date yet.

Ah.  Ok.

> The way to go is a symmetric setup where all nodes receives the 
> packets and only one firewall node handles them. This can be achieved 
> by means of hash-based load-sharing. There's some works on that 
> direction.

Interesting.  I can see how this would easily scale beyond two nodes (or 
  two primary and two backup) much easier.

> It's soft real-time. conntrackd does its best here. A hard real-time 
> approach would harm performance in terms of latency and bandwidth.

Ok...  Can you comment on whether or not CheckPoint's is soft or hard 
real-time (or something in between)?  What about any thing else?  In 
other words, is this a Linux / conntrackd shortcoming or just a 
shortcoming of load balancing across firewalls?

> Limit? I don't know yet, I'm still testing with only two nodes, but I 
> expect to do it with up to four. Moreover, the replication approaches 
> still require a small change in the code to cleanly support more than 
> two nodes.

*nod*

> This is right.

:)

> This is asymmetric multipath, it is not really a good idea and also 
> you'll waste lots of resources in the replication. Therefore, if your 
> intention is to improve scalability, this won't help. The way to go 
> is the symmetric setup.

Ok.

> This is a description for the asymmetric setup, isn't it?

Well, it was initially written as asymmetric, but it could easily be 
changed to symmetric by having one node be the primary for both inbound 
and outbound traffic and have the other node be backup.

Considering the hashed based load balancing I'm not quite sure how I 
would apply VRRP.  I think I'd end up using hashing across multiple sets 
of VRRP active / standby nodes.  But that is quite a ways beyond the OPs 
question.



Grant. . . .
