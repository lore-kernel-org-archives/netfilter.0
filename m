From: Siebzehn <siebzehntausend@gmail.com>
Subject: nftable with sets in diffrent files
Date: Tue, 8 Sep 2020 16:05:57 +0200
Message-ID: <c5b85962-826d-51f9-6a5a-d1fce7affcd2@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=984FvA1ctzl7d9mOLE8yyQnlpAHtQIPmE37ULMjrJn4=;
        b=hP40RsZT9XzkRif+CMO1jHDGk8+J8goDDKrUMJzLFKHfZwVO97qsPoNLVRpNxx3At8
         Kve9162J93EaD0oOvUnoBexa2x5LUGZZ92mA09NN40QB826rT9tp6HFHEvIX34QuPL7E
         CimET3Ku1aWKkcY2GDINoLXGwLomqUVNaH6DCudVG4A6Ri+t9zWy850jwruO1Xypwwac
         aXsmT0K5rO+u0Tu2dR9PpR6MY1VLQmLzUjXsGn62Fbj4L8/EaL6AoH085dMJgxw1Rq/d
         agpuvIE/OzggOvgSOdbJR1Pwdfw/o8ks+gDStpGJcf/i9p34CNSuXL+YJIGOaiWZhsyc
         S9KA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

I got a problem with nftable (Version 9.6)
My ruleset is split in different files which get included in a single file.
Because of that I need to always specify the table name.
However I noticed that nftable can't find sets of other files.
It seems that nft can't find sets which were created in other table
specifications.

Errormessage:
nft -f TestB.nft
TestB.nft:14:13-16: Error: No such file or directory; did you mean set
'ips' in table ip 'inetfilter'?
                         ip daddr @ips accept
                                  ^^^^
(the ^ are below @ips)

I'm sure that I wrote the tablename correctly.

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


Copy till here.

The Config was loaded with "nft -f TestB.nft"

I hope you can tell me if i'm doing something wrong or that this is a
(fixable) bug

With Best Regards,

Siebzehn

