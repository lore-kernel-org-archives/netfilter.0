From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: forwarding traffic to different hosts
Date: Mon, 30 Aug 2004 01:01:19 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040830000119.GA20169@metastasis.org.uk>
References: <D5C9032B2B09C64EA2409D6214E91AC906420F@asimail2.alphanumeric.com>
Reply-To: Netfilter Mailing List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC906420F@asimail2.alphanumeric.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Sat, Aug 28, 2004 at 10:14:25AM -0400, Jason Opperisano wrote:
> > 207.155.252.12 - out on the Internet somewhere
> >   |
> > 198.81.129.1 - default gateway
> >   |
> > -------------------------------------
> >   |                              |
> >   |                        198.81.129.101
> > 198.81.129.100
> >

> my first question would be:  is it silly to ask why you don't redirect
> the traffic from 207.155.252.12 to 198.81.129.101 on the 198.81.129.1
> gateway?

It isn't a silly question at all, 198.81.129.1, the gateway, doesn't
have that functionality.

<snip>

> (1) SNAT the packets in addition to DNAT-ing the packets so that they
> appear to come from 100, and 101 will reply back through 100.  this
> was my original answer that wasn't viable in your situation.

This is the option I was considering, but it's a bit nasty isn't it.
However this

> neither of the above are what i would call ideal solutions.  the
> "proper" way to do this (IMHO), would be to use the power of the
> application in question (bind) to do what you want (here i go with my
> OT non-netfilter configs).
>
>
> create a view in bind on 198.81.129.100 for the client 207.155.252.12:
> 
> in named.conf:
> 
>   acl "specialhost" { 207.155.252.12/32; };
>   include "named.conf.specialhost";
> 
> in named.conf.specialhost:
> 
> view special {
>         match-clients { "specialhost"; };
>         forward only;
>         forwarders { 198.81.129.101; };
> };
> 
> HTH...

It does, a lot.  That's something I'll have to play with, I didn't
realise that BIND was that malleable.  

Thank you very much for your help and thoughts on this, much
appreciated.

-- 
mors omnia vincit

