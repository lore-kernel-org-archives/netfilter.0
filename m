From: Steven Kath <steven.kath@vyatta.com>
Subject: Re: Filter IP to use two ISP and make it failsafe
Date: Mon, 7 Feb 2011 12:20:17 -0800 (PST)
Message-ID: <2044634873.42761.1297110017641.JavaMail.root@tahiti.vyatta.com>
References: <1824409827.42740.1297109522307.JavaMail.root@tahiti.vyatta.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1824409827.42740.1297109522307.JavaMail.root@tahiti.vyatta.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Juan Araya Bravo <juan.araya@gmail.com>
Cc: netfilter@vger.kernel.org

----- "Juan Araya Bravo" <juan.araya@gmail.com> wrote:
> Hi, this is my first message to the list and first of all i apologise
> for my very bad English.
> 
> The thing is i have one machine with three NIC cards acting as a
> gateway. One of the NIC (eth0) is connected to LAN and the others are
> connected to two different ISP (eth1 = ISP A and eth2= ISP B).
> 
> I was looking for a rule that let me determine specifically which IP
> can use the ISP A and let all the others to use the ISP B connection.
> 
> Also i need that when one of the connections fails all the traffic
> will be directed by the one which works.
> 
> Please help me with a link or something i can read to learn how to do
> it.

What you're essentially describing is called Source Policy-Based 
Routing (PBR).

Here is a good place to start reading, 

http://lartc.org/howto/lartc.rpdb.html
http://lartc.org/howto/lartc.rpdb.multiple-links.html

Those pages will help you get the big picture, and the "ip rule" section 
of "man ip" can help fill in a lot of the details. 

The 'gwping' script mentioned elsewhere in this thread is a good example 
of how to continuously monitor the responsiveness of the two uplinks and 
stop routing traffic out a failed link.  That's where the fail-safe part 
comes in. However, that script seems to use stateless, per-packet 
load-balancing which is going to come with its own set of problems.  

When you understand both PBR and the gwping script, you can probably put
together a script using ping tests and failover like gwping with a true 
source PBR implementation. 
