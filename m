From: David Lang <dlang@digitalinsight.com>
Subject: Re: Two identical ips connected
Date: Mon, 16 Oct 2006 17:34:11 -0700 (PDT)
Message-ID: <Pine.LNX.4.63.0610161729270.1754@qynat.qvtvafvgr.pbz>
References: <20061016095557.058bbde3@vmm1.chaosbringer.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20061016095557.058bbde3@vmm1.chaosbringer.de>
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
To: Julian Hagenauer <chaosbringer@gmx.de>
Cc: netfilter@lists.netfilter.org

On Mon, 16 Oct 2006, Julian Hagenauer wrote:

> Hi,
> is it possible somehow possible to attach two computers with the same ip
> to a router, and let the router rewrite/masquerade the ip of one of
> those computers with iptables, so that both could be accessed with different ips?
>
> Can you give my some hints how this could be achieved?
>

you can't do it with one router, but you could with two routers

machineA 10.0.0.1
   |      machineB Natted as 10.0.0.2 by router1 (from the 192.168.1.2 that
   |      router2 makes it)
router1
   |      machine A Natted as 192.168.1.1 (by router1)
   |      machine B Natted as 192.168.1.2 (by router2)
router2
   |      machineA Natted as 10.0.0.2 by router2 (from the 192.168.1.1 that
   |      router2 makes it)
machineB 10.0.0.1

each machine would see the other as 10.0.0.2

very ugly, but if you can't do anything else, this approach can work.

David Lang

