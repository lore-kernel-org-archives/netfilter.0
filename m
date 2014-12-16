From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: Bridging / VLANs / ebtables
Date: Tue, 16 Dec 2014 16:34:25 -0500
Message-ID: <20141216213425.GU967@titan.lakedaemon.net>
References: <CAA5aLPhyZnMoMqSYkYA3YHHMs1UX-kLURLZW4UgBHotDVSmCRQ@mail.gmail.com>
 <1414006.345549.1418764533790.JavaMail.root@rockbochs.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lakedaemon.net;
	s=mail; t=1418765665;
	bh=K0v+kSoP9e/Ipx66rB50nqkdDCMdfgA3hJY/QVo7www=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=kpnjRPQPhvbsMg/LAe3MJnhBW0EBEUERjQic6up1Ay43RhKffGRqpxhXcFM2r06DC
	 4BZU0O+c7WB3eJ/P+H8/hx28SKuuJTbqViOZO4OLznLiVG2P/J90z7q/5dR2Mil7Uz
	 qibe6Ue7SI98rpLehIgrD8WYeHTarMy+o5nZK4ZF45B095eJBTZlTHCOscXaZz9u7V
	 Nmfsbda7DSMu3Yd+DSuoEKiBnBXmkoAajJbrpPvDGHs66X8mDLVC+byWtWUryOG0LK
	 mudRPLoGyfNNwEBXCOcMt+jHAvuFS9rqC2YVLYSt8By2+TEWuuN8pAr/R45mpQthOE
	 H5kuYf0lFkSWA==
Content-Disposition: inline
In-Reply-To: <1414006.345549.1418764533790.JavaMail.root@rockbochs.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Nelson <tnelson@rockbochs.com>
Cc: netfilter@vger.kernel.org

On Tue, Dec 16, 2014 at 03:15:33PM -0600, Tim Nelson wrote:
> The use case is a server connected to a switch (provided, not able to
> manage/configure), where it has access to three subnets, delivered via
> ethernet on the link untagged, and tagged in VLANs 2/3. I have a need
> to bridge the untagged parent interface (eth0) and VLAN 3 (eth0.3),
> while leaving the VLAN 2 interface (eth0.2) untouched.

iiuc, you have the following types of packets on eth0:

	x.x.x.x/24
	y.y.y.y/24
	z.z.z.z/24
	vlan2:a.a.a.a/24
	vlan3:b.b.b.b/24

So, you need x.x.x.x/24, y.y.y.y/24, and z.z.z.z/24 to get routed into
vlan3.  Does traffic need to go the other way?  Is there broadcast or
multicast traffic to worry about?

thx,

Jason.
