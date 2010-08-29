From: Xavier Roche <roche*lkml@httrack.com>
Subject: Re: Need for a specific source address selection rule ? (not neccessarily
 netfilter)
Date: Sun, 29 Aug 2010 14:51:29 +0200
Message-ID: <4C7A57D1.8070702@httrack.com>
References: <4C7A3B14.9010805@httrack.com> <alpine.LNX.2.01.1008291355300.4946@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=httrack.com; s=mail;
	t=1283086298; bh=/P03dSJnxmSYGtpsjKig6QhLfwR0zPAnAzUudEtNDFk=;
	h=Message-ID:Date:From:MIME-Version:To:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=EgPrbxBZgmlEyulg9O3NYPxN1Z4g7t9ZVwfKu2q1K6GOCslGl7zTieycyM3nyX9E1
	 0r6jcSrgNMgCdY0nNMnfIN9b/zZA6ICnrQ4MMNL6Gj0qaMUkOZuqPtHMiWw4O35NyE
	 q/ThaZxUbOj5PGzLQz9iluniJE+OyMVGccOGQd8Y=
In-Reply-To: <alpine.LNX.2.01.1008291355300.4946@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Jan Engelhardt a =C3=A9crit :
> You are confusing incoming with outgoing connections.

Yes, my mistake.

> correct. For the incoming one you bind to [::]:25, for the outgoing
> one you bind to [2a01::desired]:0. Problem solved.

What would happend for v4 destinations ? Both v4/v6 destinations may=20
exist at the same time.

> And somewhere in between is /etc/gai.conf.

Yes, this allows to change the ordering of the rules (RFC 5014 if I am=20
correct), but not to add a specific rule depending on various parameter=
s=20
(destination, owner, etc.) at all.
