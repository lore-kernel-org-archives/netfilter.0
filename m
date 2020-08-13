From: Andreas Hoefler <andreas.hoefler@hitachi-powergrids.com>
Subject: RE: Is it possible to change a chains default policy when rules are
 already present?
Date: Thu, 13 Aug 2020 12:50:54 +0000
Message-ID: <AM0PR06MB4628EC9ADC47B01F8B6DFDB1C5430@AM0PR06MB4628.eurprd06.prod.outlook.com>
References: <AM0PR06MB4628C196EBABF0FD53AA8006C5430@AM0PR06MB4628.eurprd06.prod.outlook.com>
 <27311b7d-1192-3c01-3398-bcaa34856ffe@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hitachi-powergrids.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8sZxflUyjY/nGOI68dorEzFvPJFUEk+v7G53EOTN6A=;
 b=cvbgLmqI/UVeDJFbYi2o/ybC0YwMG5jbJ956KzQbMcRoweQ10kVEF+0YjxeAgakm+E5HmRI/I8RiFmXkx5x5r62Wf6LXXMdXPhJJLRL/LvxMf23RD7gfYWRXY5ggUXWx6331akV+isHoyHiFb1OJ6h/HFG8aITjflZcpHrt0RMQ=
In-Reply-To: <27311b7d-1192-3c01-3398-bcaa34856ffe@thelounge.net>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reindl Harald <h.reindl@thelounge.net>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

SGkNCg0KVGh4IGZvciB0aGUgcXVpY2sgcmVwbHkuIEZvcmdvdCB0byBtZW50aW9uIEkgYW0gdXNp
bmcgTkZUYWJsZXMuLi5idXQgSSBndWVzcyB0aGlzIHNob3VsZCBiZSB0aGVuIHBvc3NpYmxlIGFz
IHdlbGwuDQoNClRoeA0KQW5keSANCg0KQW0gMTMuMDguMjAgdW0gMTQ6Mjggc2NocmllYiBBbmRy
ZWFzIEhvZWZsZXI6DQo+IEkgaGF2ZSBhIGNoYWluIHdpdGggZGVmYXVsdCBwb2xpY3kgZHJvcC4N
Cj4gSSB3b3VsZCBsaWtlIHRvIGZpcnN0IGhhdmUgdGhlIGRlZmF1bHQgcG9saWN5IHNldCB0byBh
Y2NlcHQsIHRoZW4gYWRkIHJ1bGVzIGFuZCBsYXRlciBjaGFuZ2UgaXQgdG8gZHJvcC4NCj4gSXMg
dGhpcyBwb3NzaWJsZT8NCg0KaXB0YWJsZXMgLXQgPHRhYmxlPiAtUCA8Q0hBSU4+IEFDQ0VQVA0K
aXB0YWJsZXMgLXQgPHRhYmxlPiAtUCA8Q0hBSU4+IERST1ANCg==
