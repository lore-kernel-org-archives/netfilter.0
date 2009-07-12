From: Ante Blaskovic <ante.blaskovic@gmail.com>
Subject: Routing traffic between two computers (3 network cards).
Date: Mon, 13 Jul 2009 00:59:02 +0200
Message-ID: <5b5eff110907121559i678a05far81567a7618d6c9c8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=rrDMw1iQTA3TreoXY0cViZxd6Y03gLXzaGRMW65trJg=;
        b=UoIvUHEXvGFPbw46E65GLVH8JDXEOhhhi3C/M7KBs9wUiG/aLEYmndRXqD+qjO+2qU
         INjOtRNC9GHrxgrJekgd0HWnOejP4SYcvmnpGRJKWTcwWM5XYe7yXzlDEc14w+Tb2e+Y
         3H3dcckbt+inJ2lYVMcZIW1ag4Wjt2MJKKjPw=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

I have two computers Comp1 and Comp2 with one virtual machine with
local IP. How can I make rule that will route traffic between
Comp1-78.x.x.234=C2=A0 and=C2=A0 Comp2-188.x.x.111 so that I can access=
 virtual
machine on Comp2. If I try to access Comp2 directly with rule bellow I
can reach machine on local IP 192.168.0.2 but I made rule to route
traffic in one direction (Comp1=C2=A0 to Comp2) but I don't know how to
link Comp2 to Comp1.

Comp1 - 78.x.x.234
*nat
-A PREROUTING -d 78.x.x.234/32 -j DNAT --to-destination 188.x.x.111
-A POSTROUTING -s 188.x.x.111/32 -j SNAT --to-source 78.x.x.234

Comp2 - 188.x.x.111 - this computer has virtual machine in host only
with local IP 192.168.0.2

*nat
-A PREROUTING -d 188.x.x.111/32 -m state --state
NEW,RELATED,ESTABLISHED -j DNAT --to-destination 192.168.0.2
-A POSTROUTING -s 192.168.0.2/32 -j SNAT --to-source 188.x.x.111


Regards,
Ante
