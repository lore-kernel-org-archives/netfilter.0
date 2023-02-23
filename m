From: Fourhundred Thecat <400thecat@gmx.ch>
Subject: ipset: update timeout when IP matches
Date: Thu, 23 Feb 2023 12:04:44 +0100
Message-ID: <f326e979-1506-1685-6858-8a1d9746cb93@gmx.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.ch; s=s31663417;
        t=1677150284; i=400thecat@gmx.ch;
        bh=NTs8vUV23irgZp8oF5NgGRzgtBkDLjxdHA0SIlRvHhE=;
        h=X-UI-Sender-Class:To:From:Subject:Date;
        b=aEZyeLDcFrsm9dtUi0LtwBbigAPSSBCNa9OObnVsdUoiw5CAhKR+3oKWOtYsfG23/
         XAcd16MMXJds8iNOiUCiwd9Rw5pQd9Ql6DmZqg8A/mvWE/Y9XNKbQ4HD4xeWjyd8r4
         O8UmBTgNQD5cXDrbOuk11CZyrUkF05ew2ecRmJBtaSW5IriM3q6ya+03c1KYReZ/na
         p7OHs7EhHKZ8ddPVJglcHp3BWaJZXmy3/devSYJ8MyBEhBxUW/KiBx/6qZITVtSHu2
         o7EWXBN8WF5J6wIOXk1WoyQQ1p0Zb3AFyuivrw/4ZKSALKkOLqqIyiiRgw9W6ZG+oL
         b+En95p5vIcAQ==
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

I have an ipset named "PORTSCAN".

I allow traffic to legitimate ports, but if any IP tries to access
(scan) any other port, I add it to PORTSCAN.

The purpose is to protect my hidden services, here in this example
listening on 22222:


   -A INPUT -m set --match-set PORTSCAN src -j DROP
   ...
   -A INPUT -p tcp -m tcp --dport 22222 -j ACCEPT
   ...
   -A INPUT -j SET --add-set PORTSCAN src --timeout 3600


So, now when IP is alredy in PORTSCAN, in addition to DROP, I need to
update the timeout (reset to 3600 again), so that if IP continuously
tries to scan me, the timeout gets constantly extended/reset.

This was possible when I was using the "-m recent" module:

   -A INPUT -m recent --rsource --name GREYLIST --seconds 3600 --update
-j DROP

how can I update the timeout of IP in ipset?

