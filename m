From: Nils Juergens <ju@isf.rwth-aachen.de>
Subject: Re: How to log what is drop
Date: Thu, 08 Jul 2004 11:38:39 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040708093839.GD3933@koala7>
References: <B732FD42D68974438C1451C73C1D030FD1F5BA@FR92EX02.eu.abxlogistics.com>
 <200407080844.08036.gdh@acentral.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <200407080844.08036.gdh@acentral.co.uk>
Content-Disposition: inline
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

On Thu, 08.07.04, Gavin Hamill <gdh@acentral.co.uk> wrote:

> > And I had the following rule:
> > 	Iptables -A FORWARD -j LOG
> >
> > It seems that all connections is logged so it is very difficult to read the
> > log.
> 
> Firstly, do you actually have DROP statements in your ruleset? If so, the LOG 
> statement should appear JUST BEFORE the block of DROP statements. Since 
> ACCEPT or DROP are one-way-streets for packets, you want to LOG just before 
> they get DROPped, but not log any of the ACCEPTed packets.

A very good way to do this is via a special chain "logdrop"

iptables -N logdrop
iptables -A logdrop -j LOG --log-prefix ' log drop '
iptables -A logdrop -j DROP

And then you replace every -j DROP (that you want logged) with -j logdrop.

I think this is mentioned in a part of the netfilter docs.

hth,
Nils


