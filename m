From: Taylor Grant <gtaylor@riverviewtech.net>
Subject: Re: Cleanest way to deal with loopback interface?
Date: Wed, 13 Apr 2005 20:32:56 -0500
Message-ID: <425DC848.5090909@riverviewtech.net>
References: <1113425449.3544.177.camel@seberino.spawar.navy.mil>	<20050413211349.GA31336@bender.817west.com>	<1113436673.3544.186.camel@seberino.spawar.navy.mil>
	<20050414013525.GA32192@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050414013525.GA32192@bender.817west.com>
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

> yeah--somewhere around line 1434 of:
> 
>   /usr/src/linux-2.4.28/net/ipv4/route.c
> 
> on the machine i'm looking at.

Do you have any idea where the corresponding code would be in the 2.6 kernel?  I was not aware that such a filter did exist.  Personally I'd like a way to turn it off and set up my firewall the way that I want.  IMHO this could be considered a hidden bug.



Grant. . . .

