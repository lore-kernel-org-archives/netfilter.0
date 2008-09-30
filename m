From: "=?ISO-8859-1?Q?BJ=F6rn_Lindqvist?=" <bjourne@gmail.com>
Subject: Connection tracking UDP
Date: Tue, 30 Sep 2008 14:30:37 +0200
Message-ID: <740c3aec0809300530y2b87c478rf0029fd26e6e8567@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=0v5ao1t14JPP0v1LHDLXIQVkr/gHvzx1kEWz3xJX/Uk=;
        b=mAB3Nu/+jSXU0TuAqFvZ/NoM+Ptuques7ulnP+0gCT6oYvmIfs2mY4Eqro9SaKxgI4
         rB5d9JwOWpvio2tcZ+/k+DuoR4J18y21220fpxg2ZfZhoVsbzLk4DcZpm657H49MrFFa
         P+t7CMMm5ZmXvxgXLbzBfHknIf4a+b83+X894=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello all,

I have a problem with connection tracking, specifically that sessions
persists and are being erroneously reused.

=46or example, host A connects to host B using UDP via C and C adds one
session for the connection and puts it in the [UNREPLIED]
state. Shortly thereafter A reboots and will again try to connect to B
via C. Now the connection tracking seem to reuse the old session which
was in the [UNREPLIED] state. This causes strange problems with
dropped packets.

My question is, what is going on here and what can be done about it?
Is there even a point in connection tracking UDP connections when
problems like these occur?


--=20
mvh Bj=F6rn
