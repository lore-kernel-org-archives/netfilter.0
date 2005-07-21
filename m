From: JC <bikkit@gmail.com>
Subject: Re: Questions regarding routing in the stack
Date: Thu, 21 Jul 2005 10:18:26 -0700
Message-ID: <a60102c305072110181bb1a491@mail.gmail.com>
References: <a60102c3050721073024051dd2@mail.gmail.com>
	<Pine.GSO.4.58.0507211222530.20075@newavalon.cs.rit.edu>
Reply-To: JC <bikkit@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.GSO.4.58.0507211222530.20075@newavalon.cs.rit.edu>
Content-Disposition: inline
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
To: "Carl Holtje ,021,vcsg6," <cwh0803@cs.rit.edu>
Cc: netfilter@lists.netfilter.org

The diagram is helpfull, thank you. I'll give it a thorough look...

> > Of course, that needs to happen for both locally generated traffic and
> > incoming traffic, so that I link the incoming packets to the right
> > applications.
>
> Why does this sound like NAT, where you take data from one interface and
> spit it out on another (receive is done the same way)?

It is a kind of NATing, just changing the IP/interface. The thing is
the rules are not static, they can change at a high rate. Definitely
not confident changing the rules with a script rewritting/reloading
the ruleset will not break it at some point. I am currently thinking
of writting a netfilter module of some sort that will handle this out.

