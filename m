From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: OUTPUT chain DNAT problem
Date: Thu, 3 Jul 2003 08:31:07 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030703123107.GB5043@cannon.eng.us.uu.net>
References: <09B04A55822EFF4DA48D2E0BB2941D4A15BEC7@wardrive.citadelcomputer.com.au> <1591512625.20030703125614@flshlnk.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1591512625.20030703125614@flshlnk.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fox <admin@flshlnk.com>
Cc: netfilter@lists.netfilter.org

On Thu, Jul 03, 2003 at 12:56:14PM +0500, Fox wrote:

> I don't understand the reasons why iptables cannot SNAT in PREROUTING
> or DNAT in POSTROUTING.

It's because of the routing. It might confuse the kernel for making the
routing decision.

Ramin

