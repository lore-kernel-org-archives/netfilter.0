From: Andrew Beverley <andy@andybev.com>
Subject: Re: Question about xt_ipp2p module
Date: Wed, 27 Mar 2013 17:56:54 +0000
Message-ID: <1364407014.1819.27.camel@andrew-desktop>
References: <5151FCD4.8020901@stidia.com>
	 <1364333332.1819.5.camel@andrew-desktop> <5152B9AE.4020901@stidia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5152B9AE.4020901@stidia.com>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1364407021;
	bh=smriRtdwtfMw0MfDOlaogEfocDfGAovQuKSMbbgE/8g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=U58+3oeZIH51D9b7Kb7/oRr9KNTkFrhKHqETYJozLmIACowWlS3CTZ1nt5VytFrdV
	 vHlMS3gO9pMxKdTKLGhYdpfhuLtaags2EOa1IXKbaXsysdgdxEEflEOMBRG1PR4Pe8
	 UmLIO+Zx5EjBtcDOL69BBIOq2qbjuRks9Z52ka6s=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: dmitry.korzhevin@stidia.com
Cc: netfilter@vger.kernel.org

On Wed, 2013-03-27 at 11:19 +0200, Dmitry Korzhevin wrote:
> 26.03.2013 23:28, Andrew Beverley =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tue, 2013-03-26 at 21:53 +0200, Dmitry Korzhevin wrote:
> >> Hi,
> >>
> >> I'm using Debian 6.0.7 x86_64. I have installed xtables with xt_ip=
p2p
> >> and seems i did something wrong, because my rules doesn't drop
> >> bittorrent traffic.
> >
> > My gut instinct is it's not working because ipp2p is old software a=
nd
> > may not match the bittorrent stream that you are using.
> >
> >> 1       33  2970 ACCEPT     all  --  eth0   *       10.2.0.2
> >>    0.0.0.0/0           policy match dir in pol ipsec reqid 116 pro=
to 50
> >> 2       26 10983 ACCEPT     all  --  *      eth0    0.0.0.0/0
> >>    10.2.0.2            policy match dir out pol ipsec reqid 116 pr=
oto 50
> >> 3        0     0 DROP       all  --  *      *       0.0.0.0/0
> >>    0.0.0.0/0           ipp2p --bit
> >
> > Nonetheless, given that the default policy is ACCEPT, why not just
> > delete rules 1 and 2 to check whether that is the problem?
> >
> > Are you forwarding the bittorrent traffic to another machine or
> > downloading it locally? I see that you are using rules in both the =
INPUT
> > and FORWARD chains.
>
> Thank you for answer! But, i'm testing this netfilter module accordin=
g=20
> various internet howtos, where people claim that this  module can blo=
ck=20
> bittorrent traffic.

Yes, but that doesn't mean that it is guaranteed to match every
bittorrent implementation.

An alternative way of matching bittorrent traffic is to use the
connlimit module to look for lots of connections from a client above
ports 1024. This is pretty brutal and prone to false-positives, but it
may work for you. There is an example here:

http://andybev.com/index.php/Fair_traffic_shaping_an_ADSL_line_for_a_lo=
cal_network_using_Linux

BTW: Please don't top-post.

Andy



