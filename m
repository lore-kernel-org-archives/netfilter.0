From: Stephen J Smoogen <smoogen@lanl.gov>
Subject: Killing Me Softly with Her Interrupts
Date: Tue, 10 Aug 2004 07:22:42 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4118CC22.3050809@lanl.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I am seeing a performance issue with our testing netfilter boxes. They 
currently are:

  2x CPU 2400 Mhz Xeon
  2x E1000 Intel Corp. 82545EM Gigabit Ethernet Controller (Fibre Optic)
  2 gig of ram
  Adaptec AIC-7902B U320 w 2 Drives in Raid 0 configuration.

The network cards are in 64 bit PCI-X 133 Mhz slots.

The Operating System is Red Hat Enterprise 2 with the 2.4.21-15.EL 
kernel... however I have seen the following problem when running a 
pretty generic Linux 2.4 kernel without RH patches.

The problem is throughput. On some HTTP tests we get about 750 Mbits per 
second through the production firewall, but in other tests with a more 
diverse workload, we only see about 400 mbits per second. Looking at the 
  mpstats and sar data, I see that the CPU's are spending all their time 
dealing with softirq's on the 2 cards. At this point, I am trying to 
figure out how to get a better idea of what I can do to improve 
performance.

I am guessing that the card is sending a SoftIRQ per packet and am 
wondering if I need different cards, different proc or module settings 
to get NAPI to work (or if NAPI+netfilter is possible). Or that I am 
completely missing the obvious.

-- 
Stephen John Smoogen		smoogen@lanl.gov
Los Alamos National Lab  CCN-5 Sched 5/40  PH: 4-0645
Ta-03 SM-1498 MailStop B255 DP 10S  Los Alamos, NM 87545

