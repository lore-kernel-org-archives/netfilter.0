From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: [nftables 0.9.2] NETDEV packet drop vs. packet capture visibility
Date: Thu, 19 Mar 2020 16:11:01 +0000
Message-ID: <076ce710-b294-7360-77ff-204d1848603a@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1584634270;
        bh=ZUHcAVkvCNOZ/Z4UqaTwHaWW++KP0ZzlHv2/i/dBjiQ=;
        h=X-UI-Sender-Class:Reply-To:To:From:Subject:Date;
        b=bGtERdyO5xD+2bLVa4k1bDgqMsYs6KHXpA9QRFvy7ClKo7aCiofMgzYV1urpuQfon
         44ZRwbnPTKlfYW77L2cwNSQd6FW0qT+ScfNPMrzydJPqaWa/ON8AcBOn3s3lV9CBxs
         HbsXjAAWwxuYm3UxoX1eoulwZnAn4Cs4WHzkygSQ=
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

V2l0aA0KDQp0YWJsZSBuZXRkZXYgZmlsdGVyIHsNCiDCoMKgwqDCoMKgwqDCoCBjaGFpbiBpbnB1
dCB7DQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHR5cGUgZmlsdGVyIGhvb2sgaW5n
cmVzcyBkZXZpY2UgImV0aDIiIHByaW9yaXR5IGZpbHRlcjsgDQpwb2xpY3kgYWNjZXB0Ow0KIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBldGhlciB0eXBlIGFycCBkcm9wDQogwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGV0aGVyIHR5cGUgdmxhbiBkcm9wDQogwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGV0aGVyIHR5cGUgMHg5MDAwIGRyb3ANCiDCoMKgwqDCoMKg
wqDCoCB9DQp9DQoNCmluIHBsYWNlIHRob3NlIHBhY2thZ2UgdHlwZXMgYXJlIHZpc2libGUgKHNo
b3dpbmcpIGR1cmluZyBhIHBhY2tldCANCmNhcHR1cmUgKHdpcmVoc2hhcmsgc3NoIHJlbW90ZSkg
b24gdGhhdCBpbnRlcmZhY2UuIElzIHRoaXMgdG8gYmUgDQpleHBlY3RlZCBhcyB0aGUgcGFja2V0
IGlzIGJlaW5nIGNhcHR1cmVkIHByaW9yIGJlaW5nIGRyb3BwZWQgYnkgTkZUIG9yIA0KZG9lcyBp
bmRpY2F0ZSB0aGF0IHRoZSBwYWNrYWdlcyBhcmUgbm90IGJlaW5nIGRyb3BwZWQ/DQo=
