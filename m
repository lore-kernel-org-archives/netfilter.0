From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Fwd: proxy+port redirection behaviour
Date: Thu, 28 Apr 2005 12:11:50 -0500
Message-ID: <42711956.3060707@riverviewtech.net>
References: <110c784405042103362108ebad@mail.gmail.com>	<4267C082.7030809@riverviewtech.net>	<110c784405042704552296d4f5@mail.gmail.com>	<42706029.2090908@riverviewtech.net>	<110c784405042802112d30e98f@mail.gmail.com>
	<110c7844050428021276a634f4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <110c7844050428021276a634f4@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Metal Gear <finattack@gmail.com>
Cc: netfilter@lists.netfilter.org

> My clients gateway is set to squid proxy and the squid proxy 's gateway is 
> set to the firewall. I want to run the rules on my squid box and there are 
> no other rules on it. Except the ones that i send in my previous mail.

*nod*

> Yes no extra DROP rules My squid box has only one interface so there is any 
> neeed of enabling forwarding on it. ?? Anyways i enable forwarding but still 
> it does not works.

Pardon while I scratch my head and think about this one.  Is there any way that I could get the output from iptables-save to look at?  What happens when you do try to telnet to port 25 on your server?



Grant. . . .

