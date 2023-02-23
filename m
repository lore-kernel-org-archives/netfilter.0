From: Kerin Millar <kfm@plushkava.net>
Subject: Re: ipset: update timeout when IP matches
Date: Thu, 23 Feb 2023 11:34:06 +0000
Message-ID: <20230223113406.ac79681eb436e15c44b0a6a2@plushkava.net>
References: <f326e979-1506-1685-6858-8a1d9746cb93@gmx.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-transfer-encoding:content-type:date:date:from
        :from:in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1677152049; x=
        1677238449; bh=0QAnF3Urev4o4LTsZzK+YbEZH3mQO/piYEgBKB5HgF4=; b=i
        f0UxaqzDSMtfOYcaXgjVhPsw190I2ViP/Z2ua9g16JFmNO541JHI1w0zeh5Z/4wJ
        PB2mVBRYVSiOO0qy2b+Eo5Q3H4dGfLRmRhM/J2O4Zqn+rYku3fw5Elk2m1q4RkGb
        M4yaahD8AZi0rHw2O7axpoBBgu4q+2Tr894zXCA28brwKsVFlDeUiMBSeesPHRal
        dhQb+V3uf9GxXIPitoBjtADCpVw1QcIwMNoNePYQSFyLgzusyFM3QQ2OK3flnLN1
        aYhhyzB8KGoIck1lrp1FJMaFrvRXuCi4n7L0EOImrFyJ/LabdhTHPIJ70tvLpykQ
        4V1Q1HNHn5hQiSmvTWeYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677152049; x=
        1677238449; bh=0QAnF3Urev4o4LTsZzK+YbEZH3mQO/piYEgBKB5HgF4=; b=e
        9goRyZIyAEWNbmqQt4srKI0ksopqHRdC4f4WoeyAxAXzTWyWbSv0RVe82Jbv/Z3s
        6Q4PHGDtjXY6FJ5V6RQC64/Zyzr+/FxhhV+u4lhlbUXV1VHZY9gm3NYC+YLhCiMs
        HZR5A/3I9D8IxmNVf5Qh7P8fVY7eiQmsR2ofLln58dajOQX2iCZdZt/tsqcnFfeL
        62yml29VE6/8kH7QAUTO8Vo28vslVqJwkdA5zd/Q3UWLavyV+WrvbuioSS0UOzNW
        yWj2oeuIqIRnviEzmT00XkkCEwof32oyVCHYizKkxtvui8LlpkmXJIx9kz2m0s3x
        AXIriiv2h2jC7z9BPOXNg==
In-Reply-To: <f326e979-1506-1685-6858-8a1d9746cb93@gmx.ch>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Fourhundred Thecat <400thecat@gmx.ch>
Cc: netfilter@vger.kernel.org

T24gVGh1LCAyMyBGZWIgMjAyMyAxMjowNDo0NCArMDEwMApGb3VyaHVuZHJlZCBUaGVjYXQgPDQw
MHRoZWNhdEBnbXguY2g+IHdyb3RlOgoKPiBIZWxsbywKPiAKPiBJIGhhdmUgYW4gaXBzZXQgbmFt
ZWQgIlBPUlRTQ0FOIi4KPiAKPiBJIGFsbG93IHRyYWZmaWMgdG8gbGVnaXRpbWF0ZSBwb3J0cywg
YnV0IGlmIGFueSBJUCB0cmllcyB0byBhY2Nlc3MKPiAoc2NhbikgYW55IG90aGVyIHBvcnQsIEkg
YWRkIGl0IHRvIFBPUlRTQ0FOLgo+IAo+IFRoZSBwdXJwb3NlIGlzIHRvIHByb3RlY3QgbXkgaGlk
ZGVuIHNlcnZpY2VzLCBoZXJlIGluIHRoaXMgZXhhbXBsZQo+IGxpc3RlbmluZyBvbiAyMjIyMjoK
PiAKPiAKPiAgICAtQSBJTlBVVCAtbSBzZXQgLS1tYXRjaC1zZXQgUE9SVFNDQU4gc3JjIC1qIERS
T1AKPiAgICAuLi4KPiAgICAtQSBJTlBVVCAtcCB0Y3AgLW0gdGNwIC0tZHBvcnQgMjIyMjIgLWog
QUNDRVBUCj4gICAgLi4uCj4gICAgLUEgSU5QVVQgLWogU0VUIC0tYWRkLXNldCBQT1JUU0NBTiBz
cmMgLS10aW1lb3V0IDM2MDAKPiAKPiAKPiBTbywgbm93IHdoZW4gSVAgaXMgYWxyZWR5IGluIFBP
UlRTQ0FOLCBpbiBhZGRpdGlvbiB0byBEUk9QLCBJIG5lZWQgdG8KPiB1cGRhdGUgdGhlIHRpbWVv
dXQgKHJlc2V0IHRvIDM2MDAgYWdhaW4pLCBzbyB0aGF0IGlmIElQIGNvbnRpbnVvdXNseQo+IHRy
aWVzIHRvIHNjYW4gbWUsIHRoZSB0aW1lb3V0IGdldHMgY29uc3RhbnRseSBleHRlbmRlZC9yZXNl
dC4KPiAKPiBUaGlzIHdhcyBwb3NzaWJsZSB3aGVuIEkgd2FzIHVzaW5nIHRoZSAiLW0gcmVjZW50
IiBtb2R1bGU6Cj4gCj4gICAgLUEgSU5QVVQgLW0gcmVjZW50IC0tcnNvdXJjZSAtLW5hbWUgR1JF
WUxJU1QgLS1zZWNvbmRzIDM2MDAgLS11cGRhdGUKPiAtaiBEUk9QCj4gCj4gaG93IGNhbiBJIHVw
ZGF0ZSB0aGUgdGltZW91dCBvZiBJUCBpbiBpcHNldD8KClRoZSBmb2xsb3dpbmcgb3B0aW9uIGlz
IGRldGFpbGVkIGJ5IGlwdGFibGVzLWV4dGVuc2lvbnMoOCkuCgotLWV4aXN0CiAgICAgICB3aGVu
IGFkZGluZyBhbiBlbnRyeSBpZiBpdCBhbHJlYWR5ICBleGlzdHMsICByZXNldCAgdGhlICB0aW1l
b3V0CiAgICAgICB2YWx1ZSAgdG8gdGhlIHNwZWNpZmllZCBvbmUgb3IgdG8gdGhlIGRlZmF1bHQg
ZnJvbSB0aGUgc2V0IGRlZmnigJAKICAgICAgIG5pdGlvbgoKLS0gCktlcmluIE1pbGxhcgo=
