From: Brian Capouch <brianc@palaver.net>
Subject: Tracking RTP?
Date: Sat, 01 Feb 2003 02:16:26 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E3B744A.7070009@palaver.net>
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

I hope this isn't a FAQ.

We're using a hybridized iptables/HTB system for traffic shaping and 
control, and we have roughly identified a problem our VoIP users are 
having as most probably caused by the fact that the RTP part of each 
call is being seen as bulk traffic.

I'm not a gearhead in this domain, but hope that someone who is might be 
able to point me down the correct avenue.

Thanks.

B.


