From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: No internet connection
Date: Thu, 09 Sep 2004 12:00:28 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41408C2C.6020208@pbl.ca>
References: <20040909144044.27300.qmail@web50208.mail.yahoo.com>	<1094742137.14416.3.camel@wolfpack.ljm.dom>
	<20040909160053.GN8419@metastasis.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040909160053.GN8419@metastasis.org.uk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Nick Drage wrote:
> Not wishing to be paranoid, buuuuuuuuutttttttt..... couldn't you
> usefully restrict those by source and destination IP?

Probably, but...  You usually don't know IP address of DHCP server in 
advance (ISP can chage it without prior notice, which will happen each 
time they deem it is time to reorganize their network).  You don't know 
what will be your address before it is assigned to you.

Theoretically, you could modify dhcpclient so that it opens up firewall 
to be more permissive for those two ports when initially getting IP 
address, and than making it more strict when both local and DHCP 
server's addresses are known (and making it more permissive again if 
DHCP server goes south, so that new one could be discovered).

Theretically, your ISP (I guess it's cable, if using DHCP) should have 
been protecting you anyhow.  Otherwise, any wise ass with Windblows or 
Linux box could screw up entire cable segment.  It would be the last 
thing he would do (since it would be trivial to pinpoint him).  But it 
might be considered as fun last thing by the before mentioned wise ass.

On the other hand, you should also assume ISP is brain dead and have 
everything misconfigured (or in better case, not configured at all ;-)

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

