From: Steve Comfort <steve@4Dllc.com>
Subject: Cross compiling, etc
Date: Fri, 25 Jun 2004 11:57:36 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40DBF710.1020200@4Dllc.com>
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
To: netfilter <netfilter@lists.netfilter.org>

Hi gents,

I've sorted out the problems with my cross compilation. I hadn't noticed 
that the linker was using ar instead of arm-linux-ar. So, no more 
truncations and iptables with my semi-trivial little script appears 
hunky-dory. (Just tested on ping limits so far).

Next question is whether you gurus can recommend any good test app that 
I can use for checking my rules and seeing whether there any holes?


Best regards
Steve


