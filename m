From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables suddently stop working
Date: Thu, 7 Nov 2002 09:00:14 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021107090017.LQPC27595.mta05-svc.ntlworld.com@there>
References: <20021106223940.UUGR292.mta03-svc.ntlworld.com@there> <3607.192.168.7.41.1036626850.squirrel@iw.k1k2.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3607.192.168.7.41.1036626850.squirrel@iw.k1k2.com>
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

On Wednesday 06 November 2002 11:54 pm, Andrew Smith wrote:

> > Okay, so this means you have 156 connections being tracked through your
> >  firewall (seems a perfectly reasonable number for 200 users), with
> > capacity  for up to 65424 connections before the box gets overloaded.
> >
> > If you ever got more than 65424 connections from 200 users it would
> > indicate  a serious problem (eg Nimda on the machines...) - I would
> > never expect that  to happen.
>
> Never heard of CounterStrike?

No, not really - I assume it's a game of some sort, but I know nothing about 
it.

> Only takes a few users to do a 'get server list' at the same time to
> fill a conntrack table that size.

Doesn't sound like a very well-written application to me.

Antony.

-- 

How I want a drink, alcoholic of course, after the heavy chapters
involving quantum mechanics.

 - 3.14159265358979

