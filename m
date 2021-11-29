From: Tobias Urdin <tobias.urdin@binero.com>
Subject: Re: conntrackd syncing specific ct zones
Date: Mon, 29 Nov 2021 15:38:35 +0000
Message-ID: <8776804B-80F9-47E2-B8A3-30FA7858BBC6@binero.com>
References: <D16306B5-8297-483D-A711-E5F9C3B05A2F@binero.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=binero.com; s=mysmtp;
        t=1638200317; bh=l1GLfZYJRwzshE29qx8b26Vv214N2iKFOofPTitgbXQ=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=OSO58JfwSVTdVA/WC9AA8EYpxJXkK+N/PeT4J2lSM0ct5C2g9HsoDz92Y4jRS7Cw0
         dR8Ah0pjzvjJ29tE2C/42nOdP+JvQgcU2yrxtbVL6p4QNQjkLFohpP+3DxcBEoBaiY
         aKc4RSgmsVKL/CGoB3iJTJnRJMY3ckqJ4OKKcJUg=
In-Reply-To: <D16306B5-8297-483D-A711-E5F9C3B05A2F@binero.com>
Content-Language: en-US
Content-ID: <F495793717778A4D8D3EA5C8302FAB9F@staff.ognet.se>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Cc: "pablo@netfilter.org" <pablo@netfilter.org>

SGVsbG8sDQpBbnlib2R5IGtub3cgdGhlc2UgZGV0YWlscz8NCg0KQ0M6IFBhYmxvIG1heWJlIGhh
cyB0aW1lIGZvciBhIHF1aWNrIGFuc3dlcj8NCg0KQmVzdCByZWdhcmRzDQpUb2JpYXMNCg0KPiBP
biA4IFNlcCAyMDIxLCBhdCAwOTozMiwgVG9iaWFzIFVyZGluIDx0b2JpYXMudXJkaW5AYmluZXJv
LmNvbT4gd3JvdGU6DQo+IA0KPiBIZWxsbywNCj4gDQo+IEJlZW4gYnJvd3NpbmcgdGhyb3VnaCB0
aGUgY29kZSBhbmQgc2VhcmNoaW5nIHRoZSBpbnRlcm5ldCBhbmQgdG8gbXkgdW5kZXJzdGFuZGlu
ZyBpdOKAmXMgbm90IHBvc3NpYmxlIHRvDQo+IGFwcGx5IGFueSBmaWx0ZXJzIGluIGNvbm50cmFj
a2QgdG8gb25seSBzeW5jIHN0YXRlcyB3aXRoIGEgc3BlY2lmaWMgY3Qgem9uZSwgYW0gSSB1bmRl
cnN0YW5kaW5nIGl0IGNvcnJlY3RseT8NCj4gDQo+IFRoZSB1c2UtY2FzZSB3b3VsZCBiZSwgaGF2
aW5nIG11bHRpcGxlIGN0IHpvbmVzIHNldCB1cCB3aXRoIG5mdGFibGVzIG9uIGEgbWFjaGluZSwg
dGhlbiBzeW5jaGluZyBzcGVjaWZpYw0KPiBjdCB6b25lcyAobXVsdGlwbGUpIG91dCB0byBvdGhl
ciBkaWZmZXJlbnQgY29ubnRyYWNrZCBpbnN0YW5jZXMuDQo+IA0KPiBCZXN0IHJlZ2FyZHMNCj4g
VG9iaWFzDQoNCg==
