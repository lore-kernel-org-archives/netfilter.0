From: Aaron Sethman <androsyn@ratbox.org>
Subject: Re: MSN and Yahoo Block through IPTABLES
Date: Mon, 30 Jun 2003 12:35:52 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.55.0306301233570.29991@squeaker.ratbox.org>
References: <010a01c33b03$d78da1f0$5505a8c0@asimejaz> <004901c33b4a$963ee9b0$1100000a@busbydev>
 <007d01c33bd7$699e3810$5505a8c0@asimejaz> <3EFB1B7F.1010200@nucdc.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3EFB1B7F.1010200@nucdc.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamie Pratt <jamie@nucdc.org>
Cc: netfilter@lists.netfilter.org


On Thu, 26 Jun 2003, Jamie Pratt wrote:

> Doesn't blocking tcp port 5050 outbound pretty much kill yahoo instant
> messenger clients? (Last I checked, it wouldn't connect for me at home
> until i opened 5050, but then again, maybe they got smarter like msn?)

The problem here is, the yahoo messenger servers listen on all ports, 1 to
65535, so even if you leave something like squid running and transparent
proxy everything through that, they would still be able to get through
using CONNECT to port 443.  The other option is, just tell your users it
is forbidden and that there will be actions taken if they use it ;)

Aaron

