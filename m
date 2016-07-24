From: Guy German <guy_g@rad.com>
Subject: RE: How does iptables NAT handle IPsec ESP with NAT-T UDP header ?
Date: Sun, 24 Jul 2016 10:19:52 +0000
Message-ID: <AM4PR0301MB22751A4F0B3DDAB0B41EF46C910C0@AM4PR0301MB2275.eurprd03.prod.outlook.com>
References: <AM4PR0301MB227595822291E80D8CFB861A910A0@AM4PR0301MB2275.eurprd03.prod.outlook.com>
 <fa1bc371-408e-6508-4cf3-e0ee438fc55a@plouf.fr.eu.org>
 <AM4PR0301MB2275F18931456F441AEBA7B3910B0@AM4PR0301MB2275.eurprd03.prod.outlook.com>
 <4a1e6811-4d44-3b08-98af-95ecaad66dfb@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rad365.onmicrosoft.com; s=selector1-rad-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=iBXqzGIGg+7DS6zHSMuz0l1rXk+LrK5MgUMGbV2wUVA=;
 b=rxS+smnpSzv1cVYgGqHpVeyTvE+126j4yovLH1cVi0/EfrnKH89eWU+TfJ5Fr3qMjqbITZl3OMAnMQVVqI/Rnobe/Lj+xeGpyPZYzSEaN+LpYsqj1+RA9pmifc1bf//hInzY32L4PwhzsAQSkCkrY5MUa+tsshw1l+hplf+R1CM=
In-Reply-To: <4a1e6811-4d44-3b08-98af-95ecaad66dfb@plouf.fr.eu.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

SGkgUGFzY2FsLA0KT0ssIEkgdGhpbmsgSSBnb3QgaXQgbm93ICA6LSkNCkZvciBlYWNoIHNlc3Np
b24gdGhlIGRlc3RpbmF0aW9uIElQIGFkZHJlc3MgaXMga2VwdCBhcyBwYXJ0IG9mIHRoZSBzZXNz
aW9uIGlkZW50aWZpZXIga2V5IGFzIHdlbGwgPw0KU28sIGZvciBteSBleGFtcGxlLCB0aGVyZSBh
cmUgMiB1bmlxdWUgZW50cmllcyBpbiB0aGUgTkFUIHRhYmxlLCB3aXRob3V0IHRoZSBuZWVkIGZv
ciBVRFAgc3JjIHBvcnQgY2hhbmdlLg0KSG93ZXZlciwgaWYgMi4xLjEuMSB3aWxsIHNlbmQgYSBw
YWNrZXQgdG8gMTAuMC4wLjIsDQphIDNyZCBlbnRyeSB3aWxsIGJlIGNyZWF0ZWQsIHRoaXMgdGlt
ZSB3aXRoIHRoZSBzcmMgVURQIDQ1MDAgY2hhbmdlZCB0byBzb21lICJuZXctcG9ydCIgaW4gb3Jk
ZXINCnRvIGRpc3Rpbmd1aXNoIGZyb20gdGhlIDJuZCBlbnRyeSAoaW4gd2hpY2ggZGVzdGluYXRp
b24gYWRkcmVzcyBpcyBzYW1lIDEwLjAuMC4yKSA/DQpXaGlsZSB0aGUgMm5kIGVudHJ5IHdpbGwg
Y29udGludWUgdG8gaGFuZGxlIHBhY2tldHMgMTAuMC4wLjIvNDUwMC0+MTAuMC4wLjEwMS80NTAw
LA0KdGhlIDNyZCBlbnRyeSB3aWxsIGhhbmRsZSBwYWNrZXRzIDEwLjAuMC4yLzQ1MDAtPjEwLjAu
MC4xMDEvIm5ldy1wb3J0Ii4NCkFtIEkgcmlnaHQgPw0KDQpNYW55IHRoYW5rcyBmb3IgdGhlIHN1
cHBvcnQgYW5kIHBhdGllbmNlICENCg0KR3V5DQoNCg==
