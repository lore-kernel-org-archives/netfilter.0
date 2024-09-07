Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B1542A9D
	for <netfilter@vger.kernel.org>; Sat,  7 Sep 2024 06:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725690185; cv=none; b=Z85gpkyeUuR8mc3q0L7SFNJArtCULgVtuVjnY+1lhAdWCqMnS54C+uvxo15lAwhvrrmh6ZU8KKkArU23ifGVwtpFAtfOdoS/UwEXrlhUBvvONdKqaZkA0TXV1/KR1KNtVwauRgljuOsobDkpquaVg9pUi84MH+sBv8ptsnggpzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725690185; c=relaxed/simple;
	bh=Of/QV0WQq/tjvcYWs+arn5VIBKZ3wQ6gpLP5YZXu1I8=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=fZ2kLI2dhmLw4dAJc6+9Yl1eQUVOR4zYdchE4Dhwks8Ht0K0I8W6v9zhPdq+HHlVYeqXQG6mjbjueIn4yZa+XO+tkQmdWYhpdtapuXUy0kQz4lnZeVTx9A/XLsbWpu7QT5m/pM9uMALXyd3OySOIpD0wxZGUeReaPPYhgNsaB6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com; spf=pass smtp.mailfrom=gmx.com; dkim=pass (2048-bit key) header.d=gmx.com header.i=lars.nooden@gmx.com header.b=Fis1HCEt; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.com header.i=lars.nooden@gmx.com header.b="Fis1HCEt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
	s=s31663417; t=1725690181; x=1726294981; i=lars.nooden@gmx.com;
	bh=1Wwa1kjAH3DA8LYJ/hDQWHxrSFrrovvr4rI0HFCxT3A=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:From:Subject:
	 Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Fis1HCEtL9f12Qn3LugnLTiJagOq3Rmbq0fo918HNLhJ3/Kll4DglPk0fHIS2tg5
	 L2w4mLTz5Y9pi9HeTPW/kXal5kYr8y7d9Db2te7Ik3Ta37U2CD2kYtOFfu4J0PnOd
	 7swfl2h1mud8gwkZvcB/stUhBaN0bMEIUVnxIobM6Lj9EQHm+Jjqq4teNRQ02Dmdj
	 8vEsrA2M60SUbk/qxd47Z+YOKvJosnAlgOeTWPKtjwys/nHEhhOKL0dCFfBRB8kKv
	 dOdTrhVyhNBWsDR8JxgnsP4qCQW02GfEnDu82Cp/Cm9UL92+onpN4XZCzMovdWK03
	 oUYvVhWhVHaWWqTKwQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.11.9.65] ([80.220.100.104]) by mail.gmx.net (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MdvmO-1sE2ap04pS-00pLte for
 <netfilter@vger.kernel.org>; Sat, 07 Sep 2024 08:23:01 +0200
Message-ID: <3235fb97-5759-4250-9129-ba8006ffd53d@gmx.com>
Date: Sat, 7 Sep 2024 09:23:00 +0300
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Netfilter Users List <netfilter@vger.kernel.org>
From: =?UTF-8?Q?Lars_Nood=C3=A9n?= <lars.nooden@gmx.com>
Subject: Wiki entry on Element timeouts in NFtables
Autocrypt: addr=lars.nooden@gmx.com; keydata=
 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 2w==
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HezEdGLD/QSWcIc/IWBXrNSkig7gZYKe3iHsz6+siDYw4mTbgeE
 Q4U5WRFhSENYgWgcNNlx1rt0gLkm596Vz6JS2RBUrc+IdAbaKlF+OEGLdtjFfRLjdsJ6dfE
 uPOgcjx6XkErn++s+hqsveWF1BSBif8gy2tqG067rQmt/i8y/EIdR9aB5WWw9VugTaaszuO
 j1X00lDURSXpKcCcuOd6g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:d5WPp1dF2aU=;SMQszGmjRvG4t7MB7UDnAcQ5B28
 l00XVp6KSMo+SVoHEnygGDuG4u4gVf8pR9R2CHQQEofo4zW0TdUKmnm2j1wwHeQadGjjKJ09g
 3L2vzbEeC/kzEoqreHI3O7Z3LLL22BaEAOTDCI8Ig8HjDP/q8Oy3y1Slg8C4WZ5bxCj98cbTy
 RdL4oEJURipaKrYIiOlrqdOU1r43+NsnCn2CwMAcp8VABG++SB7CXipVt9T/6cLLMbFzieE90
 ix8+APM2bJO9AOA2QTYeKYXzsJHrtdKwjRPahGQUWiw78eOtbge266yTrD3oHmYkNZO3WP2+g
 LvO52USRGT5VpBhQF0AnhwghMUNCgO5wwi6s5q77roQg94LHlBHaCRHUTVXfsN388JX4HUXc6
 Zs/8WoAWAqMCrpbnevpyc/M6UVyhciw+qbmvJqNmFlSQOH9l6S8G73g35+p2vKdA+CdBWI7Mg
 rWBxR/OXUTbMEzrpXO6eGVHlUs9aRJsTnElPuo1rITJm6WbgWM6+pE3SWbjTpdd4g1Up4LeDb
 JCoEzf0xYTGtke7giIdSH5fx748/GTPcXqbykWcJ1bSrecomIWTktcaHlRAjtp3iO+ysye/Xk
 lFcH7dsf0ozk2z2+rzsaigdnBG6ok9LxjDvgzdCP6XM7ZqnKj9ZB4PVndyFgiH1WeJOrFBvH7
 MK6Eeygt1giSt3Is6BBZfJfDWK/LVekAkrDboiC4JvZyxi7+V39EmQzhIIfVculI78xkacCs7
 h5mC5TXBkSHxvFDVZqH19Ws/oDCx9jWKZsK+cAo+3oS2x9UeqlDX04LJBEjc9GO9yqtntOYWe
 khF/XWI+dRvDfkumy8rlGytg==

I am unclear on the differences between 'timeout' and 'expires' as
described in the Wiki entry=C2=B9 on Element timeouts.

If 'expires' is assigned, but no 'timeout' is given, then what happens?
Will the entry expire regardless of whether additional matching traffic
comes in?  Why do the two examples have 'timeout' with larger values
than the 'expires' in  both?

Thanks,
Lars

=C2=B9 https://wiki.nftables.org/wiki-nftables/index.php/Element_timeouts
