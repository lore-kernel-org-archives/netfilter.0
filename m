From: ToddAndMargo <ToddAndMargo@zoho.com>
Subject: Re: nf_conntrack_helper replacement?
Date: Tue, 20 Dec 2022 11:34:58 -0800
Message-ID: <f9f9e14c-fee3-b09f-a32b-876783e14feb@zoho.com>
References: <518aeae6-e89b-62f0-0a5b-86264a51edde@zoho.com>
 <eff246c8-14b1-c0e9-15e1-0650afdd780c@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1671564900;
        s=zm2022; d=zoho.com; i=ToddAndMargo@zoho.com;
        h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
        bh=T/vP/b9kEjpfuWVJ/Gi7iVx6A3OGToUIjI7DkduUbNY=;
        b=Aas6CDQU/8gw0l2z4aTNatgoJEfsgnDqdvGMQsdNAsJ63so3DUcOEPaZe1Sn4WGQ
        R0isxcIWcE+PAgbRYO6T8wdzPpYXBkh7g+q5axx6OvjwJq8EKaHbb6emuxLT1X5pMYw
        FTtKZC1UIDGbpbkHAW35f7+3VNSoGWCWG8cGjWBg=
Content-Language: en-US
In-Reply-To: <eff246c8-14b1-c0e9-15e1-0650afdd780c@thelounge.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Reindl Harald <h.reindl@thelounge.net>, netfilter@vger.kernel.org

T24gMTIvMjAvMjIgMTE6MzEsIFJlaW5kbCBIYXJhbGQgd3JvdGU6DQo+IA0KPiANCj4gQW0g
MjAuMTIuMjIgdW0gMjA6MDAgc2NocmllYiBUb2RkQW5kTWFyZ286DQo+PiBIaSBBbGwsDQo+
Pg0KPj4gJCB1bmFtZSAtcg0KPj4gNi4wLjEyLTMwMC5mYzM3Lng4Nl82NA0KPj4NCj4+IFNp
bmNlIGtlcm5lbCA2LjAuMSwNCj4+IMKgwqDCoCAvcHJvYy9zeXMvbmV0L25ldGZpbHRlci9u
Zl9jb25udHJhY2tfaGVscGVyDQo+PiBoYXMgYmVlbiByZW1vdmVkLg0KPiANCj4gdGhlIGRl
cHJlY2F0aW9uIHdhcm5pbmcgZGF0ZXMgYmFjayBtYW55IHllYXJzDQoNCkRvIHlvdSBoYXZl
IGEgbGluayB0byB0aGF0PyAgSSBjb3VsZCBub3QNCmZpbmQgb25lLg0KDQo+PiBUaGlzIGJy
ZWFrcyBwYXNzaXZlIGZ0cC4NCj4+DQo+PiBXaGF0IGRvIHlvdSBndXlzIGRvIHRvIHdvcmsg
YXJvdW5kIHRoZSBwcm9ibGVtDQo+IGlwdGFibGVzLW5mdCAtdCByYXcgLUEgUFJFUk9VVElO
RyAtcCB0Y3AgLS1kcG9ydCAyMSAtaiBDVCAtLWhlbHBlciBmdHANCg0KV2hhdCBpcyBKdW1w
IHRvIENUICItaiBDVCI/DQoNClRoYW5rIHlvdSENCg==
