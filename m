From: Jason Opperisano <opie@817west.com>
Subject: Re: input filter
Date: Thu, 6 Jan 2005 11:08:06 -0500
Message-ID: <20050106160806.GA28410@bender.817west.com>
References: <41DC212C.4050106@hotpop.com>
	<20050105223043.94871.qmail@web53908.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050105223043.94871.qmail@web53908.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Jan 05, 2005 at 02:30:43PM -0800, Bhasker Allam wrote:
> There are a few situations that I can think of:
> 
> - A spurious host/hosts sending garbage packets. If I
> know either source IP/subnet or mac address I can put
> in a filter and drop all the packets from spurious
> souces with minimal effort. Why should I spend cycles
> doing the route lookup ?

-t mangle PREROUTING is an acceptable place to do "first things first"
filtering/packet scrubbing.  it's where i do things like anti-spoofing
rules and invalid TCP flag combo rules.

> - I could do policy based routing. That is, I want
> packets from interface X or subnet S to go out on
> interface Y all the rest go via the normal routing
> path. From what I read this is not possible now.

whatcha been reading?  it's certainly possible:

  http://lartc.org/howto/lartc.rpdb.html

> - If I use my linux box a router I could have policies
> on different interface to do different things. For
> example, I might not want packets arriving from
> certain sources to reach certain destinations. It does
> not matter whether I am forwarding or not. You could
> say I could put that in the output filter, but my
> argument why should I have go through route lookup if
> I don't have to ?

you're starting to toe the line as to what should go in your normal
filter rules here--but that's just IMHO.

-j

--
"Beer. Now there's a temporary solution."
        --The Simpsons

