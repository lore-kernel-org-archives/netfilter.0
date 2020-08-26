From: =?UTF-8?Q?Luis_Mario_Niedas_Hern=C3=A1ndez?= <lmniedas@gmail.com>
Subject: How deactivate a rule using nft cli?
Date: Wed, 26 Aug 2020 13:42:58 -0400
Message-ID: <CALtjan=Py8Qq95LZCg+kGJrW-MuOFo2+xPdy8-Nhf4a374sd0g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=r34nOE3r/0mHMmXF+icDWhc53OZW2fzVx1RAE0Iww6s=;
        b=VpBrAjipACm+hMjlHAVs8DIRvnYHHRVJC48kP12DqB9+V8m/A9JBxUW9oL2t1EMb1H
         fgSJoPOT9SNhPZcBHy9Wh4DdqhPPz85NP3yopZ8cxZhPE+2h0r3bRMeTESvvEL3EHMGe
         cTRP7shTuU6XvXWP+JekCGwV7akgJQmqTtXWZbxwP3C+ce5+rqkAtoD2DY0NARfp20+p
         vmAjduYMxoSnMI65UtGYLSQw69S59RwrU8SqtKlMms/F8KN3U0Xp+MxOw3uHUvB40UK6
         Stq5OvOfwiXEGQTMCIvTlnNyAwsPHJU1hiv4RP6NsT1IfskKMUpsFEtEwJOhgZDKkNh1
         HzuQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: netfilter <netfilter@vger.kernel.org>

Hello. I want to deactivate a rule in my nftables.conf. I just want that a
especific rule it is not considered by netfilter, but I don't want erased.
It is possible to do it?

I am a Spanish speaker, so, sorry if I made a mistake with the grammar.



--=20
"El futuro tiene muchos nombres. Para los d=C3=A9biles es lo inalcanzable.
Para los temerosos, lo desconocido. Para los valientes es la
oportunidad"
Victor Hugo
