From: Jesper Lund <jesper@ballbreaker.dk>
Subject: Re: After 14 hours of brainpain...
Date: Mon, 3 Jan 2005 12:55:00 +0100
Message-ID: <20050103125500.059f8045.jesper@ballbreaker.dk>
References: <E6A0AAEA-5D1F-11D9-83E1-000A95B981B6@knoxville.se>
	<1104716217.6477.7.camel@hubcap.ljm.dom>
	<46D3EF59-5D62-11D9-B917-000A95B981B6@knoxville.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46D3EF59-5D62-11D9-B917-000A95B981B6@knoxville.se>
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
To: netfilter@lists.netfilter.org

> What does the -I do? and why is the order so important (just
> curious and wants to learn).

The -I menas to Insert a rule in the the top of a chain rather
than adding it to the bottom of a chain.

The order of the rules are important, because a packet starts
traversing the chains, and the first rule a packets matches, it
jumps to a target, and stops traversing that chains. Unless the
target is LOG, RETURN and some others.

/Jesper

