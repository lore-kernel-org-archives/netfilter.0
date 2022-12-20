From: ToddAndMargo <ToddAndMargo@zoho.com>
Subject: Re: nf_conntrack_helper replacement?
Date: Tue, 20 Dec 2022 11:50:15 -0800
Message-ID: <a39f6206-cb82-d8e4-c8ae-ba56be27d7a4@zoho.com>
References: <518aeae6-e89b-62f0-0a5b-86264a51edde@zoho.com>
 <eff246c8-14b1-c0e9-15e1-0650afdd780c@thelounge.net>
 <f9f9e14c-fee3-b09f-a32b-876783e14feb@zoho.com>
 <38b6e874-69f9-dd0a-6b60-269502405d0c@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1671565817;
        s=zm2022; d=zoho.com; i=ToddAndMargo@zoho.com;
        h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
        bh=QZj1LCTYXS76Lwev9B4j3sy6jTVXGqCx7uok/A9Pv1g=;
        b=UtEhoCAVyqbzDTGQ0ya36JrwEoERIJ1gGvW0B9UftilQfVt2SwPVbPTSdHIbPpPA
        5gHWimCdpGi8T4EPO1TxqsdJ5RFMVuJ7SRi9zqz9P7yrr0Jo01732sA3s2MmfwQ8kX7
        inT02yhPFtLtH+goC7PWuLQvdEghOZFpRqgSdsrs=
Content-Language: en-US
In-Reply-To: <38b6e874-69f9-dd0a-6b60-269502405d0c@thelounge.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Reindl Harald <h.reindl@thelounge.net>, netfilter@vger.kernel.org

T24gMTIvMjAvMjIgMTE6NDEsIFJlaW5kbCBIYXJhbGQgd3JvdGU6DQo+IGlwdGFibGVzLW5m
dMKgLXTCoHJhd8KgLUHCoFBSRVJPVVRJTkfCoC1wwqB0Y3DCoC0tZHBvcnTCoDIxwqAtasKg
Q1TCoC0taGVscGVywqBmdHANCg0KDQpXaGF0IGRvIEkgbmVlZCB0byBhbHRlciBvbiBteSBm
dHAgdGFibGVzIHRvIGdldCB0aGlzDQp0byB3b3JrPyAgRG8gSSByZW1vdmUgIi1tIGNvbm50
cmFjayI/DQoNCg0KJHRibHMgLUEgZHNsLW91dCAgLW8gJGV0aDEgIC1wIHRjcCAgLXMgJGV0
aDFfYWRkciAtLXNwb3J0ICR1bmFzc2duIA0KLS1kcG9ydCBmdHAgICAgICAgICAtbSBjb25u
dHJhY2sgLS1jdHN0YXRlIE5FVyxFU1RBQkxJU0hFRCAgICAgICAgICAgLWogDQpBQ0NFUFQN
Cg0KJHRibHMtbmZ0IC1BIGRzbC1pbiAgIC1pICRldGgxICAtcCB0Y3AgICEgLS1zeW4gLS1z
cG9ydCBmdHAgLWQgDQokZXRoMV9hZGRyIC0tZHBvcnQgJHVuYXNzZ24gLW0gY29ubnRyYWNr
IC0tY3RzdGF0ZSBSRUxBVEVELEVTVEFCTElTSEVEIA0KICAgICAtaiBBQ0NFUFQNCg0KJHRi
bHMtbmZ0IC1BIGRzbC1mb3IgIC1pICRldGgxICAtcCB0Y3AgICEgLS1zeW4gLS1zcG9ydCBm
dHAgLWQgDQokaW50ZXJuYWxfbmV0ICAtLWRwb3J0ICR1bmFzc2duICAtbSBjb25udHJhY2sg
LS1jdHN0YXRlIA0KUkVMQVRFRCxFU1RBQkxJU0hFRCAgLWogQUNDRVBUDQoNCiR0YmxzLW5m
dCAtQSBkc2wtb3V0ICAtbyAkZXRoMSAgLXAgdGNwICAtcyAkZXRoMV9hZGRyICAgICAgIC1k
ICRBTllfSVAgDQogICAgIC1tIGhlbHBlciAtLWhlbHBlciBmdHAgLW0gY29ubnRyYWNrIC0t
Y3RzdGF0ZSBSRUxBVEVELEVTVEFCTElTSEVEIA0KLWogQUNDRVBUDQoNCiR0YmxzLW5mdCAt
QSBkc2wtaW4gICAtaSAkZXRoMSAgLXAgdGNwICAhIC0tc3luICAtcyAkQU5ZX0lQIC1kIA0K
JGV0aDFfYWRkciAgICAtbSBoZWxwZXIgLS1oZWxwZXIgZnRwIC1tIGNvbm50cmFjayAtLWN0
c3RhdGUgDQpSRUxBVEVELEVTVEFCTElTSEVEICAtaiBBQ0NFUFQNCg0KJHRibHMtbmZ0IC1B
IGRzbC1mb3IgIC1pICRldGgxICAtcCB0Y3AgICEgLS1zeW4gIC1zICRBTllfSVAgLWQgDQok
aW50ZXJuYWxfbmV0IC1tIGhlbHBlciAtLWhlbHBlciBmdHAgLW0gY29ubnRyYWNrIC0tY3Rz
dGF0ZSANClJFTEFURUQsRVNUQUJMSVNIRUQgIC1qIEFDQ0VQVA0K
