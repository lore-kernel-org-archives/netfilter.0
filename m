From: Xavier Roche <roche*lkml@httrack.com>
Subject: Re: Need for a specific source address selection rule ? (not neccessarily
 netfilter)
Date: Sun, 29 Aug 2010 15:51:17 +0200
Message-ID: <4C7A65D5.7090803@httrack.com>
References: <4C7A3B14.9010805@httrack.com> <alpine.LNX.2.01.1008291355300.4946@obet.zrqbmnf.qr> <4C7A57D1.8070702@httrack.com> <alpine.LNX.2.01.1008291537460.8007@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=httrack.com; s=mail;
	t=1283089886; bh=mRRgoGdcw04VyztTD1pNeZ4kZuN9Gr1xjxHOLlCsfHs=;
	h=Message-ID:Date:From:MIME-Version:To:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=Pe6b5cp9AlmRV2iJH5jthQjmG31HkOdLjZwXJjhbjBK1wD2Kk8J+ziY5dsY/TtplS
	 tesWQScbP1XqMlkTYEs/tWkRgW917I2b50jurv+XqNOtZtOhHH3jISDnbN1NMlg3Wu
	 4JuFOFOdMUSkCbis3nAxlMqELjkJPuK8/OGl0jgk=
In-Reply-To: <alpine.LNX.2.01.1008291537460.8007@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Jan Engelhardt a =C3=A9crit :
> ip route add $(address of google.com) src $(my alternate address)

Yes, but not for protocol, owner, and any other rule. This is direct=20
routine from a network to another one.
