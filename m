From: Bruno Fiss <bruno_fiss@yahoo.com.br>
Subject: Help to schedule nf_register_hook
Date: Wed, 22 Apr 2009 09:31:10 -0700 (PDT)
Message-ID: <254744.23543.qm@web52410.mail.re2.yahoo.com>
Reply-To: bruno_fiss@yahoo.com.br
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com.br; s=s1024; t=1240417870; bh=z2IUNAASZelfLP+9Mq4kdo+UmKjXWe76RenqTCRvHjA=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=1GoXr8pB9mt/Z+6MzQ+4mOtiIaAQ7Fk3uOoCU9CMxk+HMN2m/gJFmlvHff+2m2U40hPeEgrabLEs+k0TdVA3RhW97i4VEbzHbz5lKgCMRJYBkG3ug1Oc1NObAd6xFWVeE+gWqsp4hH2RAWHLpfVKVYJ+7RC+u5PMmpX6zl9r0jY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org


Hi,

I want to schedule the registration of a hook. I tried using kernel's s=
truct timer_list, but I've been having problems with that. I thought th=
at maybe you are not supposed to call nf_register_hook from within a fu=
nction that's been registered in a kernel timer (wonder if it has to do=
 with being or not being in the userspace). I'd like some help on that.

I'll give an example of what I'm trying to do:

void foo () {=20
        unsigned long parameter;
        ...
        DEFINE_TIMER( timer, secfoo, jiffies + 250, parameter);
        ...
        add_timer(timer);
}

void secfoo( unsigned long param ) {
        ...
        nf_register_hook(...);
        ...
}

If I comment the "add_timer(timer);", and put this line instead:

secfoo( parameter );

It works out as I intended. But if I do it like it is written, I get a =
kernel panic.

I realize this may be simple, or maybe foolish, but I've been wanting t=
o solve this problem for a while. If this panic was not supposed to hap=
pen, then I'll try to give all the information possible about the probl=
em.       =20

Thanks in advance,

Bruno Fiss



      Veja quais s=E3o os assuntos do momento no Yahoo! +Buscados
http://br.maisbuscados.yahoo.com
