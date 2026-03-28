Received: from smtp-1908.mail.infomaniak.ch (smtp-1908.mail.infomaniak.ch [185.125.25.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81DF17D6
	for <netfilter@vger.kernel.org>; Sat, 28 Mar 2026 00:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774659585; cv=none; b=GJ8LCE9xuXBU7FY4bJA2MdqPP2CAoSOgqotKBaepFlbdwCz2WqsYNCfjMil2BBqwmQIdKKfLrU64jy4kCqbPJssEUcDaGXx/rHqeMd7zsevIyC8Qp1Om3Tfg29bfqvw+yIolK+Z52I8y7iDbP0T8kDGcvPFS9R/6KCDETZ6Hzog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774659585; c=relaxed/simple;
	bh=fsqY4EypV8jBl9Q2UW9yX2c4Hfwk06WHYYJH6T6c3Wo=;
	h=Subject:Message-ID:Date:From:To:MIME-Version:Content-Type; b=SWoSPSzGUSBNiuMPG1eC6gCRNulGbB/8IFGikw3QToiXlLu3N1TjUIRE063U8++twIYU2KYQ5YSxqLL27duqGT3Qe5RU6b37t8fHpBYA32P6+ZYrApA/fHw95qGwrK3AxnV1+609W/uObEo0WAfJhPW4/AwQ6GBcS7VB+3f/ZH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ik.me; spf=pass smtp.mailfrom=ik.me; dkim=pass (1024-bit key) header.d=ik.me header.i=@ik.me header.b=nszV6fKY; arc=none smtp.client-ip=185.125.25.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ik.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ik.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ik.me header.i=@ik.me header.b="nszV6fKY"
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fjJDG6khCzGTF
	for <netfilter@vger.kernel.org>; Sat, 28 Mar 2026 01:24:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ik.me; s=20200325;
	t=1774657470; bh=fsqY4EypV8jBl9Q2UW9yX2c4Hfwk06WHYYJH6T6c3Wo=;
	h=Subject:Date:From:To:Reply-To:From;
	b=nszV6fKYVbqbrxBuHbLtf0uO6eD1OLB6ykpUyZW90bbXOoVSPTD+9B3/hkVMSTVb3
	 kIUt5LPAyNRnwhEDTNLWUFLmsuq6wE8jUMaYQ72poRLS6O0NRedml0njCFqu/9zKWR
	 wEXvyPpa3gCtq6p8CNVgoWGJIT9A8PEqlsU2JpxI=
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4fjJDG4BZKz9sX
	for <netfilter@vger.kernel.org>; Sat, 28 Mar 2026 01:24:30 +0100 (CET)
Subject: Assistance requested: nftables rate-limiting/logging failure
 (v1.1.6)
Message-ID: <94564361-e61e-4d31-89a2-fc72bba9ec41@mail.infomaniak.com>
Date: Sat, 28 Mar 2026 01:24:30 +0100
From: Dae Euhwa <daedaevibin@ik.me>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Reply-To: Dae Euhwa <daedaevibin@ik.me>
X-WS-Location: eJxzKUpMKykGAAfpAmU-
X-Mailer: Infomaniak Workspace (1.3.1187)
X-WS-User-Origin: eyJpdiI6InI0Rjc0b2I2Q0oxQ0ZzTzZKU1VHdUE9PSIsInZhbHVlIjoiUHRBeEcvaTVuNWpLaWd3b29LRko0Zz09IiwibWFjIjoiNzhhNjU1MDc4ODliOWYwYjYzNDU2NTIxMzg4MDQ0ZWZlNzEzMTY1NjBjNDk2NTcyYTE3OTFiY2EyMTM3NDEzMCIsInRhZyI6IiJ9
X-WS-User-Mbox: eyJpdiI6IkkrWmdaZkRHcTYxSTVQUTgvdWZMbVE9PSIsInZhbHVlIjoiQy9FZjJYZUVaOW12Vk1jdDNiV2JQQT09IiwibWFjIjoiNDJhMjM3NGYxNjUzY2YzOGQ2YWM2OGFkOWUwNjY4YTBiMzQyZDExMWRkMjdkMmVlYjQ3YzY5MTU2OThkMmNmNCIsInRhZyI6IiJ9
X-WS-LOCALE: en_GB
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary=b-Et2lz7
Feedback-ID: :cb99685c93c6ab8:ham:a18ba31e3976e9d
X-Infomaniak-Routing: alpha

--b-Et2lz7
Content-Type: multipart/alternative; boundary=bRXiF_Dk

--bRXiF_Dk
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

My=C2=A0name=C2=A0is=C2=A0Dae=C2=A0Euhwa.=C2=A0I=C2=A0am=C2=
=A0relatively=C2=A0new=C2=A0to=C2=A0nftables=C2=A0and=C2=A0am=C2=A0having=
=C2=A0trouble=C2=A0replicating=C2=A0a=C2=A0previously=C2=A0functional=C2=
=A0configuration.

I=C2=A0am=C2=A0currently=C2=A0facing=C2=A0a=C2=A0sit=
uation=C2=A0where=C2=A0my=C2=A0rate-limiting=C2=A0logic=C2=A0is=C2=A0not=
=C2=A0triggering=C2=A0as=C2=A0expected;=C2=A0specifically,=C2=A0I=C2=A0am=
=C2=A0seeing=C2=A0no=C2=A0NFT_BAN=C2=A0logs=C2=A0despite=C2=A0high-volume=
=C2=A0traffic=C2=A0(verified=C2=A0via=C2=A0tcpdump).=C2=A0I=C2=A0suspect=
=C2=A0a=C2=A0rule=C2=A0precedence=C2=A0or=C2=A0logical=C2=A0error=C2=A0in=
=C2=A0my=C2=A0chain=C2=A0ordering=C2=A0is=C2=A0causing=C2=A0packets=C2=
=A0to=C2=A0be=C2=A0accepted=C2=A0before=C2=A0they=C2=A0hit=C2=A0the=C2=
=A0meter.

Environment=C2=A0Details:
*=C2=A0Version:=C2=A01.1.6=C2=
=A0(Commodore=C2=A0Bullmoose=C2=A0#7)
*=C2=A0Goal:=C2=A0Implement=C2=
=A0a=C2=A0penalty=C2=A0box=C2=A0via=C2=A0meters=C2=A0and=C2=A0sets=C2=A0for=
=C2=A0high-volume=C2=A0floods.

I=C2=A0have=C2=A0attached=C2=A0my=C2=
=A0current=C2=A0config=C2=A0file=C2=A0for=C2=A0review.=C2=A0Any=C2=A0insigh=
t=C2=A0into=C2=A0why=C2=A0the=C2=A0meter/log=C2=A0actions=C2=A0are=C2=A0bei=
ng=C2=A0bypassed=C2=A0would=C2=A0be=C2=A0greatly=C2=A0appreciated.

Tha=
nk=C2=A0you=C2=A0for=C2=A0your=C2=A0time=C2=A0and=C2=A0assistance.=C2=A0I=
=C2=A0look=C2=A0forward=C2=A0to=C2=A0your=C2=A0response.

Best=C2=A0reg=
ards,
Dae=C2=A0Euhwa


--bRXiF_Dk
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"font-family: 'Helvetica Neue', Helvetica, Arial, =
sans-serif; font-size: 14px"><div class=3D"formatted-code-block-internal-co=
ntainer ng-tns-c3776750516-138"><div class=3D"animated-opacity ng-tns-c3776=
750516-138"><pre class=3D"ng-tns-c3776750516-138"><code class=3D"code-conta=
iner formatted ng-tns-c3776750516-138" data-test-id=3D"code-content" role=
=3D"text">Hello,

My name is Dae Euhwa. I am relatively new to nftables and am having trouble=
 replicating a previously functional configuration.

I am currently facing a situation where my rate-limiting logic is not trigg=
ering as expected; specifically, I am seeing no NFT<span class=3D"hljs-emph=
asis">_BAN logs despite high-volume traffic (verified via tcpdump). I suspe=
ct a rule precedence or logical error in my chain ordering is causing packe=
ts to be accepted before they hit the meter.

Environment Details:
* Version: 1.1.6 (Commodore Bullmoose #7)
* Goal: Implement a penalty box via meters and sets for high-volume floods.

I have attached my current config file for review. Any insight into why the=
 meter/log actions are being bypassed would be greatly appreciated.

Thank you for your time and assistance. I look forward to your response.

Best regards,
Dae Euhwa</span></code><br></pre></div></div></div></body></html>
--bRXiF_Dk--

--b-Et2lz7
X-WS-Attachment-UUID: 5b40b78c-086b-4a4e-a8f5-979865f53cbb
Content-Type: application/octet-stream; name=nftables.conf
Content-Transfer-Encoding: base64
Content-Disposition: attachment; name=nftables.conf; filename=nftables.conf

IyEvdXNyL3NiaW4vbmZ0IC1mCmZsdXNoIHJ1bGVzZXQKCmluY2x1ZGUgIi9ldGMvbmZ0YWJsZXMu
ZC9jb3VudHJ5X2Jsb2Nrcy5uZnQiCgp0YWJsZSBpbmV0IGZpbHRlciB7CiAgICBjaGFpbiBpbnB1
dCB7CiAgICAgICAgdHlwZSBmaWx0ZXIgaG9vayBpbnB1dCBwcmlvcml0eSAwOyBwb2xpY3kgZHJv
cDsKCiAgICAgICAgIyBFc3NlbnRpYWw6IExvb3BiYWNrCiAgICAgICAgaWlmIGxvIGFjY2VwdAog
ICAgICAgIAogICAgICAgICMgRXNzZW50aWFsOiBFc3RhYmxpc2hlZC9yZWxhdGVkIChieXBhc3Mg
cmF0ZSBsaW1pdHMgZm9yIGFjdGl2ZSBjb25uZWN0aW9ucykKICAgICAgICBjdCBzdGF0ZSBlc3Rh
Ymxpc2hlZCxyZWxhdGVkIGFjY2VwdAogICAgICAgIAogICAgICAgICMgRXNzZW50aWFsOiBJQ01Q
CiAgICAgICAgaXAgcHJvdG9jb2wgaWNtcCBhY2NlcHQKICAgICAgICBpcDYgbmV4dGhkciBpY21w
djYgYWNjZXB0CiAgICAgICAgCiAgICAgICAgIyBUcnVzdGVkIExBTiAoYnlwYXNzIHJhdGUgbGlt
aXRzIGZvciB5b3VyIG5ldHdvcmspCiAgICAgICAgaXAgc2FkZHIgMTkyLjE2OC4xLjAvMjQgYWNj
ZXB0CiAgICAgICAgCiAgICAgICAgIyBESENQIHJlc3BvbnNlcwogICAgICAgIHVkcCBzcG9ydCA2
NyB1ZHAgZHBvcnQgNjggYWNjZXB0CiAgICAgICAgCiAgICAgICAgIyA9PT0gUmF0ZSBsaW1pdGlu
ZyBNVVNUIGNvbWUgYmVmb3JlIHNlcnZpY2UgYWNjZXB0cyA9PT0KICAgICAgICAjIEdsb2JhbDog
MTAwMC9taW4gcGVyIElQIChsb2cgdGhlbiBkcm9wKQogICAgICAgIG1ldGVyIGdsb2JhbF9saW1p
dCB7IGlwIHNhZGRyIGxpbWl0IHJhdGUgb3ZlciAxMDAwL21pbnV0ZSBidXJzdCAyMDAgcGFja2V0
cyB9IGxvZyBwcmVmaXggIk5GVF9CQU46ICIgZHJvcAogICAgICAgIAogICAgICAgICMgQ291bnRy
eSBibG9ja3MgKHNpbGVudCBkcm9wIGFmdGVyIHJhdGUgbGltaXQgY2hlY2spCiAgICAgICAgaXAg
c2FkZHIgQGNvdW50cnlfYmxvY2tzIGRyb3AKICAgICAgICAKICAgICAgICAjIFNlcnZpY2VzIChv
bmx5IHJlYWNoYWJsZSBpZiBub3QgcmF0ZSBsaW1pdGVkKQogICAgICAgIHRjcCBkcG9ydCB7IDIy
LCA1MywgODAsIDQ0MywgNzc0MiwgODUzIH0gYWNjZXB0CiAgICAgICAgdWRwIGRwb3J0IHsgNTMs
IDEyMywgODUzLCAxOTEzMiB9IGFjY2VwdAogICAgfQogICAgCiAgICBjaGFpbiBmb3J3YXJkIHsg
dHlwZSBmaWx0ZXIgaG9vayBmb3J3YXJkIHByaW9yaXR5IDA7IHBvbGljeSBkcm9wOyB9CiAgICBj
aGFpbiBvdXRwdXQgeyB0eXBlIGZpbHRlciBob29rIG91dHB1dCBwcmlvcml0eSAwOyBwb2xpY3kg
YWNjZXB0OyB9Cn0K
--b-Et2lz7--

