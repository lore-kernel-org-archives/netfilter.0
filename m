From: V Kurien <kurien.varugis@gmail.com>
Subject: Dumb question
Date: Thu, 9 Mar 2017 20:35:55 -0800
Message-ID: <CACmTqU=6TD+6CW7HmgbZ0V0ZyNq6hbgjCNXOkTBQirjeu0iBOA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=jJwTS+0+5ZLR/lYrKz2BueM99v+uxDjkUJpPnSIxCmw=;
        b=LMRUkTSviAF9URNTT986XHrTkC2eTjW17phfhO568H0xJraJCmoleLJgj1rJG9pGNL
         oUrmdhXwmB9oP0aSZzxAfezBR54lUVCR4jgdrWgEa1h45Ke8uy5dyZY9+TL/toromwVV
         saU1wvqJeMXogeAp1joiQ2z7uQl49I/G2laCg5IWMoiEZNdjQVIdAt6A5J9EqNdbQBG4
         snWNf3S+65ScnnRMBStzCulJs+eZbjL4w+njygeHwHBzcvfNmz2M6k4JTwYkLLPM6wml
         iICzrggI2SAPdlcHD6q03DeduoCSztW/hkNMj9mqex+trIo1yIjKL+ZRqo8sy3xVvOa4
         DryQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all
I'm trying to use ulogd2 to count flows and so I assume that I have to
create iptable rules to match the traffic that I care about.

Based on reading on the web, it seemed that I'd have to (this is on a
stock ubuntu-16.04 with a 4.4 kernel)

Assume that I want to match all TCP packets heading into the host;

(1) Create an iptables rule: iptables -A INPUT -p TCP  -j ULOG --ulog-nlgroup 1
(2) My ulogd.conf looks like:
.. all plugins included

stack=ct1:NFCT,ip2str1:IP2STR,print1:PRINTFLOW,emu1:LOGEMU

I get an error when I try to run the iptables command:

iptables: No chain/target/match by that name.

Clearly I am doing something insane, but what?
