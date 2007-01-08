From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Natted packets
Date: Mon, 8 Jan 2007 23:00:17 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0701082259240.23737@yvahk01.tjqt.qr>
References: <45A2BB09.90405@eternet.cc>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45A2BB09.90405@eternet.cc>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lucas Diaz <lucasdiaz@eternet.cc>
Cc: netfilter@lists.netfilter.org


> Is it possible to know if a packet passing through my router is (s)natted?

I think `-m conntrack --ctstate SNAT` should do that.

> And the original (s)natted IP?

For userspace there's a getsockopt() call that you can use to find out.


	-`J'
-- 

