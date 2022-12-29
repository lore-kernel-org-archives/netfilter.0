From: Martin Zaharinov <micron10@gmail.com>
Subject: NFT Flowtable HW Offload
Date: Thu, 29 Dec 2022 10:02:58 +0200
Message-ID: <80DB4032-71C6-416B-BB13-9DE27F77E8EC@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OEFmaE8vXuT1bXy7yU8jjxYv0zU/2yLIaM/Pfg2f0Zo=;
        b=lsjuTcy9EjIE/7Po1Y2eftkPLTomQCui9qj/3oSzSqE4Iz9MOGyXGim4uesm//XrIl
         c2qGWgiZF/IUsRviumYeZ92ZOYt8tFVXYNlL+kNFdDHscsL+c9eqgJ+q3EQKSquQHw63
         qqe1F0JnnDCTQMNvUuL2rENy7MiiFm/KjTP/6/BBFS2WsxWl68chw3Aqf53leJg/VklT
         qy4EWIEVOLwgFO7NBV2qqFK+D9FwHtiin5WNGeKgAFa2JED8vZql/zDucsBPkoXSVxIN
         R4Mk45KOoWd8YEePiQcBV8j3rnmC45J8pHd8pt95QPDilX1mxmC7GB4ZbgyW91RjQkNX
         FNnA==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Florian Westphal <fw@strlen.de>, pablo@netfilter.org, Paolo Abeni <pabeni@redhat.com>, netfilter <netfilter@vger.kernel.org>

Hi=20


I try to run offload table in hw mode

but receive this error when try to load rule

./test-nft:125:19-25: Error: Could not process rule: Operation not =
supported
        flowtable testflow {
                  ^^^^^^^
./test-nft:134:48-64: Error: Could not process rule: No such file or =
directory
                ip protocol { tcp, udp, icmp } flow add @testflow;
                                               ^^^^^^^^^^^^^^^^^



this is rule :


table inet filter {
        flowtable testflow {
                hook ingress priority 0
                devices =3D { eth0, eth1 };
                flags offload;
        }

        chain forward {
                type filter hook forward priority -400; policy accept;
                ip protocol { tcp, udp, icmp } flow add @testflow;
               =20
        }
}



Receive Ethernet card : Mellanox Technologies MT27800 Family =
[ConnectX-5]

This is Mellanox ConnectX5 100Gbe Dual port card, MCX516A-CCAT

I think this card support hw offload ,
Kernel is 6.1.1=20

How to enablee hw offload is there need other config ?

Best Regards,
Martin=
