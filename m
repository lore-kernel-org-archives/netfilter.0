From: Philip Craig <philipc@snapgear.com>
Subject: Re: Conntrack PPTP broken in 2.4.22 ?
Date: Mon, 15 Sep 2003 15:40:48 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F6550E0.9080407@snapgear.com>
References: <008b01c37af5$bbca4f40$0440a8c0@SC2003002>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <008b01c37af5$bbca4f40$0440a8c0@SC2003002>
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
To: Enrico Demarin <enricod@videotron.ca>
Cc: netfilter@lists.netfilter.org

Enrico Demarin wrote:
> Any idea if the PPTP conntrack module will make it into the mainstream
> kernel ? 

Eventually yes.  I doubt it has been stable enough yet to
consider it.

> One more (unrelated?) question : is it possible to disable connection
> tracking on a per interface basis ?

Have a look at patch-o-matic/userspace/raw.patch, which adds
a NOTRACK target.

-- 
Philip Craig - philipc@snapgear.com - http://www.SnapGear.com
SnapGear - Custom Embedded Solutions and Security Appliances


