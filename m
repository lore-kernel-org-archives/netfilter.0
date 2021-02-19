From: Psyspy 22 <psyspy2020@gmail.com>
Subject: libnetfilter_queue : Parsing payload
Date: Fri, 19 Feb 2021 08:38:14 -0700
Message-ID: <CAFqmWq-LNUpD0OFtxaz-KxUJ0nA_pPBRn_B_P2_UhfnzU=JcvA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=w1JNdTdKv6qhZDIm2f3gjH1l3XDCs/pLjM7rbg3IaeY=;
        b=qUZ/X48ChMIRk3MXOdCIasecJSMXBep89SywqyvCWfMtKzrTZxfYMGwAP12KQII/Ho
         PjpdJ2BUk4ydIuSHp7h3Nh5tb0nq4W5hWFDERMdSTG97xRETSR84k262QSqUDfa7r+4m
         t/M2V6nRvDhidWjIfIF5ghaYsO8DrEEelzoSbTDwE9YAHYKiesq/+kO3rTblGEWUBxf2
         uouAuV6xlEQgUng9q5eDnHP/OWWwIvcvpR4rsUuIFsMGtcPejSgqu1+U+IpK+OtmAp4z
         gXFt7ebepZRj9HWwawVy+0Glv7M5/xbxHMbIWHJMYW+2b10oTznbkD62LmZPm6Szl288
         8rvg==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I am using the example in the library's git repo.

1. Do I need to copy the payload to another buffer? I saw a few
examples (using the deprecated API) that use pktb_alloc to allocate
memory and then copy payload to it.

2. How do I parse the payload? Let's say the IP and TCP headers. Can I
use the nfq_ip_get_hdr helper function or is it deprecated too?

Thanks,
psyspy
