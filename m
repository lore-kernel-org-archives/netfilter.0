From: ToddAndMargo <ToddAndMargo@zoho.com>
Subject: Re: nf_conntrack_helper replacement?
Date: Tue, 20 Dec 2022 14:55:13 -0800
Message-ID: <6a09b9ef-49b3-74b7-21e4-7937bd3f84da@zoho.com>
References: <518aeae6-e89b-62f0-0a5b-86264a51edde@zoho.com>
 <eff246c8-14b1-c0e9-15e1-0650afdd780c@thelounge.net>
 <f9f9e14c-fee3-b09f-a32b-876783e14feb@zoho.com>
 <38b6e874-69f9-dd0a-6b60-269502405d0c@thelounge.net>
 <a39f6206-cb82-d8e4-c8ae-ba56be27d7a4@zoho.com>
 <92e2e512-5d88-4146-6921-d365e8990ae7@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1671576914;
        s=zm2022; d=zoho.com; i=ToddAndMargo@zoho.com;
        h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
        bh=GKjxjlHq/NORFcKjcIpca/Lgu4g2NbNpAe5rvq1cQe0=;
        b=PQazosJo14XTBNLaS9mvym7FvGvIDRfAPxhdksaqbGcWs4UlinWlXHRnOduJvgcG
        kUEXwKF/P1vQmM2xsvK+h1f7Xg44ZPaQgAdGXoho2wwj7ZSnVNGcukZMID7hz4Qc7K8
        LJjPuSwKKjCrwl1MVP57QUIY5tJVXu5jfzZx95/8=
Content-Language: en-US
In-Reply-To: <92e2e512-5d88-4146-6921-d365e8990ae7@thelounge.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Reindl Harald <h.reindl@thelounge.net>, netfilter@vger.kernel.org

T24gMTIvMjAvMjIgMTI6MDEsIFJlaW5kbCBIYXJhbGQgd3JvdGU6DQo+IHlvdSBuZWVkIGV4
YWN0bHkgT05FICItbSBjb25udHJhY2sgLS1jdHN0YXRlIFJFTEFURUQsRVNUQUJMSVNIRUQg
LWogDQo+IEFDQ0VQVCIgcnVsZSBhcyB0aGUgZmlyc3Qgb2YgeW91ciBydWxlc2V0IHdoaWNo
IGhhbmRsZXMgVURQIGFuZCBUQ1AgKGFrYSANCj4gZG9uJ3TCoHNwZWNpZnnCoC1wKQ0KDQpI
aSBSZWluZGwsDQoNClshXSAtcCwgLS1wcm90b2NvbCBwcm90b2NvbA0KICAgICAgIFRoZSAg
cHJvdG9jb2wgb2YgdGhlIHJ1bGUgb3Igb2YgdGhlIHBhY2tldCB0byBjaGVjay4NCiAgICAg
ICBUaGUgc3BlY2lmaWVkIHByb3RvY29sIGNhbiBiZSBvbmUgb2YgdGNwLCB1ZHAsDQogICAg
ICAgdWRwbGl0ZSwgaWNtcCwgaWNtcHY2LGVzcCwgYWgsICBzY3RwLCAgbWggIG9yDQogICAg
ICAgdGhlIHNwZWNpYWwga2V5d29yZCAiYWxsIg0KDQpJcyBsZWF2aW5nZiBvZmYgdGhlICIt
cCB4eHgiIHRoZSBzYW1lIGFuZCAiLXAgYWxsIj8NCklmIHNvLCBJIGFtIG5vIHN1cmUgdGh0
IEkgZmVlbCBjb25mb3J0YWJsZSBvcGVuaW5nDQp1cCAidWRwbGl0ZSwgaWNtcCwgaWNtcHY2
LCBlc3AsIGFoLCAgc2N0cCwgIG1oIg0KYXMgd2VsbC4NCg0KVGhhbmsgeW91IGZvciBhbGwg
dGhlIGhlbHAgc28gZmFyIQ0KDQotVA0K
