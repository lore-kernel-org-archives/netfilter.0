From: Fabio Pedretti <fabio.pedretti@unibs.it>
Subject: About using -i with MASQUERADE
Date: Fri, 22 Jan 2016 12:53:02 +0100
Message-ID: <CAGpfsQ2qF0htCZQ3SmKR15Gs0huWBy=Es3c_5hh4QsRQ_CM3oQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unibs.it; s=google;
        h=mime-version:from:date:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=hRtdx8JcKqWDiWkXaja8KyVxvWbiZv8NjQaN5czlVkU=;
        b=AMuay8slDrTYKF4ZMvL8LYT8zQj+jzFaDOy7rDp5PspsoqQCDbZhuQzDRrE/pTgnnv
         WW+CBxhrtK+ox2ab3vY81fa4HjdPUMch4LLDj0yIuWdNUNHkZ+3LQilOGyG5LOoZLglk
         zaQDKvxnKJKZESBh+1XWJUxTdUieoIsAow+LI=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: netfilter@vger.kernel.org

Hi, I would like to do the following:
-t nat -A POSTROUTING -i eth3 -j MASQUERADE

but I get this error:
iptables v1.4.21: Can't use -i with POSTROUTING

So I am plannig to use:
-t nat -A POSTROUTING -s 192.168.0.0/24 -j MASQUERADE

However I find the latter, working solution less smarter than the
first, non working. For example I should add rules for every network
coming from that interface that may also change in the future.

Is there a reason why -i is forbidden?
Is there a better solution than using -s?

Thanks.

--=20
ing. Pedretti Fabio
Responsabile U.O.C. "Reti e Sistemi"
http://www.unibs.it/organizzazione/amministrazione-centrale/servizio-se=
rvizi-ict/uoc-reti-e-sistemi
Universit=C3=A0 degli Studi di Brescia
Via Valotti, 9 - 25121 Brescia
E-mail: fabio.pedretti@unibs.it

--=20
Informativa sulla Privacy: http://www.unibs.it/node/8155
