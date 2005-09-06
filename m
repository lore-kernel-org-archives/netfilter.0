From: "curby ." <curby.public@gmail.com>
Subject: Re: Multiple SNAT source address ranges
Date: Tue, 6 Sep 2005 14:27:05 -0600
Message-ID: <5d2f379105090613274d3bf9e@mail.gmail.com>
References: <43189DA7.2040604@lenderlab.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43189DA7.2040604@lenderlab.com>
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
To: Kirk Hoganson <kirk2@lenderlab.com>
Cc: netfilter@lists.netfilter.org

On 9/2/05, Kirk Hoganson <kirk2@lenderlab.com> wrote:
> I am attempting to create SNAT rules that will round-robin through a
> series of addresses from different ranges as per the man page.

http://netfilter.org/patch-o-matic/pom-base.html#pom-base-nth=20

probably does what you need.  In fact, its example is round robin SNAT. =3D=
)

--Curby

