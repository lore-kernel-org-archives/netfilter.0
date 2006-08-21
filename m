From: "Gavin White" <white.gavin@gmail.com>
Subject: load balancing by source IP address
Date: Mon, 21 Aug 2006 14:16:56 +0100
Message-ID: <451eaded0608210616y1c7752e2r18e30dbd1879e50c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Hello,

I would like to use iptables SNAT/DNAT to provide load balancing for
an inbound web service. The service is sticky, that is to say, users
must be redirected to the same machine during a user session, which
can span several TCP sessions.

One simple way to do this would be by redirecting incoming connections
based on their source IP address. Since addresses might not be evenly
distributed through the address space, and many customers might be
concentrated in particular regions, I would like to specify a filter
using the last octet, ie. *.*.*.0-127 redirects to server A, and
*.*.*.128-255 redirects to server B. I would also be happy creating
255 rules if a last - octet range is not possible.

Does anyone have any suggestions on how to do this, or other, more
sensible approaches to sticky load balancling?

Thanks,

Gavin

