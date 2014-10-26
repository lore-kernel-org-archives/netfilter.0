From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: please add a command to drop all nft tables
Date: Sun, 26 Oct 2014 21:18:15 +0100
Message-ID: <CAOkSjBhFGNBVOd-FePRrfYa3jreLGQ+-f-WbMJWG9nsCVfnz5w@mail.gmail.com>
References: <87d29ed325.fsf@jidanni.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=OWWsFahcEN1qbSLxTQdPL33og6IT8tvHMKOYsFD9ql8=;
        b=0dhJl7vSpyTpPIGW1B24Hj9+r5EHBtIZoW9W09jG8U00zsz0B7AZPzq3jmCuKKu1+l
         NvjuDrJejIACDO9Itf1TMb1pikuW0gZgW20BpQUWfJakATqwxiL/RtYMGobMuUyTbaw+
         A9xA4PvmaMPeyKjZTFAgEJEEq1rkIFa1coQe5R8P2aTKv2p/PrcF91yZ/0w36M3DVTh2
         uY2hgXXfI0pohtVuVxg8DkSEU4qdBH6wVp64t4FLkhFeGpQ/CBalDbnnJdBtowoIcRF5
         LFHXSbCJuTrt0PYYrKo9AQhth4Io1Fdd7lahY0viY+OnrPwr1BGeZ1n1tbTYEkniK/+l
         MiTQ==
In-Reply-To: <87d29ed325.fsf@jidanni.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?56mN5Li55bC8IERhbiBKYWNvYnNvbg==?= <jidanni@jidanni.org>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 26 October 2014 20:49, =E7=A9=8D=E4=B8=B9=E5=B0=BC Dan Jacobson <jid=
anni@jidanni.org> wrote:
> Please add a single command to drop all nft tables.
> I recall in iptables there was one.

The next release of nftables will include `nft flush ruleset' that
will wipe all rules, tables, chains, etc..

regards.

--=20
Arturo Borrero Gonz=C3=A1lez
