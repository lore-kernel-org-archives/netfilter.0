From: Toby Bradshaw <tobyb@rawflow.com>
Subject: Few questions re: firewalling capabilities of iptables..
Date: Tue, 07 Feb 2006 13:36:32 +0000
Message-ID: <43E8A260.2000702@rawflow.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Folks,

I have a few questions regarding the firewalling capabilites of 
iptables. If this isn't the correct place to ask such things  then 
please accept my apologies and point me in the right direction.

My company is developing a streaming P2P client. I've managed to set up 
a test environment on a single machine using sub-interfaces and SNAT so 
that I can run what appear to our co-ordinating server as many hosts on 
private networks behind NAT firewalls (or at least I think I have.. any 
information to the contrary greatly received).

We're using STUN to perform NAT traversal. STUN makes a distinction 
between cone and symmetric NAT's (so I'm told) and it would be nice to 
be able to set up examples of each within this test network:

1) What kind of NAT is iptables ?
2) Would it be possible (from rootland) to simulate the other kind ?
3) If any of these questions seem dumb.. what have I not understood ?

Thanks in advance...

-- 
Toby Bradshaw
Rawflow,
London, UK.

