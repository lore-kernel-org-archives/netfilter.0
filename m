From: =?UTF-8?B?56We5qW95Z2C546y5aWI?= <zh99998@gmail.com>
Subject: how to do port forwarding using nftables map
Date: Mon, 21 Sep 2015 10:09:25 +0800
Message-ID: <CAP8bwDUTn=zfWNjzypzLw5a4z7earJ6Ou2Uh4JHv_Am9uu_4Lw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=jqGS678+sc4p2/fztQNpRMjJzPEXgdsAlLVWHx67JE4=;
        b=Yu64qBVGJEGKPzVqfAgiQhTIWumEDEYyIcyLz2zxCGH5KIuNmYeCANvIb419lX3pxU
         F5DAByUWivDfUiyzwFiOaPLiEG+162QA7bxmleYHKY5z+KK14Q7IA0CVVP2FDwDI39j/
         lAn69e1MRl/S0ToXL5p4yJ8k7+NLSEnSlTHtFkrrbXZmk2piXcdUO4tZdmGIgebxGyqL
         qY+eQywtYWBxgqVMzrKk05168zg/mXXQ6quKiheTcdIfaMJ9WF4Rbwn4T+id3FyKz8Do
         3zcKG/6K9uZLX9kSPLDutr3NU4oNZg/mndQq/XOeOsLrfrEQ+BvTIUNnYDN3zZTUJZoE
         mWSQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm doing many port forwarding service on a linux server. There will
be many(may thousands of) port forward rule so I want to use nftables
map to improve performance rather than just many rules.

the policy will be [protocol : port -> address : port], like [tcp 1234
-> 1.1.1.1:4321], forward tcp 1234 port to address 1.1.1.1 same
protocol port 4321.
the protocol may only tcp and udp. so it's also ok if the key can
support only one port field. i can set maps and rules for each
protocol.

the problem is, how to define the value "ip:port" using map?

I tried create 2 maps, using

> nft add map nat forward_address {type inet_service : ipv4_addr \;}
> nft add map nat forward_port {type inet_service : inet_service \;}

but then I don't know how to set dnat rule....... seems the dnat
destnation can only accept one map value? and also i don't know how to
set "ip:port" as one value in map.
