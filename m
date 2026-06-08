Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F89332EDE
	for <netfilter@vger.kernel.org>; Mon,  8 Jun 2026 17:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780938669; cv=none; b=rSObQ7txmQPRiSs/rmIL3lMD1KjbZdaiC0ltIlQVqXrZ7ZBmXiztAXy+mLCM0rLFSMqaSzveU+PVh8ZU8PM1GuObH6rEP2ff2onfqkCdzYK7iMEObq+yiIl5jeGWBnMdpyr4EFahyHD7aGDL7gBCi2NUHkVwxCAoL/GEJ6wVg5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780938669; c=relaxed/simple;
	bh=Fya1WI2v2CBU03+NTvjqn9ORjxOhFw3F9JXkcbGvVnc=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=WKlyS5i7wnxbOO6rBPQigj7t0Tcoh4bQDE98+AJT6z7FUuq4VraZW7Z4M9ZOVp54+L5MLifWGtC/I4cuC5wO6QiGir+CelLQWXCN1tvi9F3vpLa/tlG32HJA3dr9YBVWC/kM6NPjcMNh8U+cJpPag0Hj+vbU4unfxta3h850qVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=TXdtYgNu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=L+fCxwsB; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="TXdtYgNu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="L+fCxwsB"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id AE22AEC0141;
	Mon,  8 Jun 2026 13:11:07 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-01.internal (MEProxy); Mon, 08 Jun 2026 13:11:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1780938667;
	 x=1781025067; bh=Fya1WI2v2CBU03+NTvjqn9ORjxOhFw3F9JXkcbGvVnc=; b=
	TXdtYgNuZrJJhwjlFmaLb0H/b0zHiTGiGT4ti7GgsCOF/Af5iqNG2Ow2LNYcGeRc
	QixmYqH5YiMnZG9bjZ8HJXk0Z+/EAPd4aCNXge49wakqntKJa1qcf+k5ld36mLew
	LrW9YKj2LrSwfpqx/aev3VZxxgEMpOR25Tl84xxljWnWLTWVu1adlpQ7xYnqEEBk
	zmOujy6BdRy7ZhjI9GNGpFvWtLcvITTECOyvJfQrQ/ySuJewK/Vc1Ot4xSzpIvVV
	v0XSgT6iLffh2542sKVW5hZFN1P9QeGov78DDPbphwlyeYmKjpQ+t126k/JnrzXj
	TzKdcR+kgaMGvBWb5t4rkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1780938667; x=1781025067; bh=F
	ya1WI2v2CBU03+NTvjqn9ORjxOhFw3F9JXkcbGvVnc=; b=L+fCxwsB1HTzFacUu
	ZOzygiofRWsCl/d5+r4GVb22rp9quhH/OApjNsbWk9vYRj8eMj+0lZkh7WawXm7w
	6q+w/Gdcik5tnsa1DLFO+rfwes+dRSd5sHtFYQe2X/zd/aGuN69ygiHZ1J2w1phX
	STzuZ9r+B3yVdtPcYu2jhVNNKi2ZCe0YsVd4J/ln184skN0SNn8o99zIsynR29ZG
	0pp5wPERbJvmu3qfgoVg6NLE9egJKdzA0u8vUsFhsSmHTh4I2J6FB1WIMt9fX00U
	l246dsyFVov7bEtT5J8OUvLpw6MFiJdSPqVLiypfubCuMyxCZTEYCR6z9J86lT0C
	Y7HJw==
X-ME-Sender: <xms:q_cmasIeYZIUY-kR3EbQ547QTOygDj7Cl0qBccReH-oUkxeeTwUxQg>
    <xme:q_cmam84Ywd4hFU8OujqkhsE04zt-hfl2gh78oEesRylIJFmV-vJ99mBLtW7DDlwN
    jBQRvphJYF8nUo6vtsg6Rutt1OMQpTsekcMbaJpX72SUImKKno>
