From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NAT only - No connection tracking
Date: Mon, 11 Nov 2002 11:06:51 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211111106.gABB6ue27802@vulcan.rissington.net>
References: <00f701c28970$f3587bc0$0bc8c80a@dolphin>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00f701c28970$f3587bc0$0bc8c80a@dolphin>
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
To: "netfilter@lists" <netfilter@lists.netfilter.org>

On Monday 11 November 2002 10:56 am, yenjet.chan@eglobal.com.my wrote:

> Hi all,
>
> How can I make my iptable to do just NAT, no connection tracking?

Yes - just don't compile connection tracking support in, and don't try to use 
the -m state match.

> No matter how hard I tried to configure netfilter to load only iptable_nat,
> it will load ip_conntrack too.

I suggest you recompile the kernel without building the conntrack module.

> Basically, I want to make my iptable to become a NAT device without
> stateful inspection.

You do realise that your NAT rules will become a lot more complicated because 
of this, don't you ?

Antony.

-- 

Having been asked to provide a reference for this man,
I can confidently state that you will be very lucky indeed
if you can get him to work for you.

