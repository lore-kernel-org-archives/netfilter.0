From: Markus Marquardt <markus.marquardt@atosorigin.com>
Subject: Something like next hop match
Date: Thu, 12 Oct 2006 13:39:28 +0200
Message-ID: <452E2970.6090401@atosorigin.com>
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

Hello,

in my configuration there's a linux router which is dynamically learning
routes via RIP from an isdn router connected to the "outside" interface
of the router. The internet gateway is also conencted to that interface.

For some reason i don't want the packets which travel through the isdn
router to get SNATted. Packets going out to the internet gateway must be
SNATted.

Is there any way to match the packets which travel through the isdn
router by something like a next hop match in the POSTROUTING table? Some
years ago there was a nexthop match patch, but it never makes it into
the netfilter project.

Any ideas?

Regards,
Markus


