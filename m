From: Daniel <tech@tootai.net>
Subject: Redirect all traffic or range of ports to an IP
Date: Sat, 3 Jul 2021 16:13:50 +0200
Message-ID: <f6701047-5ad2-2204-9eee-d8c3ca325574@tootai.net>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1625321631; bh=MXedrfAQxRB8tTUG99ovHCyfoqNYCrOmSgCR5e9MNOw=;
        h=To:From:Subject:Date:From;
        b=dWkv0WZV5ed0sn5phKSJyuh2QfE5PsqlZFUU1Xn5pTJwzPiIgVmFfTSYkb+6gh62e
         SljN165z3Lghl4kuXp4qzX6FWvpFpCp/jJZNzI4HTm0O4dBL/2q3kZJhd74A3vC5U1
         gdXuThlVwlfSSvyQ87Tfd0+1QorB6TpFMjcz9iRU=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1625321631; bh=MXedrfAQxRB8tTUG99ovHCyfoqNYCrOmSgCR5e9MNOw=;
        h=To:From:Subject:Date:From;
        b=dWkv0WZV5ed0sn5phKSJyuh2QfE5PsqlZFUU1Xn5pTJwzPiIgVmFfTSYkb+6gh62e
         SljN165z3Lghl4kuXp4qzX6FWvpFpCp/jJZNzI4HTm0O4dBL/2q3kZJhd74A3vC5U1
         gdXuThlVwlfSSvyQ87Tfd0+1QorB6TpFMjcz9iRU=
Content-Language: fr-FR
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed"
To: Netfilter list <netfilter@vger.kernel.org>

SGkgbGlzdCwKCkkgZmFjZSBhbiBlcnJvciB3aGlsZSB0cnlpbmcgdG8gcmVkaXJlY3QgYWxsIHRy
YWZmaWMgdG8gYW4gSVAuIExldMWbIHNheSAKSSB3YW50IHRvIHJlZGlyZWN0IGFsbCBpbmNvbWlu
dCB1ZHAgdG8gMTAuMTAuMTAuMTAgaW50ZXJuYWwgYWRkcmVzcy4KCk15IHJ1bGVzIGFyZSB3b3Jr
aW5nIHByZWZlY3RseSB3aGVuIHJlZGlyZWN0aW5nIHVuaXF1ZSBwb3J0cy4gSSB1c2UgCnRob3Nl
IHJ1bGVzCgokZnd0YWJsZXMgYWRkIGVsZW1lbnQgaXAgbmF0IGZ3ZHRvaXBfdWRwLmV0aDAgeyAk
c3JjcG9ydCA6ICRteWRhZGRyIH0KJGZ3dGFibGVzIGFkZCBlbGVtZW50IGlwIG5hdCBmd2R0b3Bv
cnRfdWRwLmV0aDAgeyAkc3JjcG9ydCA6ICRkc3Rwb3J0IH0KCmFuZCB0aGVuCgokZnd0YWJsZXMg
YWRkIHJ1bGUgaXAgbmF0IHByZXJvdXRpbmcgZG5hdCB1ZHAgZHBvcnQgbWFwIApAZndkdG9pcF91
ZHAuZXRoMCA6IHVkcCBkcG9ydCBtYXAgQGZ3ZHRvcG9ydF91ZHAuZXRoMAoKSWYgJHNyY3BvcnQ9
JGRzdHBvcnQ9MS02NTUzNCBJIGdldCAiRXJyb3I6IHZhbHVlIG11c3QgYmUgYSBzaW5nbGV0b24i
IApmb3IgdGhlICRkc3Rwb3J0IHdoZW4gYWRkaW5nIGVsZW1lbnQuCgpJcyB0aGVyZSBhIHdheSB0
byAgdXNlIHRoaXMgY29uZmlndXJhdGlvbiB0byByZWRpcmVjdCBhbGwgdHJhZmZpYyB0byBhbiAK
SVAgb3Igc2hvdWxkIEkgY3JlYXRlIG90aGVyIHJ1bGVzID8gQlRXLCBwcm9ibGVtIGlzIGFsc28g
ZXhpc3RpbmcgaWYgSSAKd2FudCBybyByZWRpcmVjdCBwb3J0cyBsaWtlIDIwMDAwLTMwMDAwIGZv
ciBlZyBSVFAuCgpUaGFua3MgZm9yIGFueSBoaW50Ci0tIApEYW5pZWwK
