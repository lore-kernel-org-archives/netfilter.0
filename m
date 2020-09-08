From: Siebzehn <siebzehntausend@gmail.com>
Subject: nftable - set in diffrent file
Date: Tue, 8 Sep 2020 15:36:38 +0200
Message-ID: <CAFJ60aphY-6CURLezocLb9rRHdW27O1TAoxxSs+1WPNH0Et9+g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=PeCrsJnt72NCcgADsTsJlAQ4LImZR4kPLJluWfPh0sQ=;
        b=psv/yHNdgMmTCzU6CtY0GVfJuZHyqogUfy7UaybJU+nV4QvgmsgjX3LJOPtXXzmWSG
         58N3O6jQEKQHa8h+dMwjz3TxUa3t9mM0rGcn6DqiLaZPeS4XJJT67v1qW/fa2QutENHt
         1Nf9PMPYowOtNIsDAfDHJTwGpMwcGkGNQuKk+TDXvkd/GpYMcPRpB1fCSrRPpW44grGO
         JtXpPSqgtoRrRAbBFAp0pdu+IrNQz4hXsfZd/zCiDioNnBNia/yNwhGUzQn329tPcSRJ
         Oly3p7H10/CzCPx2aDTbGcpste8222OCyvh/BFQHLzJho/dP4s3U/tX0jrNlBe28jdMT
         RbXw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

I got a problem with nftable Version 9.6
My ruleset is split in different files which get included in a single file.
Because of that I need to always specify the table name.
However I noticed that nftable can't find sets of other files.
It seems that nft can't find sets which were created in other table
specifications.

Errormessage:
nft -f TestB.nft
TestB.nft:14:13-16: Error: No such file or directory; did you mean set
=E2=80=98ips=E2=80=99 in table ip =E2=80=98inetfilter=E2=80=99?
                        ip daddr @ips accept
                                 ^^^^

  I'm sure that I wrote the tablename correctly!

Copy this into a single file to try it out yourself:


#!/usr/sbin/nft
table ip inetfilter {
set ips {
type ipv4_addr
}

} #Works if you comment this line
table ip inetfilter { #Works if you comment this line

chain forward {
type filter hook forward priority 0; policy accept;
ip daddr @ips accept
}
# Doesn't Matter
chain input {
type filter hook input priority 0; policy accept;
}
chain output {
type filter hook output priority 0; policy accept;
}
}


Copy till here!

The Config was loaded with "nft -f TestB.nft"

I hope you can tell me if i'm doing something wrong or that this is a
(fixable) bug

With Best Regards,

Siebzehn
