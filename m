From: Kent Shultz <kentmshultz@gmail.com>
Subject: ULOG target in ip6tables?
Date: Wed, 25 May 2011 13:42:13 -0700
Message-ID: <BANLkTinm9MVSCrFH+Yk2uonuUK7Tyni9QQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=qAsKCpYlBSZLn2CTeBqohMm1aL66deRKTvcPYXoC/n0=;
        b=QzmkJv6h/Anyq45bU079LCQr/siX9yA4B1YtsYVPRbS/y41F0kQPdX2EsLJzjRjtpN
         ypptkQ2MkER+TI33OT5Mw/ACYDkMNst3Oh0vrXioovOOsjO5a3p+2JjZt892eV9u2ENC
         N/h3+fTR5WA7McMS0ZWZEq/r/kGt6e3F8kf60=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I am trying to get ulogd to work with ip6tables, but it seems there is
no support for a 'ULOG' target -- there is no such file as
'libip6t_ULOG.so' in my iptables lib directory.

Does anyone know how to use ULOG as a target in ip6tables rules?

By the way, I'm running iptables/ip6tables v1.3.5 and ulog v1.24

Thanks,
Kent
