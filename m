From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: Maximum Number of Chains
Date: Wed, 03 Sep 2003 12:21:08 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F5614F4.50908@Loudoun-Fairfax.com>
References: <09B04A55822EFF4DA48D2E0BB2941D4A15C21A@wardrive.citadelcomputer.com.au> <20030903120302.M95330@tkevans.com> <3F560BCC.4020907@riovia.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F560BCC.4020907@riovia.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Cc: netfilter@lists.netfilter.org

Hi Paul,

Paul Caritj wrote:

> Agreed,
> Heres my situatuation: I need to create rules on the fly for 
> (potentially) up to 4000 users. What I need is a way to delete *all* 
> the rules for a given ip address without knowing the full contents of 
> the rule (only the ip); as you might have guessed, I'm doing this 
> programatically.
>
> My current solution is to have one chain for each associated IP. Is 
> there a better solution to this problem?

Yikes, isn't processing that many rules for that many clients going to 
have some performance impact? Have you tried a strategy of processing 
the general rules (RELATED,ESTABLISHED -j ACCEPT, etc.) in your main 
filter chain and then dividing the client rules up by subnet? In theory 
that would substantially cut down the number of rules you would need to 
test for any given IP address.

Jeff


