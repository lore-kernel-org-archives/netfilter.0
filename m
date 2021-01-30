From: Frank Myhr <fmyhr@fhmtech.com>
Subject: nftables typeof concatenation support for vmap?
Date: Sat, 30 Jan 2021 11:58:50 -0500
Message-ID: <96359217-05e8-53e7-5700-14484043506d@fhmtech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:Subject:From:To; bh=El6xWSip8z1y3ww9GLBB2gHgBpGx8bgtIEL96fcTyuI=;
        b=QToBF50VR03UaHJCiRSmTUZDU5rfMYPK7jQEjVa3LtXTKAgkQBD0L9vKzRcMk1NleC3h84hKfK1ZY9iR/F9eEJjVO7sowZpJZe6FPAtt2HNWk0AAB581g35Wrof2fkTNd3MID+6wvAcHY/SoTEHWFhuBo8c8pyg3sPp0z2snOBU=;
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

The typeof concatenation supported by map since nftables 0.95 got me 
excited about using it to goto a chain based on incoming interface and 
requested service. There are some service requests I want to dnat, so I 
tried defining a vmap:

table ip ip_nat {
   map dnat_srv {
     typeof        iifname . ip protocol . th dport : verdict
   }
}

But this fails:

Error: primary expression type 'symbol' lacks typeof serialization
     typeof        iifname . ip protocol . th dport : verdict
                                                      ^^^^^^^

nft parses the following similar "plain" (non-verdict) map without error:

table ip ip_nat {
   map dnat_srv {
     typeof        iifname . ip protocol . th dport : meta mark
   }
}

So it appears that vmaps, unlike plain sets and maps, do not support 
typeof concatenation. I'm running Debian 10 with

kernel 5.9.15-1~bpo10+1 (2020-12-31) x86_64
nftables v0.9.6 (Capital Idea #2)

Are there any plans to support typeof concatenation for vmap? (Or maybe 
it's already supported and I'm botching the syntax or otherwise doing 
something silly?)

Guess I'll refactor my rules for now...

Thanks,
Frank
