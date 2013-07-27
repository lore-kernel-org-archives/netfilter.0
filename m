From: Christoph Anton Mitterer 
	<christoph.anton.mitterer@physik.uni-muenchen.de>
Subject: Re: dropping UNTRACKED packets, breaks IPv6 - why?
Date: Sat, 27 Jul 2013 22:53:21 +0200
Message-ID: <1374958401.5194.13.camel@fermat.scientia.net>
References: <1374803962.5489.12.camel@fermat.scientia.net>
	 <51F42451.9010308@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	physik.uni-muenchen.de; h=content-transfer-encoding:x-mailer
	:mime-version:message-id:date:date:organization:content-type
	:content-type:references:in-reply-to:from:from:subject:subject
	:received:received; s=sel-2011; t=1374958403; bh=VEQE541qdsKCgcp
	GLRV/WDjeBsyDZUTH4JINCywRxzM=; b=QqqdijHOhhKLZJTKj4iy+nFFDtF/XDY
	jXiDeZstr0orb5WEC49lPUs6L9H4+Vhr7iwsOpzLfPiEsal6qUydizzVl3CynSwx
	ze2PfAniIILIpId2+v8CCTkP5M4pDh4ky/fk588mgIWOa7V8V66tMHGp3FHv7R/I
	pzm1xeaAih+Y=
In-Reply-To: <51F42451.9010308@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter <netfilter@vger.kernel.org>

Hi Pascal.


On Sat, 2013-07-27 at 21:49 +0200, Pascal Hambourg wrote:
> You should not blindly drop UNTRACKED or INVALID IPv6 packets.
I see,... thanks.
Why not INVALID IPv6 packets? AFAICS, the patch you've mentioned only
removes tracking for these kinds of packets, but doesn't mark them
invalid.


1) So... are there any other reasonable default rules one should make
for IPv6 (or IPv4) then?
I guess the kernel itself already assures that any address of his own
interfaces are not accepted as source address for packages coming over
the wire? I.e. to prevent spoofing of the hosts own addresses.

2) What about INVALID/UNTRACKED with respect to IPv4? Is it there still
advisable to DROP them unconditionally?


Oh and btw: Does the IPsec handling I do still work with IPv6 or has
anything changed there as well?

I.e. the idea is that I jump to the ipsec-only-in/out chain for any
source/destination host with that I want to accept only
incoming/outgoing packages when they're IPsec'ed.
The jump happens of course before the:
-A INPUT        -m state  --state ESTABLISHED,RELATED   -j ACCEPT


Thanks,
Chris.

