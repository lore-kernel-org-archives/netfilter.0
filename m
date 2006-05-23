From: "Manfred Stock" <manfred.stock@gmail.com>
Subject: Re: Controlling an iptables-match from userspace
Date: Tue, 23 May 2006 17:00:42 +0200
Message-ID: <815d745e0605230800t4b4f58a3s76f160788025fa95@mail.gmail.com>
References: <815d745e0605230442x24c596a2w6e97b7fb83dfeba@mail.gmail.com>
	<Pine.LNX.4.64.0605231402210.27281@mercury.sdinet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.64.0605231402210.27281@mercury.sdinet.de>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

On 5/23/06, Sven-Haegar Koch <haegar@sdinet.de> wrote:
> On Tue, 23 May 2006, Manfred Stock wrote:
> > I'm looking for a way to control an iptables-match from a
> > c/c++-program. My goal is to
> > have a simple match-module which can be told from userspace to either
> > return 0 or 1
> > in it's match-function (this would be useful for dynamically turning
> > on/off several more
> > complicated rules without inserting/removing them from the ip tables,
> > i.e. without
> > using libiptc (for which I haven't found an easy way on how to use it
> > anyways...) or
> > iptables itself).
> Have a look at the "condition" patch-o-matic-ng extension. Some time ago
> is was in the pom-ng subversion repository, but I don't know where it is
> kept now.

Thanks. That's close to what I'm looking for. Unfortunately, it does
not seem to be maintained anymore - I could find the sources in
netfilter's svn using google, but the last change was it's import into
the new trunk directory 19 months ago... At least it compiles against
2.6.8 with only one warning, and seems to work. But I would very much
prefer a solution which does not rely on /proc because I don't believe
in it's future for this kind of stuff ;). Any ideas?


Best regards,

Manfred.

