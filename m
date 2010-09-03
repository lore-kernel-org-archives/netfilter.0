From: Xavier Roche <roche*lkml@httrack.com>
Subject: Re: Need for a specific source address selection rule ? (not neccessarily
 netfilter)
Date: Fri, 03 Sep 2010 19:36:31 +0200
Message-ID: <4C81321F.4010106@httrack.com>
References: <4C7A3B14.9010805@httrack.com> <alpine.LNX.2.01.1008291355300.4946@obet.zrqbmnf.qr> <4C7A57D1.8070702@httrack.com> <alpine.LNX.2.01.1008291537460.8007@obet.zrqbmnf.qr> <4C7A6D11.8090306@httrack.com> <4C7A8040.7040002@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=httrack.com; s=mail;
	t=1283535399; bh=t4jWizf/0LY+vEmAPgxmTAbi2aitATaGU/FAgALfGtw=;
	h=Message-ID:Date:From:MIME-Version:To:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=ZzMrtyA1723sz6DG1Z8GzKtn55TOeutIqq+GiXPQKrHdMvzANdwVyQGFFf/2duCgK
	 WBoKYORrGjXV3lVTejGAI2RsU0Pvr9jQOwa4Lgzu7ZWr41zLHKto2X9BWFd5BjuWyH
	 QBMjnwZN6j1s1lDLLzhU0fR+cl7nlsb0OCn5uWxA=
In-Reply-To: <4C7A8040.7040002@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Pascal Hambourg a =C3=A9crit :
> IME, it works for IPv4 but not for IPv6 ; only IPv4 routes seem to
> support the "src" attribute, and IME src is silently ignored for IPv6
> routes.

The conclusion seems to be "Yes, there is a need for a specific source=20
address selection rule" to decide which IP address should be selected=20
within a single interface, based on arbitrary rules. (especially for IP=
v6)

The question is now: is there a chance such feature could be included=20
one day in the kernel ?
