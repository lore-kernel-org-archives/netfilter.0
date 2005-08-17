From: Ray Van Dolson <rayvd@digitalpath.net>
Subject: Re: Conntrack table editing utility
Date: Wed, 17 Aug 2005 13:48:51 -0700
Message-ID: <20050817204851.GA4473@digitalpath.net>
References: <1122567204.42e90424cba63@base.mxtelecom.com>
	<42ED1CB1.3050700@gmx.co.uk> <42EECA62.2070301@telefonica.net>
	<42EF26C8.8090302@mnemon.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <42EF26C8.8090302@mnemon.de>
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

On Tue, Aug 02, 2005 at 09:54:48AM +0200, J=F6rg Harmuth wrote:
> srg schrieb:
> > there is a file (don't remember the name) under /proc that have all
> > contrack entries
>=20
> /proc/net/ip_conntrack

This is fine and all for viewing, but what is being requested is a utility =
to
"edit" (arbitrarily remove) ip_conntrack entries.   Situations arrive when =
I'd
like to expire a cached conntrack entry sooner.  There's a way to do this w=
ith
TCP connections, but not UDP or other protocols as far as I can tell.

This would be really handy!

Ray

