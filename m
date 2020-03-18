From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: [nftables 0.9.2 | kernel 4.19.93] dropping ct state untracked stops
 ipv6 connectivity
Date: Wed, 18 Mar 2020 12:05:57 +0000
Message-ID: <9a55ac25-719e-49fb-c414-7467e67cb686@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1584533146;
        bh=r4A3VtkKWuBEz1rcyz/TPw4+ro3JO7ccPBlBzoJgtZ8=;
        h=X-UI-Sender-Class:Reply-To:To:From:Subject:Date;
        b=fIEOdfh17j1uCRukWqaIsizxZQ7w+PPeC/DSBLs9y0/Qx7Ul15uq+xK8a43Jz9J0f
         HSeBJNBpoCXP2W2SxrawU+cIGYYZ8OofNiDH45hEYNfa8pgTAMj6LRiytMB2jjdsn2
         p8NKZkiw6T8Fw2RpRWu1zZJu3tobwBVKXtSxkslQ=
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

VGhpcyB3b3JrcyAoaS5lLiBpcHY0IGFuZCBpcHY2IGNvbm5lY3Rpdml0eSkNCg0KdGFibGUgaW5l
dCBmaWx0ZXIgew0KIMKgwqDCoMKgwqDCoMKgIGNoYWluIGlucHV0IHsNCiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgdHlwZSBmaWx0ZXIgaG9vayBpbnB1dCBwcmlvcml0eSBmaWx0ZXI7
IHBvbGljeSBkcm9wOw0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjdCBzdGF0ZSBl
c3RhYmxpc2hlZCxyZWxhdGVkIGFjY2VwdA0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBjdCBzdGF0ZSBpbnZhbGlkIGRyb3ANCiDCoMKgwqDCoMKgwqDCoCB9DQoNCn0NCg0KVGhpcyBj
dXRzIGlwdjYgY29ubmVjdGl2aXR5IGVudGlyZWx5IChpcHY0IGNvbm5lY3Rpdml0eSB3b3JrcykN
Cg0KdGFibGUgaW5ldCBmaWx0ZXIgew0KIMKgwqDCoMKgwqDCoMKgIGNoYWluIGlucHV0IHsNCiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHlwZSBmaWx0ZXIgaG9vayBpbnB1dCBwcmlv
cml0eSBmaWx0ZXI7IHBvbGljeSBkcm9wOw0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBjdCBzdGF0ZSBlc3RhYmxpc2hlZCxyZWxhdGVkIGFjY2VwdA0KIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBjdCBzdGF0ZSBpbnZhbGlkLHVudHJhY2tlZCBkcm9wDQogwqDCoMKgwqDC
oMKgwqAgfQ0KDQp9DQoNCg0KSXQgcmVwcm9kdWNlcyBvbiBlYWNoIHRvZ2dsZTogY3Qgc3RhdGUg
aW52YWxpZCx1bnRyYWNrZWQgZHJvcCA8LT4gY3QgDQpzdGF0ZSBpbnZhbGlkIGRyb3AgKGN0IGRi
L2NhY2hlIG5lZWRzIHRvIGNsZWFyIGluIGJldHdlZW4gdG9nZ2xpbmcpLg0KRW5hYmxlZCBsb2dn
aW5nIGJ1dCBub3RoaW5nIGJlZW4gcHJpbnRlZCB0aGF0IHdvdWxkIHByb3ZpZGUgYSBoaW50Lg0K
DQpJcyB0aGlzIHNvbWV0aGluZyB0byBiZSBleHBlY3RlZCwgYW5kIGlmIHNvIHdoeSwgb3IgaXMg
aXQgYSBidWcgaW4gDQprZXJuZWwgLyBuZnQ/DQoNCg0K
