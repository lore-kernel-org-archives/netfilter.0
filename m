From: pauloric@contatogs.com.br
Subject: Re: Automatically maintaining unique list of addresses
Date: Wed, 19 Feb 2020 08:01:33 -0300 (BRT)
Message-ID: <1503010567.303.1582110093370.JavaMail.zimbra@contatogs.com.br>
References: <ab8bf7b2-d135-2e4b-b9a9-7c917f113ddf@gmx.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 mercurio.contatogs.com.br B3F7640651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=contatogs.com.br;
        s=547D7A06-2322-11E9-835A-A37390E63B7D; t=1582110094;
        bh=swvN2axwfovFdbRWipmDvP5ceNEdZZGsr1z47a3FWrk=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=Xxc2fnct5pBYtZOjsqWOTBtpfgCYq1AJ+VCqSauc731Ax6EYbR9wVzJMFmGdTb/eq
         4nvkRcAzW5S09xMEjTLNbj+k+JXyop4Pmh/sOkjVAiCMW2Icb67DdsQBj+7Q8UnmiH
         ryj5hQ+p2yOJymYshZOHiREzkrMUuzkaDoJf8D4Qjt0Y3Ua7p2S+VjtjzAD/VY1mHf
         pt7LFdEYHEsijsqFsxw/NtzlSrv+sdO5IRLSbkYE5ZnaFb7aYz6dUgV2IJlEQbDffR
         63EqvFxCpjHS5zD1Gm2YWqJoFXLQm+r02tyqqChWaYdSJwopOiprf7OV+I3yC2Emno
         +fOGOQo0kIIqg==
In-Reply-To: <ab8bf7b2-d135-2e4b-b9a9-7c917f113ddf@gmx.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: netfilter <netfilter@vger.kernel.org>

Hi

You can use named sets ( https://wiki.nftables.org/wiki-nftables/index.php/=
Sets)
 or=20
a dictionary...(https://wiki.nftables.org/wiki-nftables/index.php/Dictionar=
ies)=20

I think the best would be dictionaries...80)

best regards


----- Mensagem original -----
De: "Lars Nood=C3=A9n" <lars.nooden@gmx.com>
Para: "netfilter" <netfilter@vger.kernel.org>
Enviadas: Quarta-feira, 19 de fevereiro de 2020 4:44:51
Assunto: Automatically maintaining unique list of addresses

If I add an IP address multiple times, I end up with it in the ruleset
three times.  Is there an easy way to try to add IP addresses such that
they aren't duplicated?

/Lars

$ sudo nft add rule ip filter4 input ip \
=09saddr 198.51.100.209 counter reject

$ sudo nft add rule ip filter4 input ip \
=09saddr 198.51.100.209 counter reject

$ sudo nft add rule ip filter4 input ip \
=09saddr 198.51.100.209 counter reject

$ sudo nft list ruleset| grep 51
                ip saddr 198.51.100.209 counter packets 0 bytes 0 reject
                ip saddr 198.51.100.209 counter packets 0 bytes 0 reject
                ip saddr 198.51.100.209 counter packets 0 bytes 0 reject
--=20
Paulo Ricardo Bruck consultor=20
tel 011 3596-4881 011 98140-9184(TIM/Whats)=20
[ http://www.contatogs.com.br/ | http://www.contatogs.com.br ]=20
gpg AAA59989 at wwwkeys.us.pgp.net=20
skype: suportecontatogs
