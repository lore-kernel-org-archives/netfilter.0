From: ToddAndMargo <ToddAndMargo@zoho.com>
Subject: Re: nf_conntrack_helper replacement?
Date: Thu, 22 Dec 2022 12:40:10 -0800
Message-ID: <71f4599d-a332-0a0c-41bb-8cb8d87e7e98@zoho.com>
References: <518aeae6-e89b-62f0-0a5b-86264a51edde@zoho.com>
 <eff246c8-14b1-c0e9-15e1-0650afdd780c@thelounge.net>
 <f9f9e14c-fee3-b09f-a32b-876783e14feb@zoho.com>
 <38b6e874-69f9-dd0a-6b60-269502405d0c@thelounge.net>
 <a39f6206-cb82-d8e4-c8ae-ba56be27d7a4@zoho.com>
 <92e2e512-5d88-4146-6921-d365e8990ae7@thelounge.net>
 <6a09b9ef-49b3-74b7-21e4-7937bd3f84da@zoho.com>
 <a2cb3788-5027-ff14-b9d0-20a2ef370475@thelounge.net>
 <4dc5f220-ceee-f003-ce93-85fadf08663c@zoho.com>
 <97a04de0-1207-0e97-1b8f-b351b3cecf3a@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1671741612;
        s=zm2022; d=zoho.com; i=ToddAndMargo@zoho.com;
        h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
        bh=G3J4DdtZo14QrhxIus+QziMbRbsWFcTsj68U1cG2zX8=;
        b=MTKI8bDckVhd8yNg+coMYE94aFSy8CHnziHbEB28gdWmwyZYDUMFgBcTA7RvvzPd
        FrYKe2fFY/D44uZgiHxhsL4WlnVd5X6iktRAbY98ZncpZ/VZZvNPy4iBDGYw6RU795E
        +AyuOdKmKT3BZtlPCTgcYQur7H84kZvTGJpLO7Uc=
Content-Language: en-US
In-Reply-To: <97a04de0-1207-0e97-1b8f-b351b3cecf3a@thelounge.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Reindl Harald <h.reindl@thelounge.net>, netfilter@vger.kernel.org

T24gMTIvMjEvMjIgMTY6NDEsIFJlaW5kbCBIYXJhbGQgd3JvdGU6DQo+IHRoZSBwcm9ibGVt
IHdpdGggeW91ciBjdXJlbnQgcnVsZXNldCBpc3QgdGhhdCB5b3UgZGlkIGNvcHkmcGFzdGUg
cnVsZXMgDQo+IGZyb20gd2hlcmV2ZXIgd2l0aG91dCB1bmRlcnN0YW5kaW5nIHdoYXQgdGhl
eSBhcmUgZG9pbmcgLSB0aGF0J3MgdGhlIA0KPiB3b3JzdMKgY2FzZcKgc3phcnTCoG9mwqBh
wqBmaXJld2FsbMKgcnVsZXNldA0KDQpIaSBSZWluZGwsDQoNCiJDb3B5IGFuZCBQYXN0ZSI/
ICBZb3UgZ290IG1lIHRoZXJlLiAgR3Vlc3Mgd2hvIEkNCmFtIGNvcHlpbmcgYW5kIHBhc3Rp
bmcgZnJvbS4gIC4uLiAgIEkgYW0gY29weWluZw0KYW5kIHBhc3RpbmcgbXkgb3duIHdvcmsu
DQoNCkF0IHRoZSBib3R0b20gb2YgbXkgZXh0ZXJuYWwgcnVsZXMsIEkgaGF2ZQ0KdGhlIGZv
bGxvd2luZzoNCg0KIyBTZXQgZXZlcnl0aGluZyBlbHNlIHRvIGRlbnkgYWxsIG90aGVyIG5l
dHdvcmsgYWNjZXNzOg0KIw0KJHRibHMgLUEgZHNsLWluICAtaiBMT0cgLS1sb2ctbGV2ZWwg
JGRlYnVnIC0tbG9nLXByZWZpeCAiZHNsLWluIA0KRXZlcnl0aGluZyBFbHNlICINCiR0Ymxz
IC1BIGRzbC1pbiAgLWogRFJPUA0KJHRibHMgLUEgZHNsLW91dCAtaiBMT0cgLS1sb2ctbGV2
ZWwgJGRlYnVnIC0tbG9nLXByZWZpeCAiZHNsLW91dCANCkV2ZXJ5dGhpbmcgRWxzZSAiDQok
dGJscyAtQSBkc2wtb3V0IC1qIERST1ANCiR0YmxzIC1BIGRzbC1mb3IgLWogTE9HIC0tbG9n
LWxldmVsICRkZWJ1ZyAtLWxvZy1wcmVmaXggImRzbC1mb3IgDQpFdmVyeXRoaW5nIEVsc2Ug
Ig0KJHRibHMgLUEgZHNsLWZvciAtaiBEUk9QDQoNCklmIHNvbWV0aGluZyBzaG93cyB1cCBp
biB0aGUgbG9nLCBJIGludmVzdGlnYXRlLg0KQ3JlYXRlIGEgbmV3IHJ1bGUgaXMgcmVxdWly
ZWQuICBBbmQgeWVzIEkgZG8gY29weQ0KYW5kIHBhc3RlIGZyb20gYSBwcmV2aW91cyBydWxl
IHNldC4NCg0KVGhhbmsgeW91IGZvciBhbGwgdGhlIGhlbHAhDQotVA0K
