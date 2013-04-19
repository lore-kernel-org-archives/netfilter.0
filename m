From: Ambroz Bizjak <ambrop7@gmail.com>
Subject: Re: Remote IP in packet sent from WAN to LAN
Date: Fri, 19 Apr 2013 13:13:04 +0200
Message-ID: <CAOA3yK+twroq_pO0Y2H0r_b_h19WGBapdAv3dK_8GDbWpp_mfA@mail.gmail.com>
References: <47E0AF00D6313049B892E93D60AACDCA45C7193D@AMSPRD0410MB361.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:content-type:content-transfer-encoding;
        bh=dnwY0ekHcFMOKhLNFJS4Q3aeLJYHOVf2PU61YTsE3Ak=;
        b=p65BxJvZzv0SfuxGyGR8gBdXwfxIE0ViqjjBgTcdlaKq9miJQ30bAPQp0coQhathu6
         ceKZX1eKkDykAjuNodHnTLukoKFuMMtbzXq1xTGqBrrxg/9rwLS8VBocPaWcEjsgOSi7
         7NP9f9DjGH7uHFs1ffAbe5djA2ufBnhMtnmSyWOLJhzas1wY3Ik4+VVlzm4ouz+neuDd
         fU7mRDJevbB8MRSfvJW2Ucm/OKJP6PNDEGkFy4284ZeOowTycADUpj8uAeI5RTgLrWWA
         xb5my4Cm4U1KJWhwjnKXUoFpPw5gyKAmgtTkAalS1M7BT6pOx+dZEc6h37QodvXOR9t8
         Mn/Q==
In-Reply-To: <47E0AF00D6313049B892E93D60AACDCA45C7193D@AMSPRD0410MB361.eurprd04.prod.outlook.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Do you mean that when an internal client connects to the extrernal
address of the server (as forwarded by the router), the server sees
the router itself connecting?

I believe there is no direct solution to this; if the router was to
state the client's IP address as the source, the client would get the
replies from the server (directly over the LAN), *but* they would have
the source address the internal address of the server, so the client
will discard them (because it expects them to arrive from the external
address).

A workaround is to set up DNS so that the domain name of the server
resolves to the internal address for clients on the LAN.

On Fri, Apr 19, 2013 at 9:40 AM, Piotr Paw=C5=82owski
<piotr.pawlowski@goyello.com> wrote:
> Hi All,
>
> I have iptables-based router which provides access to the Internet fo=
r servers in LAN.
> Question is: is it possible to somehow 'forward' remote IP address th=
rough this router? I have WWW server inside LAN and would like to have =
reliable access logs. However, right now the only IP address visible in=
 those logs is router one.
>
> Thank you in advance for information.
>
> Best Regards
> ---
> Piotr Paw=C5=82owski
>
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
