From: Tobias Urdin <tobias.urdin@binero.com>
Subject: conntrackd syncing specific ct zones
Date: Wed, 8 Sep 2021 07:32:55 +0000
Message-ID: <D16306B5-8297-483D-A711-E5F9C3B05A2F@binero.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=binero.com; s=mysmtp;
        t=1631086377; bh=EHYFWeM0nm8aYLj5dN3IXz6cKZvMHhOm+aQUIC4eH+U=;
        h=From:To:Subject:Date:From;
        b=DPKvgUp7ArGyEmTSwra/mLoldbJdC42fdIea+J0BXA5pwCg5WRwKfb4vs5dkgDkq/
         n10ZF882/2nOFrZbuVL/grs57I/bDc8VDqLK/nzJXaut/c7h3ztDv8gHCjFwvydw4T
         0jEIrsqxGRFumoP3mZux9jlytwY8X3QldbORB7lk=
Content-Language: en-US
Content-ID: <922CCA613052C445AF50CD47E6A0F693@staff.ognet.se>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

SGVsbG8sDQoNCkJlZW4gYnJvd3NpbmcgdGhyb3VnaCB0aGUgY29kZSBhbmQgc2VhcmNoaW5nIHRo
ZSBpbnRlcm5ldCBhbmQgdG8gbXkgdW5kZXJzdGFuZGluZyBpdOKAmXMgbm90IHBvc3NpYmxlIHRv
DQphcHBseSBhbnkgZmlsdGVycyBpbiBjb25udHJhY2tkIHRvIG9ubHkgc3luYyBzdGF0ZXMgd2l0
aCBhIHNwZWNpZmljIGN0IHpvbmUsIGFtIEkgdW5kZXJzdGFuZGluZyBpdCBjb3JyZWN0bHk/DQoN
ClRoZSB1c2UtY2FzZSB3b3VsZCBiZSwgaGF2aW5nIG11bHRpcGxlIGN0IHpvbmVzIHNldCB1cCB3
aXRoIG5mdGFibGVzIG9uIGEgbWFjaGluZSwgdGhlbiBzeW5jaGluZyBzcGVjaWZpYw0KY3Qgem9u
ZXMgKG11bHRpcGxlKSBvdXQgdG8gb3RoZXIgZGlmZmVyZW50IGNvbm50cmFja2QgaW5zdGFuY2Vz
Lg0KDQpCZXN0IHJlZ2FyZHMNClRvYmlhcw==
