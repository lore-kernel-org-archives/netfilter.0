From: Bob Tellefson <bob@zooid.com>
Subject: Re: Two NICS with same IP and same client IP
Date: Wed, 2 Feb 2005 18:41:35 +0000
Message-ID: <200502021841.35410.bob@zooid.com>
References: <27594E8BA9D5CA458F5EF87D88B6B48F019948@pxtvjoexd01.pxt.primeexalia.com>
	<18348031.1107363459685.JavaMail.rct@kale>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <18348031.1107363459685.JavaMail.rct@kale>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Wednesday 02 February 2005 16:57, Herv=E9 wrote:

> Basically, the network interface where the packet originated has to
> somehow be remembered at the routing stage. I only see source address
> mangling to do that...
>

It would seem that if you add two additional IPs to the NFS machine (on a=20
dummy interface) and do a local DNAT to those IPs based on the incoming nic=
,=20
that the correct routing tables/rules would be all that is needed to route=
=20
the return packets to the correct network.

Have a look at

   http://www.policyrouting.org/PolicyRoutingBook/ONLINE/TOC.html

for the concepts and examples.  Chapter 5, in particular, covers the routin=
g=20
concepts your solution will need.

Note that ProxyARP uses the same ip on two interfaces and depends on the=20
proper routing table entries to do the right thing.


=2D-=20

Bob Tellefson
Java network application development & hosting

