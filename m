From: Umut Yerci <umutyerci@gmail.com>
Subject: ulogd unexpected character problem
Date: Fri, 16 Jan 2015 13:18:58 +0200
Message-ID: <CAHeaXY7qLe4y1Kwefg=hHdV6V+xtWDW7hCh1y3VUz-zGrCZMvA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=FWqWRPJ49k35SjwgmwP2huMGoBuiwL7d9kTLG47+HsU=;
        b=YXjT0oJQJgv8xI+xl4y7H7rJTvleKGyzrrN5pAgwh2lRYjS4Lvi7cDpl3DsK3tE0lt
         6ipZfvcvnu0s39UyC79d8JZM2iZGFJVCkXHpMzeOCt3+9vIDZlbx2zHzcw7nBAvQvuth
         j95BikDNF+XpYlqmUptRy3AKkcLlC4UCtZlfze260CAcerov4R3xkTo6ujCh3DGiOIjw
         3eUB19fj8aj9uLqXQxBGZGyamI4eeTjACIm6FSJW7I7UlapXlXtrErp4yz9n+VhnuGCu
         Wh65GPSVgfe/vV0Hlvz+z3eTKY/M0Bwo+uqpm7uQwNEz+fZgpYlj4GznNjGCd4TkoVNU
         6gMA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi,

I use ulogd in my system version 2.0.2. It write logs to syslog.
However there is unexpected characters in log rows like;
IN=3D=C3=AF=C2=BF=C2=BD=C3=AF=C2=BF=C2=BD OUT=3D MAC=3D LEN=3D0 TOS=3D0=
0 PREC=3D0x00 TTL=3D0 ID=3D0 PROTO=3D0 MARK=3D10dcc00
IN=3D\"6 OUT=3D MAC=3D LEN=3D0 TOS=3D00 PREC=3D0x00 TTL=3D0 ID=3D0 PROT=
O=3D0 MARK=3D123_123
IN=3D=C3=AF=C2=BF=C2=BD6 OUT=3D MAC=3D LEN=3D0 TOS=3D00 PREC=3D0x00 TTL=
=3D0 ID=3D0 PROTO=3D0 MARK=3D10dcc00
IN=3DI=C3=AF=C2=BF=C2=BD OUT=3D MAC=3D LEN=3D0 TOS=3D00 PREC=3D0x00 TTL=
=3D0 ID=3D0 PROTO=3D0 MARK=3D10dcc00
IN=3DM OUT=3D MAC=3D LEN=3D0 TOS=3D00 PREC=3D0x00 TTL=3D0 ID=3D0 PROTO=3D=
0 MARK=3D123_123
IN=3D]4 OUT=3D MAC=3D LEN=3D0 TOS=3D00 PREC=3D0x00 TTL=3D0 ID=3D0 PROTO=
=3D0 MARK=3D123_123
IN=3Dr4 OUT=3D MAC=3D LEN=3D0 TOS=3D00 PREC=3D0x00 TTL=3D0 ID=3D0 PROTO=
=3D0 MARK=3D123_123
IN=3D=C3=AF=C2=BF=C2=BD4 OUT=3D MAC=3D LEN=3D0 TOS=3D00 PREC=3D0x00 TTL=
=3D0 ID=3D0 PROTO=3D0 MARK=3D10dcc00
IN=3D=C3=AF=C2=BF=C2=BD=C3=AF=C2=BF=C2=BD OUT=3D MAC=3D LEN=3D0 TOS=3D0=
0 PREC=3D0x00 TTL=3D0 ID=3D0 PROTO=3D0 MARK=3D10dcc00

I add file destination to ulogd. After that I watch strace command for
ulogd. I see that it read wrong file destination from RAM ( There is
some unrelated keyword in recvfrom).
What is cause of this bug?

Thanks for helping.
