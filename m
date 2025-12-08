Received: from ksmg3.croc.ru (ksmg3.croc.ru [195.38.23.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFCD21CC43
	for <netfilter@vger.kernel.org>; Mon,  8 Dec 2025 12:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.38.23.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765197718; cv=none; b=t5krHN/xa5tqsKpFlQotXJYZxVzOhd0G2a3r20wA7AhlZBumfrzMUz/8iyBESUyE2e5/kocjOhyc4tdPngJrup3dQQPC1mgvU2p8uv4lTDvSJ7pw/kW6NJ8Rep+58OTH64TYvDmFO+35gNEjVqRwXsDlDSN7dBdm1CTxLHj7wNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765197718; c=relaxed/simple;
	bh=McVWicARoGNIm1c9V21xWg/FG7zYxD5MoBJXokFQG00=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=JkG+BNL7Th81tPbnkJMRxgTPBNmSAE11ddZyUycdiSL10m+JfXNYHhedOu2PFKykaO+7KV3Qbv94+3TwwKkpSWSB5UouUr2orXjQy83VJYnscMprrc7jkIAbyZoI7YED7E9oZyQTzjbFLA1CL2I79LBQAhuEFYg8xvAEYFAagXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=k2.cloud; spf=pass smtp.mailfrom=k2.cloud; dkim=pass (2048-bit key) header.d=k2.cloud header.i=@k2.cloud header.b=cXYqnqns; arc=none smtp.client-ip=195.38.23.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=k2.cloud
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=k2.cloud
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=k2.cloud header.i=@k2.cloud header.b="cXYqnqns"
Received: from ksmg3 (localhost [127.0.0.1])
	by ksmg3.croc.ru (Postfix) with ESMTP id 74B782000F;
	Mon,  8 Dec 2025 15:31:47 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 ksmg3.croc.ru 74B782000F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=k2.cloud; s=mail;
	t=1765197107; bh=McVWicARoGNIm1c9V21xWg/FG7zYxD5MoBJXokFQG00=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=cXYqnqnsD05+Q6r3Vyhx3q+jM/5JJTfNWtPd4kSEYHtTTPBDlMdi+3Y99OUqTWXFA
	 JedRIHJHZSGh4pwRn1a90R7+gpQRuIODcrVR8BhjMMTWL926HQaM6Pyz4YKNm18zC/
	 7ElePevbuCIx38XSIsAdM8AgvukUmHqDPp50kuKxVHPhsU53wOsCSm82RkWUmA+CBJ
	 YnNt5Ubz1pyEuP/Haxr2tfFw9wNbkO4UnMKw5FKBN7+dhV4w2IJOsk6DrRpSdGx92X
	 te6kHL800mffXcUlxiGSbgPRsVDYDdfaGWHsdnmN5vHkes/8gT7iI4PJzBJpNCpj1b
	 1whn6IHpScotw==
Received: from MXONE (unknown [195.38.23.35])
	by ksmg3.croc.ru (Postfix) with ESMTP;
	Mon,  8 Dec 2025 15:31:47 +0300 (MSK)
From: Rukomoinikova Aleksandra <ARukomoinikova@k2.cloud>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
CC: Odintsov Vladislav <VlOdintsov@k2.cloud>, Kovalev Evgeniy
	<EvgKovalev@k2.cloud>, Vazhnetsov Anton <AVazhnetsov@k2.cloud>,
	"ovs-dev@openvswitch.org" <ovs-dev@openvswitch.org>
Subject: netfilter: nf_conncount: cpu soft lockup using limiting with Open
 vSwitch.
Thread-Topic: netfilter: nf_conncount: cpu soft lockup using limiting with
 Open vSwitch.
Thread-Index: AQHcaD6eYomipd0izki3FduS/CACPw==
Date: Mon, 8 Dec 2025 12:31:46 +0000
Message-ID: <9ff155d1-1f46-4890-bc15-d78101896c1b@k2.cloud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="utf-8"
Content-ID: <77F1513EE36FD24DAC719CA50F75E82A@croc.ru>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: skipped
X-KSMG-AntiSpam-Status: not scanned, allowlist
X-KSMG-AntiPhishing: not scanned, allowlist
X-KSMG-LinksScanning: not scanned, allowlist
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, not scanned, allowlist

SGkhDQpJIHdhcyB0ZXN0aW5nIGNvbm50cmFjayBsaW1pdGluZyB1c2luZyBPcGVuIHZTd2l0Y2gg
YW5kIG5vdGljZWQgdGhlIA0KZm9sbG93aW5nIGlzc3VlOiB1bmRlciBjZXJ0YWluIGxpbWl0cywg
YSBDUFUgbG9jayBvY2N1cnJlZC4NCg0KW8KgIDQ5MS42ODI5MzZdIHdhdGNoZG9nOiBCVUc6IHNv
ZnQgbG9ja3VwIC0gQ1BVIzEgc3R1Y2sgZm9yIDI2cyEgDQpbb3ZzLWRwY3RsOjE5NDM3XQ0KDQpU
aGlzIG9jY3VycyBkdXJpbmcgYSBoaWdoIHBhY2tldCBmcmVxdWVuY3kgd2hlbiB0cnlpbmcgdG8g
Z2V0IHRoZSBzZXQgDQpsaW1pdHMgdGhyb3VnaCBvdnMtZHBjdGwgY3QtZ2V0LWxpbWl0cy4NCg0K
SW4gdGhlIHRyYWNlLCBJIGNhbiBzZWUgdGhhdCB0aGUgbG9jayBvY2N1cnJlZCBvbiBhdHRlbXB0
cyB0byBhY3F1aXJlIGEgDQpzcGlubG9jay4NCg0KW8KgIDQ5MS42ODMwNTZdwqAgPElSUT4NClvC
oCA0OTEuNjgzMDU5XcKgIF9yYXdfc3Bpbl9sb2NrX2JoKzB4MjkvMHgzMA0KW8KgIDQ5MS42ODMw
NjRdwqAgY291bnRfdHJlZSsweDE5Yi8weDFmMCBbbmZfY29ubmNvdW50XQ0KW8KgIDQ5MS42ODMw
NjldwqAgb3ZzX2N0X2NvbW1pdCsweDE5Ni8weDQ5MCBbb3BlbnZzd2l0Y2hdDQoNClByaW9yIHRv
IHRoaXMsIGluIHRoZSB0cmFjZSwgdGhlcmUgd2FzIHByb2Nlc3Npbmcgb2YgYSB0YXNrIGZyb20g
DQp1c2Vyc3BhY2UgKG92cy1kcGN0bCkNCg0KW8KgIDQ5MS42ODMyMzZdwqAgPC9JUlE+DQpbwqAg
NDkxLjY4MzIzN13CoCA8VEFTSz4NClvCoCA0OTEuNjgzMjM4XcKgIGFzbV9jb21tb25faW50ZXJy
dXB0KzB4MjIvMHg0MA0KW8KgIDQ5MS42ODMyNDBdIFJJUDogMDAxMDpuZl9jb25uY291bnRfZ2Nf
bGlzdCsweDE4YS8weDIwMCBbbmZfY29ubmNvdW50XQ0KDQpJbnNpZGUgdGhlIG5mX2Nvbm5jb3Vu
dF9nY19saXN0IGZ1bmN0aW9uLCBhIGxvY2sgaXMgdGFrZW4gb24gDQpuZl9jb25uY291bnQuYzpz
cGluX3RyeWxvY2tfYmgoJmxpc3QtPmxpc3RfbG9jayk6MzM1LiBBZnRlciB0aGlzLCB0aGUgDQpu
b3Qtc28tZmFzdCBfX25mX2Nvbm5jb3VudF9nY19saXN0IGZ1bmN0aW9uIGlzIGV4ZWN1dGVkLiBJ
ZiwgYXQgdGhpcyANCm1vbWVudCwgYSBwYWNrZXQgaW50ZXJydXB0IGFycml2ZXMgb24gdGhlIHNh
bWUg0YFwdSBjb3JlIChhbmQgDQpzcGluX3RyeWxvY2tfYmggZG9lc24ndCBkaXNhYmxlIGludGVy
cnVwdHMgb24gdGhhdCBjb3JlKSwgdGhlbiBzY2VuYXJpbyANCkkgZW5jb3VudGVyZWQgb2NjdXJz
OiB0aGUgZmlyc3QgbG9jayByZW1haW5zIGhlbGQsIHdoaWxlIHRoZSBwYWNrZXQgDQppbnRlcnJ1
cHQgYWxzbyBhdHRlbXB0cyB0byBhY3F1aXJlIGl0IGF0IA0KbmZfY29ubmNvdW50LmM6c3Bpbl9s
b2NrX2JoKCZyYmNvbm4tPmxpc3QubGlzdF9sb2NrKTo1MDIgd2hpbGUgDQpjb21taXR0aW5nIHRv
IGNvbm50cmFjay4gVGhpcyBhdHRlbXB0IGZhaWxzLCBsZWFkaW5nIHRvIGEgc29mdCBsb2NrdXAu
DQoNCkhlbmNlIG15IHF1ZXN0aW9uOiBzaG91bGRuJ3Qgd2UgYXZvaWQgY2FsbGluZyBuZl9jb25u
Y291bnRfZ2NfbGlzdCB3aGVuIA0KcXVlcnlpbmcgbGltaXRzIHdpdGhvdXQgYW4gc2tiIChhcyBP
VlMgZG9lcyBpbiANCm9wZW52c3dpdGNoL2Nvbm50cmFjay5jOjE3NzMpPyBUaGUgbGltaXQgcmV0
cmlldmFsIG9wZXJhdGlvbiBzaG91bGQgYmUgDQpyZWFkLW9ubHkgcmVnYXJkaW5nIHRoZSBjb250
cmFjdCBzdGF0ZSwgbm90IGludm9sdmUgcG90ZW50aWFsIG1vZGlmaWNhdGlvbi4NCg0KTGlrZSB0
aGlzOg0KLS0tIGEvbmV0L25ldGZpbHRlci9uZl9jb25uY291bnQuYw0KKysrIGIvbmV0L25ldGZp
bHRlci9uZl9jb25uY291bnQuYw0KQEAgLTQ5NSw3ICs0OTUsNiBAQCBjb3VudF90cmVlKHN0cnVj
dCBuZXQgKm5ldCwNCiDCoCDCoCDCoCDCoCDCoCDCoCDCoGludCByZXQ7DQoNCiDCoCDCoCDCoCDC
oCDCoCDCoCDCoGlmICghc2tiKSB7DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgbmZfY29ubmNv
dW50X2djX2xpc3QobmV0LCAmcmJjb25uLT5saXN0KTsNCiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHJldHVybiByYmNvbm4tPmxpc3QuY291bnQ7DQogwqAgwqAgwqAgwqAgwqAgwqAgwqB9DQoN
ClRoYW5rcyENCg0KLS0gDQpyZWdhcmRzLA0KQWxleGFuZHJhLg0KDQo=
