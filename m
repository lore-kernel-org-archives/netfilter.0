From: Robert Nichols <rnicholsNOSPAM@comcast.net>
Subject: Re: Unmatchable packet?
Date: Thu, 24 Nov 2005 08:29:08 -0600
Message-ID: <dm4inl$31v$1@sea.gmane.org>
References: <071e01c5efa7$786db600$5e00800a@printserver>	<073501c5efab$b10ad390$5e00800a@printserver>	<4383BBE0.2020504@gmail.com>	<078401c5efcf$bd9eb210$5e00800a@printserver>	<4384069F.3010201@snapgear.com>	<WorldClient-F200511222303.AA03060138@nikola.com>	<438417F8.3060907@snapgear.com>
	<002201c5f0ec$ef3f2c50$5e00800a@printserver>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002201c5f0ec$ef3f2c50$5e00800a@printserver>
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
To: netfilter@lists.netfilter.org

Jesse Gordon wrote:
> Anyone know of a short concise website that tells me what I can and 
> can't do in each table, what they are for, and what order they are 
> tested in?
> That might help me immensely.

That is precisely the information that is in Chapter 6, "Traversing
of Tables and Chains", in the tutorial.  It's just seven pages.

> But shouldn't the reply packet be ignored by all nat rules, since nat 
> only sees first packet of connection?

The nat _rule_ processing occurs only for the first packet, but
whatever translation was determined for that first packet then
gets applied to all subsequent packets of the connection
symmetrically (i.e., in both directions).

-- 
Bob Nichols         Yes, "NOSPAM" is really part of my email address.


