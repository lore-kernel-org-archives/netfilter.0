From: John Corps <envoys@gmail.com>
Subject: IPTABLES Setup for Internal Intranet
Date: Thu, 1 Mar 2012 15:07:42 -0500
Message-ID: <CAFURDX93mPW2capiuwB5vL8MP3hNEW3xHT85O=xEBKY8_Ew3Rg@mail.gmail.com>
References: <CAFURDX_e4eU8nKFSmweCKP_LaE9z_8S2cZrk93_r0UnKXGeYjA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=uszWS8SIez+efFJ/QvcDFV6yEag6kRVSB0DSjMfesGE=;
        b=YUN+M/8wpT2Nv2TVTxBG2qnfBeqI0S+A6/SKFfRQPSikcr4UqHb/93KhG6GEJMJukt
         XxjxwgzMee8e/Amc1bCYsoTYKMVw87FJOC6Y9v2Ys9FH294BVx994plvlxS+VFa4vsuR
         Z7IQ8UfXVX7RAHLJCJxB3090mht3P+kpXEmUFKhwBXlX9UZA6M3zqy9H522QvF2r5ern
         LiUvldssSGErVbGAfhzhjn0zeEw2NO/0CaWIJOLT8Q5PidFe5qCIgHE/cTqHblL9vF3R
         XeICXu2+DDc7l367W9oA+J566SI0tTHajcR5T/vwwAS67K326coarJ5q9ud0vJhDkx8w
         q6Yg==
In-Reply-To: <CAFURDX_e4eU8nKFSmweCKP_LaE9z_8S2cZrk93_r0UnKXGeYjA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello All,

I am attempting what is seeming to be an impossible scenario for some
unknown reason. What I want to do is setup a web server in a an
isolated vlan and on this vlan, the server is handing out IP addresses
via dhcp to the clients and setting there gateway to this server. What
I want to do is now, how do i make it so no matter what address they
try and go to using a browser, they are automatically redirected to
the internal web server saying that they do not have access to this
network. I have tried with a clean install of Debian and doing 1
single iptables rule of:

iptables -t nat -A PREROUTING -s 192.168.0.0/255.255.255.0 -p tcp -m
tcp --dport 80 -j DNAT --to-destination 192.168.0.1

Which should redirect all traffic going to port 80 to the internal web
server at 192.168.0.1.

This isn't working, but on the client I can go to http://192.168.0.1
and get the page saying they have no access.

Am i missing something here or should this work? if it should work,
can anyone try and help as to why it doesn't?

Thanks.
