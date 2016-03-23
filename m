From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: Re: Packets (sometimes) not marked as RELATED/ESTABLISHED
Date: Wed, 23 Mar 2016 17:00:57 -0400
Message-ID: <20160323170057.2f69489c@playground>
References: <20160322185530.GA3152@anthem.async.com.br>
	<ncus81$i6b$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 MAIL1.WPI.EDU u2NL149m004767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wpi.edu; s=_dkim;
	t=1458766864; i=@wpi.edu;
	bh=u/pdlVfRVacD5wp6TJXvNFSvYnpc0czgx+qjFVYoqz4=;
	h=Date:From:To:Subject:In-Reply-To:References;
	b=TyrwcuISvUPEg1XY6TymbDsf2J95kO+rfVrpsjkoj2ygziCojUpMPAdU9P7KXvazV
	 R1wY+ZDvMKSNrCB47R/tuPeCSSYNWv0vWoTDMsUfRZwaTVPpAX1d6ET232mSNLZAiT
	 rDtptXEntbRlkxGg2m2duHPYRitw5V7u8WIEuAfI=
In-Reply-To: <ncus81$i6b$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Wed, 23 Mar 2016 14:53:37 -0500
Robert Nichols <rnicholsNOSPAM@comcast.net> wrote:

> On 03/22/2016 01:55 PM, Christian Robottom Reis wrote:
> > Hello there,
> >
> >      In periodically looking at my firewall logs I've always noticed that
> > from time to time a certain pattern will show up in my logs which
> > indicates that a legitimate stream which should have been marked
> > RELATED/ESTABLISHED isn't. I have the following rules set up to allow
> > related incoming traffic:
> >
> >      -A INPUT -i eth3 -p tcp -m tcp --dport 10000:65535
> >          -m state --state RELATED,ESTABLISHED -j ACCEPT
> >      -A INPUT -i eth3 -p tcp -m tcp --sport 10000:65535
> >          -m state --state RELATED,ESTABLISHED -j ACCEPT
> >
> > AIUI this is what allows the response from a website request to be
> > targeted ACCEPT in the INPUT chain. However, my logs show that sometimes
> > this doesn't work. Here's a recent example:
> >
> >      [89003.161127] IN=eth3 OUT= MAC=XXX SRC=104.73.89.127 DST=XXX
> >      LEN=1472 TOS=0x00 PREC=0x00 TTL=53 ID=10958 DF PROTO=TCP SPT=80
> >      DPT=44709 WINDOW=3775 RES=0x00 ACK URGP=0
> >
> >      [89003.497964] IN=eth3 OUT= MAC=XXX SRC=104.73.89.127 DST=XXX
> >      LEN=1472 TOS=0x00 PREC=0x00 TTL=53 ID=17058 DF PROTO=TCP SPT=80
> >      DPT=44710 WINDOW=3385 RES=0x00 ACK URGP=0
> >
> >      [89049.561143] IN=eth3 OUT= MAC=XXX SRC=104.73.89.127 DST=XXX
> >      LEN=1472 TOS=0x00 PREC=0x00 TTL=53 ID=26347 DF PROTO=TCP SPT=80
> >      DPT=44932 WINDOW=1062 RES=0x00 ACK URGP=0
> 
> I see those too. When I look back at the packet captures for those times
> I never see any other traffic to or from that IP address, so of course
> they don't match the RELATED/ESTABLISHED rule.  Just part of the noise.
> 
> I routinely capture packets passing through my router, filtering out
> ARP noise, Netflix video streaming, Skype calls, and the like.  When
> something unusual happens, it's very useful to see what was going on
> at that time. I keep the most recent ~1 Gigabyte of that in a rotating
> buffer.  In a case like this, I can see what was _not_ going on.

Such packets are often called 'spurious'. They are actually 'INVALID': packets for which netfilter has no clue why they arrived and no clue where to send them; they're obviously for ESTABLISHED conns, but netfilter has no record of them.. There are a lot of INVALID packets that float around. Most (or many) are for conns that have already been reset or closed; some may be DoS or DDoS attacks.

Handle them as early as possible: in mangle:PREROUTING. LOG them if you want. DROP them because they aren't going anywhere anyway. There's no sense in wasting CPU cycles processing INVALID packets. 

Try:
  iptables -t mangle -I 1 PREROUTING -m state --state INVALID \
      -j LOG  --log-prefix "Denied:mangle:INVALID "
  iptables -t mangle -I 2 PREROUTING -m state --state INVALID -j DROP

The log prefix identifies the invalid packets as such in the log file.

N
