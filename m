From: "Timothy Toole" <timothy.toole@gmail.com>
Subject: MAC Address masking/NAT
Date: Fri, 17 Oct 2008 00:13:47 -0600
Message-ID: <1460c7de0810162313t28b5cd7ete6dda27e534ae55d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=FaZXnO4CyfpCyMJFFpNivyaaaHwWyoGRqInBmPIIV3k=;
        b=JNcZMgnexkngKJtGX8kvAvWyoQ88imcVxheEhmUm8V0x3R28rOWtYc+I++SMk3NCJ7
         pbmPos1M6cGzGPq8P1YIbXdixhR5bSMx2O7UWhhk7wnFX6Pm3ZJ/1mEJfrpU0wst0DyG
         V/LAOpeX5NTxEiyhyyMz+MoMIS4cvBr1Uhgi8=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

Apparently, I'm just not getting some of the tables and chains
concepts enough to make the following scenario work. Any help would be
greatly appreciated.

I have a bridge setup between two computer systems. To be more
detailed, the bridge (br0) is setup on a Linksys WRT54GL across two of
the switch ports that have been VLAN tagged (eth0.1 and eth0.2). In
this setup, Host A and Host B communicate as expected.

What I'd like to do is use iptables or ebtables to.... change the MAC
address of Host B as packets traverse the bridge. Host A will only see
the "changed" MAC address, not the actual one of Host B.

Here's a lame ascii art diagram:

              ____________________
             |                    |
             |        br0         |
             |                    |
             | eth0.1      eth0.2 |
             |__/______________\__|
               /                \
              /                  \ <--- Translate MAC to
             /                    \     11:11:11:22:22:22
            /                      \
           /                        \
       ___|___                    ___|___
      |       |                  |       |
      |   A   |                  |   B   |
      |_______|                  |_______|
MAC: 00:11:22:33:44:55      MAC:55:44:33:22:11:00

Can this be done? Also, if I don't know the MAC address of either
host, can a rule be written as a "catch-all" to change any MAC that's
plugged in?

Many Thanks.

-tim
