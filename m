From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: iptables on multiple CPUs (SMP & Hyperthreading question)
Date: Thu, 02 Jun 2005 21:15:23 -0500
Message-ID: <429FBD3B.4040007@gmx.co.uk>
References: <d6dfb92c05060215211afa98c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <d6dfb92c05060215211afa98c@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Michael Buffer wrote:
> I'm considering purchasing some firewall machines for my organization, and
> I am trying to decide whether a machine with multiple CPUs is worth the
> additional expense performance-wise (aside from being able to assign CPUs

??? I cannot believe this is even under consideration. Just how big is 
your organisation?

I run iptables firewalls on very modest machines, with single and dual 
T1 lines, and there is never any CPU load from the packet filtering nor 
the NAT. I don't have any really large sites, but I strongly suspect 
that iptables firewalling of very large sites could easily be handled by 
dumpster-grade equipment.

Of course with a budget like yours you'll want something new, which is 
better (we hope) for the physical reliability of the machine. A fast CPU 
  is useful for a fast boot time to minimise down time in the event of 
problems. Otherwise, a waste.

Listen, I ran my home cable, with multiple simultaneous large downloads 
and 3-4 busy Web browsers on a 386. It never broke a sweat. This of 
course used ISA 10Mbit NIC's. It could have handled many times the load 
without problem.

Why did I decommision it? Electricity. I only had so many outlets, and I 
needed a machine to perform more complex tasks, so the firewall job got 
handed off to another machine, and the 386 was retired. Still here in 
case I need it again.

I need a new computer ATM. How about I build a firewall machine for you, 
and you send me that SMP super machine? ;)
-- 
     mail to this address is discarded unless "/dev/rob0"
     or "not-spam" is in Subject: header

