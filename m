From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Bridges
Date: Thu, 19 Aug 2010 10:49:05 -0500
Message-ID: <4C6D5271.901@riverviewtech.net>
References: <4C6B10CA.4090604@abpni.co.uk> <4C6C55C8.5000905@riverviewtech.net> <4C6C65CD.6090707@plouf.fr.eu.org> <4C6CAA60.60808@riverviewtech.net> <4C6CDE4E.7000609@plouf.fr.eu.org> <4C6D44E3.7050608@riverviewtech.net> <alpine.LSU.2.01.1008191654550.24236@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1008191654550.24236@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 08/19/10 09:56, Jan Engelhardt wrote:
> "Layer 3 switching" is usually a bullshit bingo word for routing.

*chuckle*

I like how you flop your opinion on the table Jan'.  :-)

I'm actually having a discussion about routing vs l3 switching with a 
friend and colleague, prompted by this thread.

It is my belief (and my colleague / friend can't say that I'm wrong) 
that both routing and layer 3 switching will take an ethernet frame that 
is coming in one interface with one set of source / dest MAC addresses 
and forward it out another interface with a different set of source / 
dest MAC addresses in the process of forwarding the IP packet on to its 
ultimate destination.  (They both will also do some other things like 
validating checksum, decrement the TTL, etc.)

IMHO the real (and only) difference (as I (mis)understand it) between 
routing and layer 3 switching is /how/ each accomplishes its task. 
Routing is traditionally a software in CPU operation where as layer 3 
switching is hardware ASICs.  Software in CPU is quit a bit slower than 
optimized hardware ASICs.  Thus l3 switches can usually much more 
closely approach wire speed than routers can.

Skim the following article on Cisco's web site.

Link - Layer 2 and Layer 3 Switch Evolution - The Internet Protocol 
Journal - Volume 1, No. 2 - Cisco Systems
  - 
http://www.cisco.com/web/about/ac123/ac147/archived_issues/ipj_1-2/switch_evolution.html

As the article points out, layer 3 switching is done for the simple 
routing tasks.  Any time there is complexity involved, the packets are 
passed up to the CPU / software to be routed traditionally.

Along the same lines, it is my belief that (currently) layer 3 switches 
can't switch between desperate network technologies.  I.e. Ethernet / 
FDDI or Ethernet / Token Ring or Ethernet / ATM can not be layer 3 
switches, they require traditional routing because of the differences in 
the physical topologies.



Grant. . . .
