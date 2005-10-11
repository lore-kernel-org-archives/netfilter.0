From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: iprange match
Date: Tue, 11 Oct 2005 13:51:51 -0500
Message-ID: <200510111351.51801.rob0@gmx.co.uk>
References: <1129043668.2415.12.camel@vyatka-39.cablenet.com.ni>
	<434C0DED.8060203@supportivo.org>
	<1129055791.2415.79.camel@vyatka-39.cablenet.com.ni>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1129055791.2415.79.camel@vyatka-39.cablenet.com.ni>
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

Please don't top-post your replies. It makes it very difficult to=20
follow, especially since the post you're replying to has not (yet?)=20
reached the list.

> > Jorge I. Davila L. wrote:
> > >I'm trying to use the iprange match, but every time when I want
> > > apply a rule I receives:
> > >
> > >iptables: No chain/target/match by that name
> > >
> > >I'm using a 2.4.30 kernel in a xen domainU

"xen domainU" is not familiar to me.

> > >The iptables that I'm using is 1.3.3
> > >
> > >The rule that I'm testing is:
> > >
> > >iptables -A OUTPUT -p tcp -m iprange --src-range
> > >192.168.223.1-192.168.223.2
> > >
> El mar, 11-10-2005 a las 22:09 +0300, Daniel Ivanov escribi=F3:
> > Well, you should try applying a target to that rule , try -j ACCEPT
> > or -j DROP

And no, this is not important. You can have rules without targets.

On Tuesday 2005-October-11 13:36, Jorge I. Davila L. wrote:
> well .. the complete rule:
>
> iptables -A OUTPUT -p tcp -m iprange \
> --src-range 192.168.223.1-192.168.223.2 \
> -j ACCEPT
>
> iptables: No chain/target/match by that name

I guess this means that your kernel lacks support for the iprange=20
target. "CONFIG_IP_NF_MATCH_IPRANGE=3Dm"

This is at most a minor inconvenience. You can always use CIDR=20
addressing and multiple rules. (I always try to keep logical breaks in=20
network space on CIDR boundaries, to facilitate this.)
=2D-=20
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

