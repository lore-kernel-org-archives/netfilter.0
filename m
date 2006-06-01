From: art <art@sigrand.ru>
Subject: Perfomance problem on MIPS
Date: Thu, 1 Jun 2006 12:09:02 +0700
Message-ID: <19506.060601@sigrand.ru>
Reply-To: art <art@sigrand.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hello all,

I have some problem with using iptables:
I work with Infineon ADM5120 SOC. It has MIPS32 4KC processor(200MHz),
embedded ADM5120 switch (with 4 100Mbit interfaces).
I get embedded Linux OS work on it.
I test network bandwidth without iptables enabled in kernel - result
80Mbit/s.
When I enable Connection tracking (I need NAT) & iptables and test
WITOUT ANY RULES - bandwidth was near 35-40Mbi/s.
Then I make several tests and find that most bandwidth reduction
occurs when enabling Connection tracking.

It's wery upset fact. What can be done with this? Can I get version
where NAT not depend on Connection tracking?



  

-- 
Best regards,
 art                          mailto:art@sigrand.ru



