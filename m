From: Kenneth Porter <shiva@sewingwitch.com>
Subject: Re: Setting TOS in POSTROUTING mangle table
Date: Wed, 06 Oct 2004 10:21:27 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <EC41761633122CEB2108A37F@[10.169.6.246]>
References: <E0E0E80CC865BFEC576183B5@[10.169.6.246]>
	<1097078302.5214.10.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1097078302.5214.10.camel@wolfpack.ljm.dom>
Content-Disposition: inline
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

--On Wednesday, October 06, 2004 11:58 AM -0400 Jason Opperisano 
<opie@817west.com> wrote:

> if the netfilter box is also the traffic shaper--set TOS in PREROUTING
> so that that tc filters have the TOS values available to make a
> decision.

That's what I'd like to do, but...

<http://www.faqs.org/docs/iptables/traversingoftables.html>

Is table 3.2 wrong? PREROUTING isn't even in that table, and there's no way 
to affect a packet before the routing decision step and after the app has 
delivered the packet to the kernel.

I have no access to the source of the typical game server binary, so I 
can't set the TOS bits before the packets hit the kernel. (The developer of 
the Battlefield 1942 Linux server added this feature as an option, though.)

