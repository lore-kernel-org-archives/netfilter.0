From: "Trever L. Adams" <tadams-lists@myrealbox.com>
Subject: Re: ipv6 and state matching
Date: 25 Mar 2003 10:53:17 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048607597.1052.9.camel@localhost.localdomain>
References: <Pine.LNX.4.33.0303250926560.7010-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0303250926560.7010-100000@blackhole.kfki.hu>
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
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org

On Tue, 2003-03-25 at 03:33, Jozsef Kadlecsik wrote:
> On 24 Mar 2003, Trever L. Adams wrote:
> 
> > I am unable to find any questions about this.  I really love state
> > matching in ipv4.  I find that w/ RedHat 8.0 and Phoebe (8.1.99 or
> > something like that), that I cannot do this.  This does indeed seem to
> > be an accurate state.
> 
> Brad Chapman had an attempt to port IPv4 conntrack to IPv6 but his code
> was never accepted.
> 
> Last year I worked on the prototype of an unified conntrack code, but it
> was never released. Unfortunately just conntrack doesn't seem to be enough
> - one is tempted to implement NAPT etc. as well.
> 

What is NAPT? Do you mean NAT?  Why was yours never released?

> > Are there plans on doing state support?  Is it all that much more
> > difficult?
> 
> A straight porting is not so difficult, but that direction cannot be
> followed because it would result in a severe code-duplication.
> Unification takes a lot of time.
> 
> Best regards,
> Jozsef

Hmm, what is the desired route right now?  Are they wanting to just
share code base (lots of ifdefs all over) or are they wanting to
actually have the two code bases use the same binary object?

If one object is desired, can you just use ipv6 structs (whatever ones
are involved) in all cases, or should there be a flag and use pointers
so that each connection uses the appropriate structres?

I am willing to give this a go, I think.  However, this would be my
first "major" work in the kernel (I have only helped a bit with cipe
before).  I am not sure how great it would be.

Trever Adams
--
"There's no such things as guaranteed return on anything these days." --
John S. Demott


