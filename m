From: Justin Friel <capn_shoe@yahoo.com>
Subject: Re: mangle, filter & FORWARD
Date: Mon, 31 May 2004 14:39:04 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040531213904.58654.qmail@web60002.mail.yahoo.com>
References: <20040531201412.91688.qmail@web41708.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040531201412.91688.qmail@web41708.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter lists <netfilter@lists.netfilter.org>

Hi Kevin,

Though, as you know, I'm no expert on iptables, I
think I can answer some of your questions. If I am
incorrect, someone please set me right.

--- "Kevin D. White" <web_crawlz@yahoo.com> wrote:
> Does a packet that needs to be forwarded ever hit
> the
> INPUT chain? 

No, it goes directly to the FORWARD chain.  

Taken directly from the Packet Filtering HOWTO
(http://www.netfilter.org/documentation/HOWTO//packet-filtering-HOWTO-6.html):
                         _____
Incoming                 /     \         Outgoing
       -->[Routing ]--->|FORWARD|------->
          [Decision]     \_____/        ^
               |                        |
               v                       ____
              ___                     /    \
             /   \                  |OUTPUT|
            |INPUT|                  \____/
             \___/                      ^
               |                        |
                ----> Local Process ----
   1. When a packet comes in (say, through the
Ethernet card) the kernel first looks at the
destination of the packet: this is called `routing'.
   2. If it's destined for this box, the packet passes
downwards in the diagram, to the INPUT chain. If it
passes this, any processes waiting for that packet
will receive it.
   3. Otherwise, if the kernel does not have
forwarding enabled, or it doesn't know how to forward
the packet, the packet is dropped. If forwarding is
enabled, and the packet is destined for another
network interface (if you have another one), then the
packet goes rightwards on our diagram to the FORWARD
chain. If it is ACCEPTed, it will be sent out.
   4. Finally, a program running on the box can send
network packets. These packets pass through the OUTPUT
chain immediately: if it says ACCEPT, then the packet
continues out to whatever interface it is destined
for.



> What is the relationship between mangle & filter
> tables and the chain FORWARD, are there two FORWARD
> chains; one for mangle and one for filter or do they
> share the same chain?.

Yes, I believe there are two FORWARD chains, this is
from the iptables man page:

filter:
    This is the default table (if no -t option is 
passed).   It contains  the built-in chains INPUT (for
packets coming into the box itself), FORWARD (for
packets being  routed  through the box), and OUTPUT
(for locally-generated packets).
                                                      
                         
nat:
    This  table  is  consulted  when a packet that
creates a new connection is encountered.  It consists
of three  built-ins: PREROUTING  (for  altering
packets as soon as they come in), OUTPUT (for altering
locally-generated packets before  rout-               
ing),  and  POSTROUTING  (for  altering  packets as
they are about to go out).
                                                      
                         
mangle:
    This table is used for specialized packet
alteration.  Until kernel  2.4.17  it  had two
built-in chains: PREROUTING (for altering incoming
packets before routing)  and  OUTPUT  (for altering 
locally-generated  packets before routing).  Since
kernel 2.4.18, three other built-in  chains  are  also
 supported: INPUT (for packets coming into the box
itself), FORWARD (for altering packets being routed 
through  the  box), and  POSTROUTING  (for altering
packets as they are about to go out).


> When is the decision to move the packet out the
> internal interface made, or is this something I must
> specify?
> 

If I am correct the decision is made by the OUTPUT
chain.


Hope this helps,
Justin.


	
		
__________________________________
Do you Yahoo!?
Friends.  Fun.  Try the all-new Yahoo! Messenger.
http://messenger.yahoo.com/ 

