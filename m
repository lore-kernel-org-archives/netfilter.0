From: Andrew Beverley <andy@andybev.com>
Subject: Re: Quick Fair Queue Scheduler maturity and examples
Date: Tue, 25 Oct 2011 22:02:50 +0100
Message-ID: <1319576570.26402.6522.camel@andybev-desktop>
References: <CAN==1RpL24ma9DfPDQood2MVaZGBiwzbRsyZCNQWv5z7dSmC8w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1319576571;
	bh=WvrMq6zLxnPsLh2d/UvapH3aULX6U3+qNaIlMeNoY98=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=PD/2bGyRna7lHKVIi/T9ZjW672fapM1UBkyBzedEPjezgvY7kNPV0exq1JzCm5NVg
	 mexg8t1cEqr4C6BUJxBWze/xKh4TYz6el8ASUnhodcbJEy0iXfMVanK4k8StklG7hu
	 7Pgubf+OA6leQ4Od8y3b7+AR65FUTCle30XoFp9k=
In-Reply-To: <CAN==1RpL24ma9DfPDQood2MVaZGBiwzbRsyZCNQWv5z7dSmC8w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Karel Rericha <karel@maxtel.cz>
Cc: netfilter@vger.kernel.org

On Mon, 2011-10-24 at 11:58 +0200, Karel Rericha wrote:
> Hi list,
> 
> has anyone some experience about QFQ and its maturity ? I was not able
> to find anything more than patches and papers, real world examples and
> info are nonexistent.

You might be better posting your question to the netdev mailing list
(see http://vger.kernel.org/vger-lists.html#netdev). Strictly speaking
this is the netfilter list and QFQ falls outside of that.

Andy


