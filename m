From: ToddAndMargo <ToddAndMargo@zoho.com>
Subject: Re: nf_conntrack_helper replacement?
Date: Wed, 21 Dec 2022 11:58:28 -0800
Message-ID: <4dc5f220-ceee-f003-ce93-85fadf08663c@zoho.com>
References: <518aeae6-e89b-62f0-0a5b-86264a51edde@zoho.com>
 <eff246c8-14b1-c0e9-15e1-0650afdd780c@thelounge.net>
 <f9f9e14c-fee3-b09f-a32b-876783e14feb@zoho.com>
 <38b6e874-69f9-dd0a-6b60-269502405d0c@thelounge.net>
 <a39f6206-cb82-d8e4-c8ae-ba56be27d7a4@zoho.com>
 <92e2e512-5d88-4146-6921-d365e8990ae7@thelounge.net>
 <6a09b9ef-49b3-74b7-21e4-7937bd3f84da@zoho.com>
 <a2cb3788-5027-ff14-b9d0-20a2ef370475@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1671652710;
        s=zm2022; d=zoho.com; i=ToddAndMargo@zoho.com;
        h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
        bh=7jGzu9MW/4RxdAcMwe+/vwZIMoVaH6+KUDrypv5xe3E=;
        b=W02Pxl2Cp9kZuwRDJaW6Sg4eiaSBNjufALr9rE1/6zlFZnsWu34MXUAO/EqVwdpd
        lENW+kl+GJ3+zJVr6eXpfEkDO9pG7EDYaiU3+77Yc1pFS564PY6iyCX2DFAHTooYijN
        u8lK5mQrdVFCm65dOrgptXtJ3eqq1IJ51ttyqdSI=
Content-Language: en-US
In-Reply-To: <a2cb3788-5027-ff14-b9d0-20a2ef370475@thelounge.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Reindl Harald <h.reindl@thelounge.net>, netfilter@vger.kernel.org

T24gMTIvMjAvMjIgMTg6MTEsIFJlaW5kbCBIYXJhbGQgd3JvdGU6DQo+IA0KPiANCj4gQW0g
MjAuMTIuMjIgdW0gMjM6NTUgc2NocmllYiBUb2RkQW5kTWFyZ286DQo+PiBPbiAxMi8yMC8y
MiAxMjowMSwgUmVpbmRsIEhhcmFsZCB3cm90ZToNCj4+PiB5b3UgbmVlZCBleGFjdGx5IE9O
RSAiLW0gY29ubnRyYWNrIC0tY3RzdGF0ZSBSRUxBVEVELEVTVEFCTElTSEVEIC1qIA0KPj4+
IEFDQ0VQVCIgcnVsZSBhcyB0aGUgZmlyc3Qgb2YgeW91ciBydWxlc2V0IHdoaWNoIGhhbmRs
ZXMgVURQIGFuZCBUQ1AgDQo+Pj4gKGFrYSBkb24ndMKgc3BlY2lmecKgLXApDQo+Pg0KPj4g
WyFdIC1wLCAtLXByb3RvY29sIHByb3RvY29sDQo+PiDCoMKgwqDCoMKgwqAgVGhlwqAgcHJv
dG9jb2wgb2YgdGhlIHJ1bGUgb3Igb2YgdGhlIHBhY2tldCB0byBjaGVjay4NCj4+IMKgwqDC
oMKgwqDCoCBUaGUgc3BlY2lmaWVkIHByb3RvY29sIGNhbiBiZSBvbmUgb2YgdGNwLCB1ZHAs
DQo+PiDCoMKgwqDCoMKgwqAgdWRwbGl0ZSwgaWNtcCwgaWNtcHY2LGVzcCwgYWgswqAgc2N0
cCzCoCBtaMKgIG9yDQo+PiDCoMKgwqDCoMKgwqAgdGhlIHNwZWNpYWwga2V5d29yZCAiYWxs
Ig0KPj4NCj4+IElzIGxlYXZpbmdmIG9mZiB0aGUgIi1wIHh4eCIgdGhlIHNhbWUgYW5kICIt
cCBhbGwiPw0KPiANCj4gc3VyZWx5DQo+IA0KPj4gSWYgc28sIEkgYW0gbm8gc3VyZSB0aHQg
SSBmZWVsIGNvbmZvcnRhYmxlIG9wZW5pbmcNCj4+IHVwICJ1ZHBsaXRlLCBpY21wLCBpY21w
djYsIGVzcCwgYWgswqAgc2N0cCzCoCBtaCINCj4+IGFzIHdlbGwuDQo+IA0KPiB5b3UgZG8g
bm90IG9wZW4gYW55dGhpbmcgLSB3aGVuIHlvdSBkb24ndCBldmVuIHVuZGVyc3RhbmQgdGhh
dCANCj4gIlJFTEFURUQsRVNUQUJMSVNIRUQiIG9ubHkgaGl0cyBSRVNQT05TRSBwYWNrZXRz
IGFuZCBzbyB0aGVyZSBtdXN0IGhhdmUgDQo+IGJlZW4gYW55IHJ1bGUgYWNjZXB0aW5nIHRo
ZSBpbml0aWFsIHBhY2tldCBvZiBhIGNvbm5lY3Rpb24gcGxlYXNlIA0KPiByZWZyYWluIGZv
ciBzZXR1cCBmaXJlYWxsIHJ1bGVzDQo+IA0KPiBob3cgZG8geW91IGltYWdpbmUgYSBFU1RB
QkxJU0hFRCBzdGF0ZSBwYWNrZXQgY2FuIGV4aXN0IGluIGEgcHJvdG9jbCB5b3UgDQo+IGRp
ZG4ndCBhY2NlcHQgdGhlIGluaXRpYWwgY29ubmVjdCBwYWNrZXQ/DQoNCkJhZCBndXlzIGZ1
c3Npbmcgd2l0aCBwYWNrZXRzIHRvIHRyaWNrIHlvdXIgc3R1ZmYuDQoNCg0KSGkgUmVpbmRs
LA0KDQpJIHRoaW5rIHRoYXQgbXkgbGV2ZWwgb2YgcGFyYW5vaWEgaXMgaGlnaGVyIHRoYXQN
CnlvdXJzLiAgSXQgbWF5IGNvbWVzIGZyb20geW91IHVuZGVyc3RhbmQgdGhpcyBzdHVmZg0K
bWFueSB0aW1lcyBtb3JlIHRoYW4gSSBkby4NCg0KVGhhbmsgeW91IGZvciBhbGwgdGhlIHdv
bmRlcmZ1bCBoZWxwIQ0KDQotVA0K
