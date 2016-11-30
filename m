From: Martin Bednar <martin@serafean.cz>
Subject: nft segfault
Date: Wed, 30 Nov 2016 22:39:21 +0100
Message-ID: <20855707.G7Z9XjzS46@nemmerle>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=serafean.cz;
        s=default; t=1480542057;
        bh=OkqHreQtVEix2JpXmj6dMI6ET7RTA5e9klOB0Zb1dv4=;
        h=From:To:Subject:Date;
        b=0VhDT1Jm0jSNKi7dJ3rUQO3dRQ5L42OEspN9jsTy1gR2xd+/e5bvqGVBKFxKe7+JC
         lsoqQSCLJe1DV4ComLJDDhJarXVQjQ1WO37JNCoisrtZ2ppQDM1S0/WXjXiA1Fuo8X
         Cxjm8ld028qRMuvh+QZ7tnhdFjcmPChS4tkM11ePIkgWQb1dz3UV2UFf/ghM94Ekbl
         V+SxaUieK+Q3gkQKLx9DRBB7afgrkrDSsYalibCLilAv86GukxFab15KYrnnhOjK6R
         aguWo8IIZ2uOCcl77dpw4MDUX7JfBHu9j9tsrDuNr8nmQJGFBM/TqPK2QCYT6cs+qE
         u/J47YAAX4tVg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I'm trying to build a slightly complex home router firewall using nftables 
(will share once it is done). 
using nft v 0.6, I get a segfault.

Backtrace : 
#0  __strcmp_ssse3 () at ../sysdeps/x86_64/multiarch/../strcmp.S:209
#1  0x0000000000406c74 in set_lookup ()
#2  0x000000000040fd80 in setelem_evaluate ()
#3  0x000000000042a5ed in nft_parse ()
#4  0x0000000000405ffd in nft_run ()
#5  0x0000000000405bfe in main ()


minimal config to reproduce:

define if_wan = wan

table inet filter{
        map iface_rules {type iface_index : verdict;}
        chain forward {
        type filter hook forward priority 0; policy drop;
        oif $if_wan accept
    }

}
add element inet filter iface_rules { lo : accept }

if_wan must be set to a non-existant interface.
commenting out oif $if_wan accept also works around it.

Martin.

