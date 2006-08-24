From: pub@vlab.mb.jhu.edu
Subject: where is u32 matching module?
Date: Thu, 24 Aug 2006 15:09:38 -0400
Message-ID: <44EDF972.3010105@vlab.mb.jhu.edu>
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

Hello,

I am trying to match the receive window size in the incoming packets.
What I can think of is using u32 module to match any 4 bytes of data.
However, the iptables manual in fedora core 5 mentioned to look for
details in kernel module, while the u32 module is not in my kernel
source tree apparently. Is this module being replaced by something
else I am not aware of? Is there any alternative to match the window size?

--Bob

