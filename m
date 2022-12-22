From: ToddAndMargo <ToddAndMargo@zoho.com>
Subject: Re: nftables tutorial for dummies?
Date: Thu, 22 Dec 2022 12:34:51 -0800
Message-ID: <5b6be8b3-341e-f8ec-dd65-6cd235f8de4f@zoho.com>
References: <47d2afb3-7911-a903-d36b-6b231b4524a2@zoho.com>
 <c22a1be1-c761-d5fe-13d9-9896c9e79fbd@gmx.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1671741294;
        s=zm2022; d=zoho.com; i=ToddAndMargo@zoho.com;
        h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
        bh=sem2lmP3H3GtYN0EEVX7JEw84mry+oWTmYqWjLqVnDA=;
        b=OX9QLu+kkXYsZN/Frc0f5iXaPhHto98Tg2B2O/AC7Zx5uE9HCIopl36ZoUNfhZBG
        XA51j66Fqk6j5hivhPouY0wzrgl6c0ZnArXwjcX4irB2grrAh3ieG9e697P/NOY1B/y
        w1pNCghDjR1q+GFl2YjcxS8tvYNtsToFEApe0kxk=
Content-Language: en-US
In-Reply-To: <c22a1be1-c761-d5fe-13d9-9896c9e79fbd@gmx.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?Q?Lars_Nood=c3=a9n?= <lars.nooden@gmx.com>, netfilter@vger.kernel.org

T24gMTIvMjIvMjIgMDE6MTMsIExhcnMgTm9vZMOpbiB3cm90ZToNCj4gT24gMjEuMTIuMjAy
MiAxLjQ1LCBUb2RkQW5kTWFyZ28gd3JvdGU6DQo+PiBIaSBBbGwsDQo+Pg0KPj4gQW55b25l
IGhhdmUgYSBmYXZvcml0ZSBuZnRhYmxlcyB0dXRvcmlhbA0KPj4gZm9yIGR1bW1pZXM/DQo+
Pg0KPj4gSSBhbSBmYW1pbGlhciB3aXRoIGlwdGFibGVzLCBpZiB0aGF0IGhlbHBzLg0KPj4N
Cj4+IFRoaXMgbG9va3MgYSBiaXQgY29tcGxpY2F0ZWQ6DQo+Pg0KPj4gaHR0cHM6Ly93aWtp
Lm5mdGFibGVzLm9yZy93aWtpLW5mdGFibGVzL2luZGV4LnBocC9NYWluX1BhZ2UNCj4+DQo+
PiBNYW55IHRoYW5rcywNCj4+IC1UDQo+IA0KPiBEaWQgeW91IHNlZSB0aGUgIlF1aWNrIHJl
ZmVyZW5jZS1uZnRhYmxlcyBpbiAxMCBtaW51dGVzIiBsaW5rIGZvdW5kIG5lYXIgDQo+IHRo
ZSBib3R0b20gb2YgdGhlIHBhZ2UgeW91IGxpbmsgdG8gYWJvdmU/wqAgSXQncyByZWFsbHkg
d29ydGggYSBsb29rOg0KPiANCj4gaHR0cHM6Ly93aWtpLm5mdGFibGVzLm9yZy93aWtpLW5m
dGFibGVzL2luZGV4LnBocC9RdWlja19yZWZlcmVuY2UtbmZ0YWJsZXNfaW5fMTBfbWludXRl
cw0KDQpJIGRpZCBub3Qgc2VlIHRoYXQuICBNZSB0aGluZ3MgSSB3aWxsIGJlIHVzaW5nIHRo
ZQ0KaGVjayBvdXQgb2YgaXQgd2hlbiBJIGdldCB0aGUgaGFuZyBvZiBpdC4NCg0KPiANCj4g
TkZUYWJsZXMgaXMgZGlmZmVyZW50IGZyb20gSVBUYWJsZXMsIGJ1dCBmb3IgbWUgaXQgaXMg
ZGlmZmVyZW50IGluIHdheXMgDQo+IHdoaWNoIG1ha2UgaXQgZWFzaWVyIHRvIHVzZSBkZXNw
aXRlIGhhdmluZyBzcGVudCBhIGxvbmdlciB0aW1lIHVzaW5nIA0KPiBJUFRhYmxlcy7CoCBZ
TU1WLg0KDQpNeSB0d28gYmlnIGZlYXJzIGFyZToNCg0KMSkgIGlmIEkgZG8gbm90IG1hbmFn
ZXIgdG8gZG93bmxvYWQgZW5vdWdoIG9mIHRoZQ0KcmVmZXJlbmNlIGd1aWRlcy90dXRvcmlh
bCBpbiBhZHZhbmNlLCB0aGF0IEkgd2lsbA0KYmVpbmcgZ29pbmcgYmFjayBhbmQgZm9ydGgg
d2l0aCBhIGxpdmUgVVNCIHJlc2VhcmNoaW5nDQp0aGluZ3MuDQoNCjIpICBJdCBsb29rcyBs
aWtlIEkgd2lsbCBoYXZlIHRvIGxlYXJuIHRoZSBzeW50YXgNCm9mIGEgbmV3IGxhbmd1YWdl
LiAgKEkgYW0gZmFtaWxpYXIgd2l0aCBzZXZlcmFsDQpvZiB0aGVtLiAgQ3VycmVudGx5LCBJ
IHdyaXRlIGEgbG90IGluIFJha3UgW1BlcmwgNl0uKQ0KDQpUaGFuayB5b3UgZm9yIHRoZSBo
ZWxwIQ0KDQo+IC9MYXJzDQo+IA0KPiBQUy7CoCBUaGFuayB5b3UgaW4gYWR2YW5jZSBmb3Ig
bm90IHRvcC1wb3N0aW5nLg0KDQpZb3UgYXJlIHdlbGNvbWUhDQoNCg0KDQoNCg==
