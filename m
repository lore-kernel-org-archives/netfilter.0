From: Mike <1100100@gmail.com>
Subject: Re: Policy Misunderstanding: RTFM Guidance Requested.
Date: Wed, 1 Sep 2004 13:53:29 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <8ca4228204090110537e02c5eb@mail.gmail.com>
References: <200409011323.i81DNQAi040521@jkcpub.iserver.net>
	<8ca4228204090108466549b5f3@mail.gmail.com>
	<1094057457.1824.11.camel@wolfpack.ljm.dom>
Reply-To: Mike <1100100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1094057457.1824.11.camel@wolfpack.ljm.dom>
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

Jason,

Thanks for your response.
I definitely appreciate the help.

On Wed, 01 Sep 2004 12:50:58 -0400, Jason Opperisano <opie@817west.com> wrote:
> > 1.  Can appended rules override default polices?
> 
> yes--for example:
> 
> iptables -P INPUT DROP
> iptables -A INPUT -j ACCEPT

Excellent.  Now I'm clear on this point.

 > if you set the policies of the mangle chains to DROP and then do not
> append any rules, you can be pretty sure that no traffic will get
> through.
> 
> i'd recommend against starting your netfilter adventure by setting the
> policies of nat & mangle chains to DROP.  it will make it a very short
> trip...
> 

This is starting to get clearer after reading some of Adreasson's
tutorial and following the flow of packets traversing the tables.  It
looks like 'mangle' is right there at the beginning of every table
transaction, so my mangle Policy is pre-empting everything else.

Best regards.

Mike

