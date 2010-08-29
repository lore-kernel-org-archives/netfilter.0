From: Xavier Roche <roche*lkml@httrack.com>
Subject: Re: Need for a specific source address selection rule ? (not neccessarily
 netfilter)
Date: Sun, 29 Aug 2010 16:22:09 +0200
Message-ID: <4C7A6D11.8090306@httrack.com>
References: <4C7A3B14.9010805@httrack.com> <alpine.LNX.2.01.1008291355300.4946@obet.zrqbmnf.qr> <4C7A57D1.8070702@httrack.com> <alpine.LNX.2.01.1008291537460.8007@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=httrack.com; s=mail;
	t=1283091739; bh=qqeeqRLGNr9mTSuDCiiF6miYM+1sj9ITKMj88JxoOXA=;
	h=Message-ID:Date:From:MIME-Version:To:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=imjNEbluQkDtoQDuJRWaLztPTetCJ9JWTzRwEXlAvhVCt/GksSfx/5rVut9mThLES
	 dHQMz4iyh1IMpMlrOnjQ1tw9Tn3HftiNb1Q2TgU/EJnPu30Uf7hTlujyOwp1tnjnHi
	 z7I6bTtO8H7CuhczjQs9Ta/v9H0v8eSm1wpqOc+4=
In-Reply-To: <alpine.LNX.2.01.1008291537460.8007@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Jan Engelhardt a =C3=A9crit :
> ip route add $(address of google.com) src $(my alternate address)
> should do it. IPsec already does so if I am not mistaken.

Note: it does not appear to work (unless my fingers did something=20
wrong), for multiple addresses within an interface. The selected source=
=20
address is still the same. I suspect the only thing you can change is=20
the outgoing interface ; source address selection logic then remains th=
e=20
same.
