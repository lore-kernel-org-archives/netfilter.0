From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Log Problem
Date: Mon, 9 Aug 2004 18:37:05 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408091837.05112.Antony@Soft-Solutions.co.uk>
References: <200408091311314.SM01376@Hope>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200408091311314.SM01376@Hope>
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
To: netfilter@lists.netfilter.org

On Monday 09 August 2004 6:11 pm, David Ashwood wrote:

> Thanks for responding Antony,
>
> 1) Same problem as before ' iptables: No chain/target/match by that name'
>
> 2) User defined chains work - and I can put a drop rule without problems.
>
> Kernel:
> A new box just bought - I thought the kernel was old - but I had to demo a
> product for a client - and wanted to get that done before I pester the VPS
> hosts to upgrade the kernel.

VPS?

My recommendation is a kernel recompile (without changing the version for 
now).   Should take about 15 minutes.

Once you've done the demo and have time to think about things, get a current 
kernel, do a "make oldconfig", and build something up-to-date.

Hope this helps,

Antony.

-- 
Late in 1972 President Richard Nixon announced that the rate of increase of 
inflation was decreasing.   This was the first time a sitting president used 
a third derivative to advance his case for re-election.

 - Hugo Rossi, Notices of the American Mathematical Society

                                                     Please reply to the list;
                                                           please don't CC me.


