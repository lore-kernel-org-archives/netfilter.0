From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipv6 and state matching
Date: Tue, 25 Mar 2003 09:33:26 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0303250926560.7010-100000@blackhole.kfki.hu>
References: <1048536519.1040.5.camel@aurora.localdomain>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1048536519.1040.5.camel@aurora.localdomain>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Trever L. Adams" <tadams-lists@myrealbox.com>
Cc: netfilter@lists.netfilter.org

On 24 Mar 2003, Trever L. Adams wrote:

> I am unable to find any questions about this.  I really love state
> matching in ipv4.  I find that w/ RedHat 8.0 and Phoebe (8.1.99 or
> something like that), that I cannot do this.  This does indeed seem to
> be an accurate state.

Brad Chapman had an attempt to port IPv4 conntrack to IPv6 but his code
was never accepted.

Last year I worked on the prototype of an unified conntrack code, but it
was never released. Unfortunately just conntrack doesn't seem to be enough
- one is tempted to implement NAPT etc. as well.

> Are there plans on doing state support?  Is it all that much more
> difficult?

A straight porting is not so difficult, but that direction cannot be
followed because it would result in a severe code-duplication.
Unification takes a lot of time.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


