From: "Lee Evans" <netfilter@leeevans.org>
Subject: SNAT & DNAT
Date: Mon, 18 Oct 2004 15:46:08 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <E1CJaCD-0007HD-00@deer.gmane.org>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

Sorry if this has been asked before in some other guise - I looked through
the archives but couldn't spot anything (or a search feature..)

I'm going to be implementing a gateway system using IPTables, which will
need to perform both DNAT & SNAT on incoming connections.

The reason being that I want to provide external access to systems on a LAN
which do not have a default gateway (and nor do I want them to have one).

The connections will come in to the public IP of the gateway and be DNAT'ed
to the internal IP PREROUTING, and then SNAT'ed to the gateway's private IP
POSTROUTING so that the internal systems have a route out for reply traffic.

I've tested this on a small test-network but before I try to roll it out on
a larger scale, are there any issues with doing this that I should be aware
of?

Thanks
Lee


