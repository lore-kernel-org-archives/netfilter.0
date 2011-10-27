From: Andrew Beverley <andy@andybev.com>
Subject: Re: Quick Fair Queue Scheduler maturity and examples
Date: Thu, 27 Oct 2011 17:47:31 +0100
Message-ID: <1319734051.26402.6937.camel@andybev-desktop>
References: <CAN==1RpL24ma9DfPDQood2MVaZGBiwzbRsyZCNQWv5z7dSmC8w@mail.gmail.com>
	 <1319576570.26402.6522.camel@andybev-desktop>
	 <CAN==1Row9H0DAMCSkhTwT-5E=KpjPmcASz+r9XLztVfvcEZd3w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1319734052;
	bh=XnTsl7O5+hLso0HjrfRA5BXb1RZHrOVzuimqHExsQvI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=t52vd/3ZUnjuTzYNpOnKAU/ncyT2gMvKO8G/DjdFZDc4X9l5LIyRre4JCks/wZ65c
	 06kcS0zA5j6MESOtiBDCIFlZxB7s8/lfWjOYJD/pilRHCire+pxPRFoxf090dsLWG1
	 qDH8vnpasNRlHhfQ+tiqo8kJ1oCqmh+9sC6X27ak=
In-Reply-To: <CAN==1Row9H0DAMCSkhTwT-5E=KpjPmcASz+r9XLztVfvcEZd3w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Karel Rericha <karel@maxtel.cz>
Cc: netfilter@vger.kernel.org

On Thu, 2011-10-27 at 10:41 +0200, Karel Rericha wrote:
> 2011/10/25 Andrew Beverley <andy@andybev.com>:
> > On Mon, 2011-10-24 at 11:58 +0200, Karel Rericha wrote:
> >> Hi list,
> >>
> >> has anyone some experience about QFQ and its maturity ? I was not able
> >> to find anything more than patches and papers, real world examples and
> >> info are nonexistent.
> >
> > You might be better posting your question to the netdev mailing list
> > (see http://vger.kernel.org/vger-lists.html#netdev). Strictly speaking
> > this is the netfilter list and QFQ falls outside of that.
> >
> > Andy
> >
> 
> Well, I am somewhat confused now, because I see that packet schedulers
> (HTB, HFSC) are discussed here,

Strictly speaking this list is just for netfilter related discussions,
which all of the packet schedulers fall outside of. However, since the
demise of the LARTC mailing list, this list tends to get used for other
discussions, as there is a good chance you'll get an answer here anyway.

Andy


