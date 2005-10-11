From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: iprange match
Date: Tue, 11 Oct 2005 15:06:03 -0500
Message-ID: <200510111506.03998.rob0@gmx.co.uk>
References: <1129043668.2415.12.camel@vyatka-39.cablenet.com.ni>
	<200510111351.51801.rob0@gmx.co.uk>
	<1129059566.2415.86.camel@vyatka-39.cablenet.com.ni>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1129059566.2415.86.camel@vyatka-39.cablenet.com.ni>
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

> El mar, 11-10-2005 a las 13:51 -0500, /dev/rob0 escribi=F3:
> > Please don't top-post your replies. It makes it very difficult to
> > follow, especially since the post you're replying to has not (yet?)
> > reached the list.

> > On Tuesday 2005-October-11 13:36, Jorge I. Davila L. wrote:
> > > iptables -A OUTPUT -p tcp -m iprange \
> > > --src-range 192.168.223.1-192.168.223.2 \
> > > -j ACCEPT
> > >
> > > iptables: No chain/target/match by that name
> >
> > I guess this means that your kernel lacks support for the iprange
> > target. "CONFIG_IP_NF_MATCH_IPRANGE=3Dm"
> >
> > This is at most a minor inconvenience. You can always use CIDR
> > addressing and multiple rules. (I always try to keep logical breaks
> > in network space on CIDR boundaries, to facilitate this.)

On Tuesday 2005-October-11 14:39, Jorge I. Davila L. wrote:
> I need the iprange working because I don't want use a large set of
> rules.

Are you not familiar with CIDR addressing?

The example you posted would only be two rules for individual IP's. I=20
understand, that was only an example, but creative use of CIDR can do=20
the job quite well. You can jump a CIDR block larger than your iprange=20
to a special chain, and put exception rules with -j RETURN targets at=20
the top.

And again, in designing your networks, it helps to think in hexadecimal=20
terms. In a class C (/24) I often use 128-191 as the DHCP range. That=20
would be x.x.x.128/26 in CIDR. I try to keep static IP ranges in blocks=20
of 8, 16 or 32 and grouped by purpose.

There's nothing wrong with -m iprange; it's a fine tool.  But I get=20
along quite well without it.
=2D-=20
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

