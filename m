From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: doing NAT on udp broadcast traffic (for LAN tcp/ip gaming)
Date: Wed, 9 Oct 2002 22:09:04 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021009210911.KFIZ459.mta02-svc.ntlworld.com@there>
References: <Pine.LNX.4.44.0210091128000.4531-100000@home.apu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0210091128000.4531-100000@home.apu.edu>
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

On Wednesday 09 October 2002 7:49 pm, Chris Len wrote:

> I'm trying to create a psuedo-bridge between wireless and ethernet
> interface. All works well, except detection of lan game servers. These
> clients send out a global udp broadcast (255.255.255.255) to the game
> server's dst port, and the server replies. Currently however, I cannot nat
> this traffic.
>
> Is there any way to make this work?

I do not believe there is unless you turn your pseudo-bridge into a real 
bridge.

The reason is simple: broadcasts do not get routed.   A firewall with 
different network ranges on the two interfaces is a router.   Therefore you 
cannot send broadcasts across a firewall set up the way yours is.

If you set up full bridging, so that both interfaces were on the same IP 
address and therefore both sides of the machine were the same network, then 
broadcasts would travel across it.

You can't send broadcasts across a router even if you NAT them first.

Antony.

-- 

Normal people think "if it ain't broke, don't fix it".
Engineers think "if it ain't broke, it doesn't have enough features yet".