X-ME-Proxy-Cause: dmFkZTEh87III1IMLHddXaiAB+fF0rtYyLzIDED3JUGjMJU7xftRoLWyv3kc4NLZTGA1es
    p88Y5J9wmI/atlQMUVILzQRkJ7LalZ5GMdQuOm2HcSeohdbefx4NOh5dvvoxq3HHX2Yv+j
    zVJ+sPIdl+n+0OACXKCmeHmDWr1BchKI/GJIu2YJng/C55U/xO2aGCj9i4mZJO7/SFVi0G
    M53nWXc8Ka1PYRivrMOam2NgOGrj3A5taPvRQZhn6M+CIpOpmgN65FEXasQMyPjv/DCpSf
    c3ZYea+s/5HUz8a91oKFEhfHeLhPUU+z8x7ILVo4NS3IpwxDH1eunrPLysE0cMsbeqRTBy
    zoZVcJxEuiFj82lsMVV7MB2/vdVmJw9QU47MFtn5OHaEeZ4LdWAamcWWy/Th+go/TwlWfM
    BSpJeaM+HXsVRziyvy//la5yMR8ZhvhlMWww1kpbh9RqP4v57trkPVbD1KH9B2zfSt50r6
    ttV+iTG5iwnFKnAQCdzG+qw5VrsSfhzb0PpZBZ95/QRYqXeiBdl/MJrJJFP+bu+4MX63CJ
    qPJLwVv56cdxRkaktAyfMBp0ShA16e6w7UYX/bccVPHL+NFTJa+Yvnm+GuHvIX8sTFgfy/
    n/lzLEdsvGOR1mjnNEuJhCAIVdsO30bklgEunuSOxK6w6avhbVp5eiI9aDkw
X-ME-Proxy: <xmx:q_cmakxll0KwVW12E7eiIiHvfXW5fjeRfCXP1EHBtl55PQsmgJJ52g>
    <xmx:q_cmamF3qIJ1Bwpkxj6XBLkYFq5sY8zSeiJQnsJHPyHhdIv4BB8-1Q>
    <xmx:q_cmagwwqdVh-4rK5OtkqRNTU0eQY0ep6LeF2GzR8hcNSZoRgbt39w>
    <xmx:q_cmavuK2vvqUPHqWrXuJhxI4wir6JhMRn8-C-xwApDIzDbVcEDjdA>
    <xmx:q_cmai3b4ze05tO3YbPs8-W1Urci1KFRWs_xsOA-sKzRNpWYAU4SJw-6>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 632B2216008A; Mon,  8 Jun 2026 13:11:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ABFZICgcHfNg
Date: Mon, 08 Jun 2026 18:10:47 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "Reindl Harald" <h.reindl@thelounge.net>,
 "Andre Rodier" <andre@rodier.me>, Slavko <linux@slavino.sk>,
 netfilter@vger.kernel.org
Message-Id: <a88917c8-33f6-41ea-84aa-8afee2eadc24@app.fastmail.com>
In-Reply-To: <1bdfe5c3-f889-4464-a28e-9533e209371c@thelounge.net>
References: <DJ3MTZXMKPIT.1A41M4YZMF8UY@rodier.me>
 <8d84a240-b9ae-41f4-b111-33007909b0a2@app.fastmail.com>
 <74E543AC-1B65-4E99-8324-B5758DCBA669@slavino.sk>
 <e8e26118c36111d0b4aa290e1e411ff15b6f64aa.camel@rodier.me>
 <1bdfe5c3-f889-4464-a28e-9533e209371c@thelounge.net>
Subject: Re: Question on rate limiting on nftables
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, 8 Jun 2026, at 5:05 PM, Reindl Harald wrote:
> Am 08.06.26 um 17:01 schrieb Andre Rodier:
>> On Mon, 2026-06-08 at 14:32 +0000, Slavko wrote:
>>> D=C5=88a 8. j=C3=BAna 2026 12:45:55 UTC pou=C5=BE=C3=ADvate=C4=BE Ke=
rin Millar
>>> <kfm@plushkava.net> nap=C3=ADsal:
>>>
>>>> If the problem can be characterised as "I endure too much log noise
>>>> from sshd and I find it annoying" then perhaps configure sshd(8) to
>>>> additionally bind to some other random port than 22 and expose only
>>>> that port.
>>>
>>> Not worth of change ports, soon or latter it will be found
>>> and abused as default port.
>>=20
>> There is a big advantage on changing the port number, though. It is
>> reducing the noise considerably. Also, a connection attempts on a
>> different port should immediately raise attention, as it is involving
>> more than a basic SSH scan bot
>
> and in fact you can have a few ports before as trigger to put the IP o=
n=20
> a drop-list for a few minutes which isn't possible when you host ftp s=
ervers

Indeed. I have implemented a fairly aggressive anti-scanning methodology=
 in nftables on that basis, with only a handful of services exempted (th=
ose that absolutely must remain open to the Internet at large, come what=
 may).

--=20
Kerin Millar
