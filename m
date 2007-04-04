From: larytet.48654039@bloglines.com
Subject: integration with network processor
Date: 4 Apr 2007 07:08:06 -0000
Message-ID: <1175670486.2731537351.26060.sendItem@bloglines.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,



Here is the goal



We have general purpose CPU (MIPS with MMU)
and a simple network processor - all in one ASIC. Microcode running in the
network processor  executes lookups according to the packet address/port source/destination,
protocol type, MAC address source/destination. Depending on the outcome of
the lookup network processor can 

- drop the packet

- forward the packet
to one of the interfaces

- forward the packet to the CPU

Microcode is fairly
flexible and can be extended to provide counters of the packets per logical
flow, etc. Network processor works with EMAC packets - handles packets containing
MAC header.



We are running 2.6 Linux kernel in the CPU. 



Naturally I
would like to use netfilter for 

management of the network processor and
use 

the fast network processor to forward as many 

packets as possible
without CPU intervention. 



I read through the documentation and started
to 

study the source code. It appears, that it's 

possible to solve the
problem. But I would like to 

avoid solving the same time problem twice.
Is 

there any example(s) of integration of the network 

processor and netfilter
? If there is no code any 

documentation/tips/links could save me lot of


time.





thank you



