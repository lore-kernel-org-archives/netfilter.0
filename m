From: ToddAndMargo <ToddAndMargo@zoho.com>
Subject: Re: nf_conntrack_helper replacement?
Date: Tue, 20 Dec 2022 11:42:34 -0800
Message-ID: <5f4f66ce-0195-0161-11a8-d6397ac5bcd8@zoho.com>
References: <518aeae6-e89b-62f0-0a5b-86264a51edde@zoho.com>
 <eff246c8-14b1-c0e9-15e1-0650afdd780c@thelounge.net>
 <f9f9e14c-fee3-b09f-a32b-876783e14feb@zoho.com>
 <38b6e874-69f9-dd0a-6b60-269502405d0c@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1671565355;
        s=zm2022; d=zoho.com; i=ToddAndMargo@zoho.com;
        h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
        bh=T/4seAbjt5PPFneLWJo4B7n2CIkmX3NsBnK2n7jmy/4=;
        b=M0Jzn5IWZ1DM5b0bvr5/2tFkx3bRCm9Q8ZarhhOMvZih/Not92SWhp0lS+fb/E3f
        SHWBUpN5rKyhKXldVnRK2MZ77YxHFEaG91Xli/7HThEKoa/jzTIF5/FipeBGJiifI58
        HmG8L3wSTEMO7c1vCmQDgEceJiFrEBnjQQh09Gk4=
Content-Language: en-US
In-Reply-To: <38b6e874-69f9-dd0a-6b60-269502405d0c@thelounge.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Reindl Harald <h.reindl@thelounge.net>, netfilter@vger.kernel.org

T24gMTIvMjAvMjIgMTE6NDEsIFJlaW5kbCBIYXJhbGQgd3JvdGU6DQo+IA0KPiANCj4gQW0g
MjAuMTIuMjIgdW0gMjA6MzQgc2NocmllYiBUb2RkQW5kTWFyZ286DQo+PiBPbiAxMi8yMC8y
MiAxMTozMSwgUmVpbmRsIEhhcmFsZCB3cm90ZToNCj4+Pg0KPj4+DQo+Pj4gQW0gMjAuMTIu
MjIgdW0gMjA6MDAgc2NocmllYiBUb2RkQW5kTWFyZ286DQo+Pj4+IEhpIEFsbCwNCj4+Pj4N
Cj4+Pj4gJCB1bmFtZSAtcg0KPj4+PiA2LjAuMTItMzAwLmZjMzcueDg2XzY0DQo+Pj4+DQo+
Pj4+IFNpbmNlIGtlcm5lbCA2LjAuMSwNCj4+Pj4gwqDCoMKgIC9wcm9jL3N5cy9uZXQvbmV0
ZmlsdGVyL25mX2Nvbm50cmFja19oZWxwZXINCj4+Pj4gaGFzIGJlZW4gcmVtb3ZlZC4NCj4+
Pg0KPj4+IHRoZSBkZXByZWNhdGlvbiB3YXJuaW5nIGRhdGVzIGJhY2sgbWFueSB5ZWFycw0K
Pj4NCj4+IERvIHlvdSBoYXZlIGEgbGluayB0byB0aGF0P8KgIEkgY291bGQgbm90DQo+PiBm
aW5kIG9uZS4NCj4gDQo+IGkgcmVhZCBteSBzeXNsb2dzIC8gZG1lc2cgYW5kIHRoYXQgYXJ0
aWNsZSBpcyA5IHllYXJzIG9sZDogDQo+IGh0dHBzOi8vZ2l0bGFiLmFscGluZWxpbnV4Lm9y
Zy9hbHBpbmUvYXdhbGwvLS9pc3N1ZXMvMTU0MA0KPiANCj4gZG1lc2c6IG5mX2Nvbm50cmFj
azogYXV0b21hdGljIGhlbHBlciBhc3NpZ25tZW50IGlzIGRlcHJlY2F0ZWQgYW5kIGl0IA0K
PiB3aWxsIGJlIHJlbW92ZWQgc29vbi4gVXNlIHRoZSBpcHRhYmxlcyBDVCB0YXJnZXQgdG8g
YXR0YWNoIGhlbHBlcnMgaW5zdGVhZA0KPiANCj4+Pj4gVGhpcyBicmVha3MgcGFzc2l2ZSBm
dHAuDQo+Pj4+DQo+Pj4+IFdoYXQgZG8geW91IGd1eXMgZG8gdG8gd29yayBhcm91bmQgdGhl
IHByb2JsZW0NCj4+PiBpcHRhYmxlcy1uZnQgLXQgcmF3IC1BIFBSRVJPVVRJTkcgLXAgdGNw
IC0tZHBvcnQgMjEgLWogQ1QgLS1oZWxwZXIgZnRwDQo+Pg0KPj4gV2hhdCBpcyBKdW1wIHRv
IENUICItaiBDVCI/DQo+IA0KPiBodHRwczovL2dpdGxhYi5hbHBpbmVsaW51eC5vcmcvYWxw
aW5lL2F3YWxsLy0vaXNzdWVzLzE1NDANCg0KDQoNClRoYW5rIHlvdSENCg==
