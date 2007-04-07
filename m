From: "Patrick Ale" <patrick.ale@gmail.com>
Subject: [PATCH] ip_tables.h
Date: Sat, 7 Apr 2007 19:43:16 +0200
Message-ID: <8d158e1f0704071043w5483f60ayc9f240abb1039392@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_6821_31053376.1175967796823"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S966193AbXDGRnV@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type;
        b=hSPf3XsHzt/zjpDfelgYYzxgsaxQrlJKFv7/QUqmrGfVbLd0nW4ZGrSa8UctQP3VW8PZGxY86JhXJn5xhOX3PbPscI/oj+5QgFkrsu5l17F3cBTsb8Zma7qpvqQJuBAO93/UPdZ+ThSl9gXK7/oVgDYE6tfPK0kjjRsXtIYoR3k=
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
To: linux-kernel <linux-kernel@vger.kernel.org>, netfilter@lists.netfilter.org

------=_Part_6821_31053376.1175967796823
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi lads,

I had some problems compiling the external netfilter modules due to
missing definitions.
I googled a lot, saw a lot of people having the same problems but no
real answer to how to fix it.

So.. I made a little patch which make things work for me, at least.

Modules that work after applying the patch are the geopip module,
connlimit module, and prolly more, but I didnt test them.

Please note, I am not a coder, not a maintainer and I am happy that I
didnt break anything so please don't consider this as a proposal to
include in the kernel or something, I am just in favor of sharing what
helped me getting things to work, if i can help others with it or if
it is interesting material for inclusion, even better :)

So, the patch is attached in this email and can also be found on
http://www.patrickale.eu/documents/archives/patches/ip_tables.h.diff


I hope this helps a people or two.


Patrick

------=_Part_6821_31053376.1175967796823
Content-Type: text/x-patch; name="ip_tables.h.diff"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="ip_tables.h.diff"
X-Attachment-Id: f_f08f4o42

LS0tIGluY2x1ZGUvbGludXgvbmV0ZmlsdGVyX2lwdjQvaXBfdGFibGVzLmgub3JpZyAgICAgICAy
MDA3LTA0LTA3IDIwOjMwOjI1LjM0NDM2NTcwNyArMDIwMAorKysgaW5jbHVkZS9saW51eC9uZXRm
aWx0ZXJfaXB2NC9pcF90YWJsZXMuaCAgICAyMDA3LTA0LTA3IDIwOjM0OjA1LjA3Njg4NzU1MCAr
MDIwMApAQCAtMzQsNiArMzQsMTIgQEAKICNkZWZpbmUgaXB0X3RhYmxlIHh0X3RhYmxlCiAjZGVm
aW5lIGlwdF9nZXRfcmV2aXNpb24geHRfZ2V0X3JldmlzaW9uCgorI2RlZmluZSBpcHRfcmVnaXN0
ZXJfbWF0Y2gobXRjaCkgICAgICAgIFwKKyh7ICAgICAgKG10Y2gpLT5mYW1pbHkgPSBBRl9JTkVU
OyAgICAgICBcCisgICAgICAgIHh0X3JlZ2lzdGVyX21hdGNoKG10Y2gpOyB9KQorI2RlZmluZSBp
cHRfdW5yZWdpc3Rlcl9tYXRjaChtdGNoKSB4dF91bnJlZ2lzdGVyX21hdGNoKG10Y2gpCisKKwog
LyogWWVzLCBWaXJnaW5pYSwgeW91IGhhdmUgdG8gemVybyB0aGUgcGFkZGluZy4gKi8KIHN0cnVj
dCBpcHRfaXAgewogICAgICAgIC8qIFNvdXJjZSBhbmQgZGVzdGluYXRpb24gSVAgYWRkciAqLwoK

------=_Part_6821_31053376.1175967796823--
