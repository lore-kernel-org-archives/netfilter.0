From: emacsuser emacs <emacsuser123@gmail.com>
Subject: Unable to broute packets containing VLAN tag
Date: Thu, 3 Nov 2016 13:19:38 +0100
Message-ID: <CALR9Cgch2XC_R8yk3sPK40RXo+4pY7tX+rMCbsFBsLGoBi=u6Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to;
        bh=2EMtZ2nkySTkFUnMv+whQ37L3swa9g15gpXEvKTZKiM=;
        b=TbYPJUZzuDhYgpsHO8s4VTS1d6w7NoVp4zTx0kbdJDcMHR2NHv8PE2UhmMA0h8Ipz8
         99fxWymDcVj3ZcTVaPQ27Ec8X+AUsEbxJuwe8XZYEFxJF6FNHSTi/IjgrFMTAvT5g25r
         Z32DBllT2D/zL1CS80o61Q3fIFeoE+CIkE+Iy5VPe7L29iVjqTb8XkS3SX3l3DiFrh9D
         ZhSkSrmuC9WiIQmVeTNXWZrNdm0d3TXTpDe30PQlYhBxDB9hlXYRWVxBc0zJQtzNXwa5
         BChCLAaWomDSpNHyhjRXigYKTsSgkNcxPuS7leNXqBDHhCXcTByI4ZqCXMtHK7Elga0r
         3UoQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello.

I'm having problems trying to broute packets from ebtables to iptables
(DROP target) when the packet contains VLAN tags.

My system is sniffing all packets coming from a tap interface, a
bridge is configured so that the interface is set to promiscuous mode.

When the packets does not contain the VLAN tags, everything works ok,
and the packet is sent to the iptables layer without any problem.

But when the packet contains VLAN info, the packet seems to get
dropped, and iptables layer does not receive it.

Please note that I need promiscuous mode both for destination MAC
addresses and VLAN tags. I mean, I want to sniff everything: all
packets going to anywhere and belonging to any VLAN.

Thanks.
-Bob
