From: azurit@pobox.sk
Subject: Re: nftables cgroup accounting problem
Date: Mon, 05 Oct 2020 12:32:36 +0200
Message-ID: <20201005123236.Horde.SzZ6PfSMsLu2K0AGwuJGqH_@webmail.inetadmin.eu>
References: <20200930192755.Horde.ZHlzJB9_OgMvaVsNNXoPYcf@webmail.inetadmin.eu>
 <20201005093459.GA5213@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.sk; s=dkiminetadmin;
        t=1601893956;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YsbMlZcOGPExD/gNN/RNjaP4LrwiJNpDIgVLW4S6t3g=;
        b=Cp8b2J1JQ/bE0iRuUjkp8fxRhszxFs5YWT8xlFjOmhHBuHgZ2/T0h402lRU3MNN7NSQfCj
        C1+ioAMl3tJBBlH7/qmNyaZxXNQ5DrvcI7gF3kEoB4XBIpWWfHlXbsCrFWm6s9XDUL6k79
        Gond25rkl3qw9GbEGHTDhb3r7nkQQPE=
In-Reply-To: <20201005093459.GA5213@breakpoint.cc>
Content-Disposition: inline
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed"; delsp="Yes"
To: 
Cc: netfilter@vger.kernel.org

CkNpdMOhdCBGbG9yaWFuIFdlc3RwaGFsIDxmd0BzdHJsZW4uZGU+OgoKPiBhenVyaXRAcG9ib3gu
c2sgPGF6dXJpdEBwb2JveC5zaz4gd3JvdGU6Cj4+IEhpLAo+Pgo+PiBpJ20gbWlncmF0aW5nIGZy
b20gaXB0YWJsZXMgdG8gbmZ0YWJsZXMgYW5kIGknbSBoYXZpbmcgcHJvYmxlbSB3aXRoCj4+IGFj
Y291bnRpbmcgdXNpbmcgY2dyb3Vwcy4gRXZlcnl0aGluZyB3YXMgd29ya2luZyBvbiBpcHRhYmxl
cyBidXQgaXMgcHJpbnRpbmcKPj4gd2VpcmQgZXJyb3JzIHdpdGggbmZ0YWJsZXMgKGNoYWluICdh
Y2NvdW50aW5nJyBleGlzdHMpOgo+Pgo+PiAjIG1rZGlyIC9zeXMvZnMvY2dyb3VwL25ldF9jbHMs
bmV0X3ByaW8vMTIzNDUKPj4gIyBlY2hvIDB4MDAwMTEyMzQ1ID4gL3N5cy9mcy9jZ3JvdXAvbmV0
X2NscyxuZXRfcHJpby8xMjM0NS9uZXRfY2xzLmNsYXNzaWQKPj4gIyBuZmFjY3QgYWRkIDEyMzQ1
Cj4+ICMgaXB0YWJsZXMgLUkgYWNjb3VudGluZyAtbSBjZ3JvdXAgLS1jZ3JvdXAgMHgwMDAxMTIz
NDUgLW0gbmZhY2N0Cj4+IC0tbmZhY2N0LW5hbWUgMTIzNDUKPj4gaXB0YWJsZXM6IE5vIHNwYWNl
IGxlZnQgb24gZGV2aWNlLgo+Pgo+PiAjIHVuYW1lIC1hCj4+IExpbnV4IHNlcnZlciA0LjkuMjM2
ICMyIFNNUCBUaHUgU2VwIDE3IDE2OjMyOjE5IENFU1QgMjAyMCB4ODZfNjQgR05VL0xpbnV4Cj4+
ICMgaXB0YWJsZXMgLS12ZXJzaW9uCj4+IGlwdGFibGVzIHYxLjguMiAobmZfdGFibGVzKQo+Cj4g
VXNlIGxlZ2FjeSB2ZXJzaW9uLiAgNC45IGxhY2tzIHNldmVyYWwgZml4ZXMgdGhhdCBtaWdodCBh
Y2NvdW50IGZvcgo+IHRoaXMuICBBbHNvLCB0aGVyZSBpcyBubyBhZHZhbnRhZ2Ugb2YgaXB0YWJs
ZXMtb3Zlci1uZnQgdnMuCj4gaXB0YWJsZXMtbGVnYWN5IGV4Y2VwdCBpdCBhdm9pZHMgcmFjZSBj
b25kaXRpb25zIHdpdGggcGFyYWxsZWwgcnVsZQo+IHVwZGF0ZXMgKHBsdXMgYSBmZXcgYWR2YW50
YWdlcyBvZiB0aGUgZ3JlYXRlciBmbGV4aWJpbGl0eSBvZiB0aGUKPiBuZl90YWJsZXMgZnJhbWV3
b3JrLCBidXQgdGhhdCBoYXMgYWxtb3N0IG5vIGJlYXJpbmcgYSB0aGlzIHRpbWUpLgoKClRoYW5r
IHlvdSBmb3IgaW5mby4KCgo=
