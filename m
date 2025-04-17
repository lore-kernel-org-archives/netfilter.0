Received: from mail-10698.protonmail.ch (mail-10698.protonmail.ch [79.135.106.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470651FBEA2
	for <netfilter@vger.kernel.org>; Thu, 17 Apr 2025 22:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744928482; cv=none; b=KB2itkeMe18ITmZ7i/Pgv8qWs9mPU4Diyk/8CBWDXtzsgMtt49/xHkGnZz47oV5fMjFTgLWjBbB7Bkxx3jxo0kXZJ+9xPz//S8YWepE8ZNETEgn8xuyWqI+g5hcmWF4IjMk36rDHXk0tdSAL2owax5guuzhYePXY/YnL3TDpQDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744928482; c=relaxed/simple;
	bh=0ukSbb20VjFXuT9/p47o99F9kUznvvnQzqtbdyanMSg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PSTnBi1rsp2yO+DUUxERZk/CDSVxFsUQ4uq1R3vP5NDVV9O8QlfDGNiyyPU3AgsfDKrMW7e6nuDU6R9qKmwq3KGCFdwaK2ik3ANs6bfzGryTYlVCdHQLDHfk1l7XKkcYDsAO1A226VWMkOaJtGPZItP/vs/svqkzQEmI4n7yv9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=ZUWsRy7z; arc=none smtp.client-ip=79.135.106.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="ZUWsRy7z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1744928472; x=1745187672;
	bh=PN9lSxIyWxp+87ObMReVI7XUDi+YjThZAqQeLBG7Jfs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=ZUWsRy7z/kvymWo8pt+b3QkYaWTR8RuGySkpHqyqLSSA5sHth+4K7NZvxH7lSLvrH
	 aZqJTRjhSZo9zd3wkXIdSUzB5Z79jsTbmxUkJ5gtZ5/O8EWY51XZsYQQNgGtyGzfFO
	 FxBFPv72rBsiGiEs454tW+Z00d33IU2Rr7jz68Xx6W/tyNM0BTSn4DJJrEHHFybEyJ
	 JAuuesyAHuZ6oYLuO/gSnaZzFktNgHwvjSQ8BJUa4C5Gef55LIDI3oPl8nzRS3Shxn
	 LEo0Iq4LwlB159QcA4LY72iHatkr/U0/DqdJT87Y06kYKbpyrpJJpbXPA1dLIyQN6a
	 69eryH1pWNvDQ==
Date: Thu, 17 Apr 2025 22:21:09 +0000
To: Kevin Vigouroux <ke.vigouroux@laposte.net>
From: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: Can the PCP field be set in the netdev table?
Message-ID: <QeFwNvN8Q3lUul6dSJmJlq8MTp9ifHpuXYYhyra79MKEQf5bxqf8kdBtyvzUFMsJfXBoG3fDo_5Cn0m1DOdhPzyS3x4K46tSPAhcsZuwxVQ=@protonmail.com>
In-Reply-To: <ULYEvwyZR2o5mOmJi1GCdWxJu-bftNMqoV8y_KVt3i9eXaWu7uTOBZk9D2-cXABoNO_SUbnRRKRUj9NyYjHbnO5NfkViqsjUsLBdfbyZc_Q=@protonmail.com>
References: <877c3kvzyk.fsf@laposte.net> <ULYEvwyZR2o5mOmJi1GCdWxJu-bftNMqoV8y_KVt3i9eXaWu7uTOBZk9D2-cXABoNO_SUbnRRKRUj9NyYjHbnO5NfkViqsjUsLBdfbyZc_Q=@protonmail.com>
Feedback-ID: 13811339:user:proton
X-Pm-Message-ID: a57d929c914e2b679f13fa5c6b6e7eb9fdb921d9
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I am only assuming here. I made a mistake, and I should make it clear:

Link Layer header would be:

6 bytes destination (MAC) address,
6 bytes source (MAC) address,
4 bytes likely the 802.1Q Priority tag,
2 bytes are likely the ethertype... and the packet continues after...

> [ payload load 2b @ link header + 12 =3D> reg 1 ]
Means match the first half of the 802.1Q header. This is the TPID or Tag Pr=
otocol Identifier. Consider the IANA registry for IEEE registered ethernet =
protocols here: https://iana.org/assignments/ieee-802-numbers/ieee-802-numb=
ers.xhtml
A value of 0x8100 is the 'Customer VLAN' tag; a standard VLAN tag.

> [ cmp eq reg 1 0x00000081 ]
It appears to compare the 'tag space' to '0x81'; though, it may be 'big byt=
e order, little endian bit order' encoding... I am unsure. If all little en=
dian, the match is wrong, if 'big byte, little bit' endian; the match is co=
rrect.

> [ payload load 1b @ link header + 14 =3D> reg 1 ]
Now, match the Priority Code Point/Drop Eligible Indicator/Virtual LAN ID.

> [ bitwise reg 1 =3D ( reg 1 & 0x0000001f ) ^ 0x000000c0 ]
Considering the input:
> $ sudo nft --debug=3Dnetlink add rule netdev t out vlan pcp set 6 counter
Then the result is:
Source (binary LE):    00000110
AND 31 (low 5 bits):   NNNYYYYY -> retain the value of 6
XOR 192 (high 2 bits): 11000110 -> Decimal value of 198

Instead of matching a priority of 6, it is matching a priority of 198.

sunny
