From: Alexey Toptygin <alexeyt@freeshell.org>
Subject: Re: NAT/POSTROUTING rules doesn't match packets
Date: Mon, 10 Oct 2005 17:27:48 +0000 (UTC)
Message-ID: <Pine.NEB.4.62.0510101726470.21351@otaku.freeshell.org>
References: <20051004070925.7E2783C65565@mailgate.informatik.haw-hamburg.de>
	<200510072133.37280.marek.zachara@conexe.pl>
	<Pine.LNX.4.61.0510092357070.30581@filer.marasystems.com>
	<200510101442.13454.marek.zachara@conexe.pl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510101442.13454.marek.zachara@conexe.pl>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Marek Zachara <marek.zachara@conexe.pl>
Cc: netfilter@lists.netfilter.org

On Mon, 10 Oct 2005, Marek Zachara wrote:

> On Monday 10 of October 2005 00:02, you wrote:
>> On Fri, 7 Oct 2005, Marek Zachara wrote:
>>> Well, the router startup procedure is like this:
>>> 1) boot up core system (eth0 built-in kernel and enabled as the router
>>> root is on nfs via eth0)
>>> 2) set up iptables rules
>>> 3) bring up eth1
>>
>> Try adding rules before eth0 is set up, rejecting all traffic except the
>> traffic you need for booting until the real rules is loaded later on.
>>
> I did try. However even adding blocking (-p udp -j DROP) at PREROUTING and
> keeping such rule for 5 min doesn't clean the conntrack - somehow the entry
> is 'sustained' with the incoming packets even if they are being dropped early
> in the chain.

Packets in PREROUTING in the forward table have already been seen by 
conntrack. You need to drop in the raw table if you want to prevent 
tracking.

 			Alexey

