Received: from ksmg.croc.ru (ksmg.croc.ru [195.38.23.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBA8246BD2
	for <netfilter@vger.kernel.org>; Mon,  8 Dec 2025 12:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.38.23.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765197422; cv=none; b=lFFc8H2QjA+KYKqApnO4PzSI7zPZKL5oPRZbu2d4lr4R0GaXWmPxXHZ0tAoJ3AQ0zqetnmJgWdLlxkgFKcJLFmhEqJ47qT60AzfPuBlFmVBFsW33hBevM99iHbNeOFVpi89olXFelwfrloYNgWxfx2jQ29O/hwpSUX1SyuCt1UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765197422; c=relaxed/simple;
	bh=teMmD7NWDQpPEdIJaSVbne2aO5taAzbtw9zeGZizBEc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=d+swFUxUagXIvQx2pug/xf0GhO2nyin6cRg2RjY0f5Nfp7lViT56I2fF9VRxZkhRl4bF+yMGWJqndWbgDr6vZFry1Sj4ChV9I4kDt2Aq/LNZA5cUArSgTvQqXy/tCgKZLRrekQIyQUWn1qswU0Lr6UE8M9N47Gg8dlYyRoNhN3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=k2.cloud; spf=pass smtp.mailfrom=k2.cloud; dkim=pass (2048-bit key) header.d=k2.cloud header.i=@k2.cloud header.b=FWJSKtYS; arc=none smtp.client-ip=195.38.23.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=k2.cloud
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=k2.cloud
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=k2.cloud header.i=@k2.cloud header.b="FWJSKtYS"
Received: from ksmg (localhost [127.0.0.1])
	by ksmg.croc.ru (Postfix) with ESMTP id 77878260025;
	Mon,  8 Dec 2025 15:27:54 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 ksmg.croc.ru 77878260025
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=k2.cloud; s=mail;
	t=1765196874; bh=teMmD7NWDQpPEdIJaSVbne2aO5taAzbtw9zeGZizBEc=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=FWJSKtYSz3n/oDHtCt0D1f9fGl9+0yziQkWWzPow3iy3lVl5/kIYpdGy6Q3PMaQ/E
	 IuTlZ9M2zMH9GWvojqli4MkU4oTaK0MP7xMjtcKgN61sRYrfcyvhL3NFrLfqaZUMmx
	 f4sTCGspBt+wvR8Qa2u3kc2oRdBixwnPO910oFxNVNXlIOQObrby5tXbnaqhl24/XD
	 fzx2kbm/G1xqHTY9qwz+c3AW6X8VlL5tMTeH7zq2S0u9KXyZjlb/kewjtPWB1NuRUF
	 r4IACLxlmeNYgSHKGauig3DMS5xMMqaSb/napTu+4qLSjk20Ekp280z+IGtTLJ8vij
	 bem4vouu2EbGA==
Received: from MXONE (unknown [195.38.23.35])
	by ksmg.croc.ru (Postfix) with ESMTP;
	Mon,  8 Dec 2025 15:27:54 +0300 (MSK)
From: Odintsov Vladislav <VlOdintsov@k2.cloud>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>,
	"ovs-dev@openvswitch.org" <ovs-dev@openvswitch.org>
CC: Kovalev Evgeniy <EvgKovalev@k2.cloud>, Vazhnetsov Anton
	<AVazhnetsov@k2.cloud>, Rukomoinikova Aleksandra <ARukomoinikova@k2.cloud>
Subject: RE: netfilter: nf_conncount: cpu soft lockup using limiting with Open
 vSwitch.
Thread-Topic: netfilter: nf_conncount: cpu soft lockup using limiting with
 Open vSwitch.
Thread-Index: AQHcaDsVSKXgHOZzeEahONnxAcv4gLUXeWWA
Date: Mon, 8 Dec 2025 12:27:53 +0000
Message-ID: <f801e56e-eba5-460e-919a-3e839b1f9905@k2.cloud>
References: <7a6872ce-8015-4397-bbe9-22108c65b7ec@k2.cloud>
In-Reply-To: <7a6872ce-8015-4397-bbe9-22108c65b7ec@k2.cloud>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="utf-8"
Content-ID: <975BB70573C1F94A916B532F400D4BA9@croc.ru>
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

T24gMDguMTIuMjAyNSAxNTowNiwgUnVrb21vaW5pa292YSBBbGVrc2FuZHJhIHdyb3RlOg0KPiBI
aSENCj4gSSB3YXMgdGVzdGluZyBjb25udHJhY2sgbGltaXRpbmcgdXNpbmcgT3BlbiB2U3dpdGNo
IGFuZCBub3RpY2VkIHRoZSANCj4gZm9sbG93aW5nIGlzc3VlOiB1bmRlciBjZXJ0YWluIGxpbWl0
cywgYSBDUFUgbG9jayBvY2N1cnJlZC4NCj4gDQo+IFvCoCA0OTEuNjgyOTM2XSB3YXRjaGRvZzog
QlVHOiBzb2Z0IGxvY2t1cCAtIENQVSMxIHN0dWNrIGZvciAyNnMhIFtvdnMtIA0KPiBkcGN0bDox
OTQzN10NCj4gDQo+IFRoaXMgb2NjdXJzIGR1cmluZyBhIGhpZ2ggcGFja2V0IGZyZXF1ZW5jeSB3
aGVuIHRyeWluZyB0byBnZXQgdGhlIHNldCANCj4gbGltaXRzIHRocm91Z2ggb3ZzLWRwY3RsIGN0
LWdldC1saW1pdHMuDQo+IA0KPiBJbiB0aGUgdHJhY2UsIEkgY2FuIHNlZSB0aGF0IHRoZSBsb2Nr
IG9jY3VycmVkIG9uIGF0dGVtcHRzIHRvIGFjcXVpcmUgYSANCj4gc3BpbmxvY2suDQo+IA0KPiBb
wqAgNDkxLjY4MzA1Nl3CoCA8SVJRPg0KPiBbwqAgNDkxLjY4MzA1OV3CoCBfcmF3X3NwaW5fbG9j
a19iaCsweDI5LzB4MzANCj4gW8KgIDQ5MS42ODMwNjRdwqAgY291bnRfdHJlZSsweDE5Yi8weDFm
MCBbbmZfY29ubmNvdW50XQ0KPiBbwqAgNDkxLjY4MzA2OV3CoCBvdnNfY3RfY29tbWl0KzB4MTk2
LzB4NDkwIFtvcGVudnN3aXRjaF0NCj4gDQo+IFByaW9yIHRvIHRoaXMsIGluIHRoZSB0cmFjZSwg
dGhlcmUgd2FzIHByb2Nlc3Npbmcgb2YgYSB0YXNrIGZyb20gDQo+IHVzZXJzcGFjZSAob3ZzLWRw
Y3RsKQ0KPiANCj4gW8KgIDQ5MS42ODMyMzZdwqAgPC9JUlE+DQo+IFvCoCA0OTEuNjgzMjM3XcKg
IDxUQVNLPg0KPiBbwqAgNDkxLjY4MzIzOF3CoCBhc21fY29tbW9uX2ludGVycnVwdCsweDIyLzB4
NDANCj4gW8KgIDQ5MS42ODMyNDBdIFJJUDogMDAxMDpuZl9jb25uY291bnRfZ2NfbGlzdCsweDE4
YS8weDIwMCBbbmZfY29ubmNvdW50XQ0KPiANCj4gSW5zaWRlIHRoZSBuZl9jb25uY291bnRfZ2Nf
bGlzdCBmdW5jdGlvbiwgYSBsb2NrIGlzIHRha2VuIG9uIA0KPiBuZl9jb25uY291bnQuYzpzcGlu
X3RyeWxvY2tfYmgoJmxpc3QtPmxpc3RfbG9jayk6MzM1LiBBZnRlciB0aGlzLCB0aGUgDQo+IG5v
dC1zby1mYXN0IF9fbmZfY29ubmNvdW50X2djX2xpc3QgZnVuY3Rpb24gaXMgZXhlY3V0ZWQuIElm
LCBhdCB0aGlzIA0KPiBtb21lbnQsIGEgcGFja2V0IGludGVycnVwdCBhcnJpdmVzIG9uIHRoZSBz
YW1lINGBcHUgY29yZSAoYW5kIA0KPiBzcGluX3RyeWxvY2tfYmggZG9lc24ndCBkaXNhYmxlIGlu
dGVycnVwdHMgb24gdGhhdCBjb3JlKSwgdGhlbiBzY2VuYXJpbyANCj4gSSBlbmNvdW50ZXJlZCBv
Y2N1cnM6IHRoZSBmaXJzdCBsb2NrIHJlbWFpbnMgaGVsZCwgd2hpbGUgdGhlIHBhY2tldCANCj4g
aW50ZXJydXB0IGFsc28gYXR0ZW1wdHMgdG8gYWNxdWlyZSBpdCBhdCANCj4gbmZfY29ubmNvdW50
LmM6c3Bpbl9sb2NrX2JoKCZyYmNvbm4tPmxpc3QubGlzdF9sb2NrKTo1MDIgd2hpbGUgDQo+IGNv
bW1pdHRpbmcgdG8gY29ubnRyYWNrLiBUaGlzIGF0dGVtcHQgZmFpbHMsIGxlYWRpbmcgdG8gYSBz
b2Z0IGxvY2t1cC4NCj4gDQo+IEhlbmNlIG15IHF1ZXN0aW9uOiBzaG91bGRuJ3Qgd2UgYXZvaWQg
Y2FsbGluZyBuZl9jb25uY291bnRfZ2NfbGlzdCB3aGVuIA0KPiBxdWVyeWluZyBsaW1pdHMgd2l0
aG91dCBhbiBza2IgKGFzIE9WUyBkb2VzIGluIG9wZW52c3dpdGNoLyANCj4gY29ubnRyYWNrLmM6
MTc3Myk/IFRoZSBsaW1pdCByZXRyaWV2YWwgb3BlcmF0aW9uIHNob3VsZCBiZSByZWFkLW9ubHkg
DQo+IHJlZ2FyZGluZyB0aGUgY29udHJhY3Qgc3RhdGUsIG5vdCBpbnZvbHZlIHBvdGVudGlhbCBt
b2RpZmljYXRpb24uDQo+IA0KPiBMaWtlIHRoaXM6DQo+IC0tLSBhL25ldC9uZXRmaWx0ZXIvbmZf
Y29ubmNvdW50LmMNCj4gKysrIGIvbmV0L25ldGZpbHRlci9uZl9jb25uY291bnQuYw0KPiBAQCAt
NDk1LDcgKzQ5NSw2IEBAIGNvdW50X3RyZWUoc3RydWN0IG5ldCAqbmV0LA0KPiAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBpbnQgcmV0Ow0KPiANCj4gIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKCFza2Ip
IHsNCj4gLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG5mX2Nvbm5jb3VudF9nY19saXN0KG5ldCwg
JnJiY29ubi0+bGlzdCk7DQo+ICDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiByYmNv
bm4tPmxpc3QuY291bnQ7DQo+ICDCoCDCoCDCoCDCoCDCoCDCoCDCoH0NCj4gDQo+IFRoYW5rcyEN
Cj4gDQo+IC0tIA0KPiByZWdhcmRzLA0KPiBBbGV4YW5kcmEuDQo+IA0KDQorIG92cy1kZXYgTUwN
Cg==
